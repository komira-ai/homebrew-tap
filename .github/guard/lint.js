'use strict';
// A lint of the tap's two workflows, as text. It pins what the repository ruleset and the security argument depend on: the job
// names (the ruleset requires status checks by those names), the triggers, no matrix (a matrix suffixes the check name), and
// that the guard never touches pull request code. Plain module; `problems` returns a list, empty when the files are as pinned.

const has = (text, re) => re.test(text);
const code = (text) => text.split('\n').filter((l) => !/^[ \t]*#/.test(l)).join('\n');

// The block of `permissions:` at the given indentation, as a sorted list of "scope: level".
function permissions(text, indent) {
  const lines = text.split('\n');
  const head = new RegExp('^' + ' '.repeat(indent) + 'permissions:[ \\t]*$');
  const i = lines.findIndex((l) => head.test(l));
  if (i < 0) return null;
  const out = [];
  const item = new RegExp('^' + ' '.repeat(indent + 2) + '([a-z-]+):[ \\t]*([a-z]+)[ \\t]*$');
  for (let j = i + 1; j < lines.length; j++) {
    const m = item.exec(lines[j]);
    if (!m) break;
    out.push(m[1] + ': ' + m[2]);
  }
  return out.sort();
}

// The body of the one `script: |` block, dedented, or null. Read from the raw text: the body is what the job executes.
function scriptBody(text) {
  const lines = text.split('\n');
  const i = lines.findIndex((l) => /^[ \t]*script:[ \t]*\|[ \t]*$/.test(l));
  if (i < 0) return null;
  const indent = /^[ \t]*/.exec(lines[i])[0].length;
  const body = [];
  for (let j = i + 1; j < lines.length; j++) {
    if (lines[j].trim() !== '' && /^[ \t]*/.exec(lines[j])[0].length <= indent) break;
    body.push(lines[j].slice(indent + 2));
  }
  return body.join('\n').trim();
}

// The guard's decision lines: the module is called, awaited, with the bot login from the environment and nothing else.
const GUARD_BODY = [
  "const { run } = require(process.env.GITHUB_WORKSPACE + '/.github/guard/guard.js');",
  'await run({ github, context, core, botLogin: process.env.BOT_LOGIN });',
].join('\n');

// A skipped job (or a skipped step of a job) reports success to a required check, so no `if:` is allowed in either workflow.
// Also catches the quoted key and the flow-mapping form.
const IF_RE = /(?:^|[\s{,])["']?if["']?[ \t]*:/m;

// A `key:` anywhere, also quoted or inside a flow mapping.
const keyRe = (k) => new RegExp('(?:^|[\\s{,])["\']?' + k + '["\']?[ \\t]*:', 'm');

// `runner` is the one hosted image the job runs on: a self-hosted label, a larger runner or another image is not pinned.
function common(name, text, p, runner) {
  const runsOn = (text.match(/runs-on/g) || []).length;
  if (runsOn !== 1 || !new RegExp('^    runs-on: ' + runner.replace(/[.-]/g, '\\$&') + '[ \\t]*$', 'm').test(text)) {
    p.push(name + ': runs-on is not exactly one "runs-on: ' + runner + '" job line (the pinned hosted image)');
  }
  if (has(text, IF_RE)) p.push(name + ': an if: condition is declared (a skipped job or step passes a required check)');
  if (has(text, /\bmatrix\b/) || has(text, /^[ \t]*strategy:/m)) p.push(name + ': a matrix or strategy is declared (it would suffix the check name)');
  if (has(text, /\bsecrets\./)) p.push(name + ': a secret is referenced');
  if (has(text, /continue-on-error/)) p.push(name + ': continue-on-error is set');
  if (has(text, /workflow_dispatch|workflow_run|schedule:/)) p.push(name + ': an extra trigger is declared');
  const uses = [...text.matchAll(/^[ \t]*-?[ \t]*uses:[ \t]*(\S+)/gm)].map((m) => m[1]);
  for (const u of uses) {
    if (!/^actions\/[a-z-]+@[0-9a-f]{40}$/.test(u)) p.push(name + ': action ' + u + ' is not a GitHub-owned action pinned by commit');
  }
}

function guard(text) {
  const p = [];
  const t = code(text);
  common('guard', t, p, 'ubuntu-24.04');
  // The script step runs with the workflow's own token (read-only, per the permissions below); an input that swaps in another
  // token would put a stronger credential in reach of the script. `types:` narrows the events the guard runs on, so a PR
  // action outside the list would skip the required check.
  if (has(t, keyRe('github-token'))) p.push('guard: a github-token input is declared (the script must run with the workflow token)');
  if (has(t, keyRe('types'))) p.push('guard: types: is declared on the trigger (an event outside the list would skip the required check)');
  if (!has(t, /^on:\n  pull_request_target:\n/m)) p.push('guard: the trigger is not pull_request_target');
  if (has(t, /^  pull_request:/m) || has(t, /^  push:/m)) p.push('guard: an extra trigger is declared');
  if (!has(t, /^jobs:\n  guard:\n    name: guard\n/m)) p.push('guard: the job is not "guard" named "guard"');
  if ((t.match(/^  [a-z_-]+:[ \t]*$/gm) || []).filter((l) => !/^  (pull_request_target|guard):/.test(l)).length > 0) p.push('guard: more than one job or trigger key');
  const perms = permissions(t, 4);
  if (perms === null || perms.join(',') !== 'contents: read,pull-requests: read') p.push('guard: job permissions are not exactly contents: read, pull-requests: read');
  const top = permissions(t, 0);
  if (top === null || top.join(',') !== 'contents: read') p.push('guard: workflow permissions are not exactly contents: read');
  // Pull request code: never checked out, never named by a ref, never interpolated into a step.
  if (has(t, /pull_request\.head/) || has(t, /head_ref/) || has(t, /refs\/pull\//) || has(t, /github\.event\.pull_request\.merge/)) p.push('guard: the pull request head is referenced');
  const checkouts = t.split('\n').filter((l) => /uses:[ \t]*actions\/checkout@/.test(l)).length;
  if (checkouts !== 1) p.push('guard: expected exactly one checkout (of the base), found ' + checkouts);
  if (!has(t, /ref: \$\{\{ github\.event\.pull_request\.base\.sha \}\}/)) p.push('guard: the checkout is not of the base sha');
  if (!has(t, /persist-credentials: false/)) p.push('guard: checkout keeps credentials');
  if (has(t, /^[ \t]*(?:-[ \t]+)?run:/m)) p.push('guard: a run step executes shell');
  if (!has(t, /^      BOT_LOGIN: \$\{\{ vars\.TAP_BOT_LOGIN \}\}[ \t]*$/m)) p.push('guard: BOT_LOGIN is not exactly the job env "BOT_LOGIN: ${{ vars.TAP_BOT_LOGIN }}"');
  if (!has(t, /^      - name: Path guard\n        uses: actions\/github-script@[0-9a-f]{40}/m)) p.push('guard: the step "Path guard" is not the github-script step');
  if ((t.match(/^[ \t]*(?:-[ \t]+)?script:/gm) || []).length !== 1) p.push('guard: expected exactly one script: key');
  if (scriptBody(text) !== GUARD_BODY) p.push('guard: the github-script body is not exactly the two pinned lines (run(...) with process.env.BOT_LOGIN)');
  return p;
}

function check(text) {
  const p = [];
  const t = code(text);
  common('check', t, p, 'macos-14');
  if (has(t, /pull_request_target/)) p.push('check: runs on pull_request_target');
  if (!has(t, /^  pull_request:\n/m)) p.push('check: no pull_request trigger');
  if (!has(t, /^  push:\n    branches: \[main\]\n/m)) p.push('check: no push trigger on main');
  if (!has(t, /^jobs:\n  check:\n    name: check\n/m)) p.push('check: the job is not "check" named "check"');
  // The tests of the guard and of this lint run on the hosted runner, as a step that fails the job (no `|| true`).
  if (!has(t, /^      - name: Guard and lint tests\n        run: node --test test\/guard_test\.js test\/lint_test\.js[ \t]*$/m)) p.push('check: the step "Guard and lint tests" is not exactly "node --test test/guard_test.js test/lint_test.js"');
  // The live fixture is copied into the tapped copy and listed among the formulae that the audit, style, install and test steps loop over.
  if (!has(t, /^      - name: Live fixture\n(?:.*\n)*?        run: \|\n(?:.*\n)*?            cp test\/fixtures\/mopm_live\.rb "\$tap\/Formula\/mopm\.rb"\n(?:.*\n)*?            echo mopm >> "\$RUNNER_TEMP\/formulae"\n/m)) p.push('check: the step "Live fixture" does not copy test/fixtures/mopm_live.rb into the tap and list mopm among the formulae');
  if (!has(t, /grep -Eq '\^\(\\\.github\|test\)\/' "\$RUNNER_TEMP\/touched"/)) p.push('check: the live fixture is not chosen by a change under .github/ or test/');
  const jobs = [...t.matchAll(/^  ([a-z_-]+):[ \t]*$/gm)].map((m) => m[1]).filter((k) => k !== 'pull_request' && k !== 'push');
  if (jobs.join(',') !== 'check') p.push('check: jobs are ' + JSON.stringify(jobs) + ', expected only check');
  const top = permissions(t, 0);
  if (top === null || top.join(',') !== 'contents: read') p.push('check: workflow permissions are not exactly contents: read');
  const perms = permissions(t, 4);
  if (perms !== null && perms.join(',') !== 'contents: read') p.push('check: job permissions are not exactly contents: read');
  return p;
}

module.exports = { guard, check, permissions };
