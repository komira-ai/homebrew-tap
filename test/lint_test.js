'use strict';
// Runs the lint (.github/guard/lint.js) over the real workflow files, which must be clean, and over mutated copies of them,
// each of which must be reported for the stated reason. A mutation that changes nothing fails the test (so a stale needle
// cannot make a case pass).
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const lint = require('../.github/guard/lint.js');

const dir = path.join(__dirname, '..', '.github', 'workflows');
const guardText = fs.readFileSync(path.join(dir, 'guard.yml'), 'utf8');
const checkText = fs.readFileSync(path.join(dir, 'check.yml'), 'utf8');

const { test } = require('node:test');

test('guard.yml is clean', () => assert.deepEqual(lint.guard(guardText), []));
test('check.yml is clean', () => assert.deepEqual(lint.check(checkText), []));

const mutate = (text, from, to) => {
  assert.ok(text.includes(from), 'needle not in the workflow: ' + from);
  return text.replace(from, to);
};

const reported = (which, name, from, to, reason) => test(which + ' mutant: ' + name, () => {
  const text = which === 'guard' ? guardText : checkText;
  const p = lint[which](mutate(text, from, to));
  assert.ok(p.some((x) => x.includes(reason)), 'expected a problem containing ' + JSON.stringify(reason) + ', got ' + JSON.stringify(p));
});

// guard.yml
reported('guard', 'trigger pull_request instead of pull_request_target', 'pull_request_target:', 'pull_request:', 'trigger is not pull_request_target');
reported('guard', 'job renamed', '  guard:\n    name: guard\n', '  guard2:\n    name: guard\n', 'the job is not "guard" named "guard"');
reported('guard', 'job display name changed', '    name: guard\n', '    name: Guard\n', 'the job is not "guard" named "guard"');
reported('guard', 'a matrix', '    timeout-minutes: 10\n', '    timeout-minutes: 10\n    strategy:\n      matrix:\n        os: [a]\n', 'matrix or strategy');
reported('guard', 'write permission on contents', '      contents: read\n      pull-requests: read\n', '      contents: write\n      pull-requests: read\n', 'job permissions');
reported('guard', 'write permission on pull requests', '      pull-requests: read\n', '      pull-requests: write\n', 'job permissions');
reported('guard', 'an extra permission', '      pull-requests: read\n', '      pull-requests: read\n      id-token: read\n', 'job permissions');
reported('guard', 'workflow permissions widened', 'permissions:\n  contents: read\n\nconcurrency', 'permissions:\n  contents: write\n\nconcurrency', 'workflow permissions');
reported('guard', 'checkout of the pull request head', '${{ github.event.pull_request.base.sha }}', '${{ github.event.pull_request.head.sha }}', 'pull request head is referenced');
reported('guard', 'checkout of head_ref', 'ref: ${{ github.event.pull_request.base.sha }}', 'ref: ${{ github.head_ref }}', 'pull request head is referenced');
reported('guard', 'checkout of the merge ref', 'ref: ${{ github.event.pull_request.base.sha }}', 'ref: refs/pull/7/merge', 'pull request head is referenced');
reported('guard', 'checkout without a ref', '          ref: ${{ github.event.pull_request.base.sha }}\n', '', 'not of the base sha');
reported('guard', 'credentials kept', 'persist-credentials: false', 'persist-credentials: true', 'keeps credentials');
reported('guard', 'a second checkout', '      - name: Path guard\n', '      - uses: actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1\n      - name: Path guard\n', 'exactly one checkout');
reported('guard', 'a shell step', '      - name: Path guard\n', '      - run: echo hi\n      - name: Path guard\n', 'executes shell');
reported('guard', 'a secret', '      BOT_LOGIN:', '      S: ${{ secrets.X }}\n      BOT_LOGIN:', 'secret is referenced');
reported('guard', 'a literal bot login', '${{ vars.TAP_BOT_LOGIN }}', 'someone[bot]', 'vars.TAP_BOT_LOGIN');
reported('guard', 'an extra trigger', 'on:\n  pull_request_target:\n    branches: [main]\n', 'on:\n  pull_request_target:\n    branches: [main]\n  push:\n    branches: [main]\n', 'extra trigger');
reported('guard', 'workflow_dispatch', 'on:\n  pull_request_target:\n    branches: [main]\n', 'on:\n  pull_request_target:\n    branches: [main]\n  workflow_dispatch:\n', 'extra trigger');
reported('guard', 'a second job', 'jobs:\n  guard:\n', 'jobs:\n  other:\n    runs-on: x\n  guard:\n', 'more than one job');
reported('guard', 'an action pinned by tag', 'actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1', 'actions/checkout@v7', 'pinned by commit');
reported('guard', 'a third-party action', 'actions/github-script@3a2844b7e9c422d3c10d287c895573f7108da1b3', 'evil/script@3a2844b7e9c422d3c10d287c895573f7108da1b3', 'pinned by commit');
reported('guard', 'continue-on-error', '    timeout-minutes: 10\n', '    timeout-minutes: 10\n    continue-on-error: true\n', 'continue-on-error');

// guard.yml: the decision lines, and no skipping (a skipped job or step reports success to a required check)
const BODY_CALL = "            await run({ github, context, core, botLogin: process.env.BOT_LOGIN });\n";
reported('guard', 'the github-script body not awaiting run', 'await run(', 'run(', 'github-script body');
reported('guard', 'the github-script body with a literal bot login', 'botLogin: process.env.BOT_LOGIN', "botLogin: 'tap[bot]'", 'github-script body');
reported('guard', 'the github-script body with no bot login', 'botLogin: process.env.BOT_LOGIN', 'botLogin: undefined', 'github-script body');
reported('guard', 'the github-script body swallowing the refusal', BODY_CALL, BODY_CALL.replace(');\n', ').catch(() => {});\n'), 'github-script body');
reported('guard', 'the github-script body returning before run', BODY_CALL, '            return;\n' + BODY_CALL, 'github-script body');
reported('guard', 'the github-script body with another module', "'/.github/guard/guard.js'", "'/other.js'", 'github-script body');
reported('guard', 'the github-script body with an extra statement', BODY_CALL, BODY_CALL + '            core.info("x");\n', 'github-script body');
reported('guard', 'the bot login read from a different variable', '${{ vars.TAP_BOT_LOGIN }}', '${{ vars.OTHER }}', 'vars.TAP_BOT_LOGIN');
reported('guard', 'the Path guard step renamed', '      - name: Path guard\n', '      - name: Path check\n', 'the step "Path guard"');
reported('guard', 'if: on the guard job', '    timeout-minutes: 10\n', "    timeout-minutes: 10\n    if: github.actor != 'x'\n", 'if: condition');
reported('guard', 'if: on the Path guard step', '        uses: actions/github-script@', "        if: github.actor != 'x'\n        uses: actions/github-script@", 'if: condition');
reported('guard', 'if: on the checkout step', '      - uses: actions/checkout@', "      - if: false\n        uses: actions/checkout@", 'if: condition');
reported('guard', 'a quoted if: key', '    timeout-minutes: 10\n', '    "if": false\n    timeout-minutes: 10\n', 'if: condition');
reported('guard', 'if: in a flow mapping', '      - name: Path guard\n', '      - { if: false, run: x }\n      - name: Path guard\n', 'if: condition');

// guard.yml: the script step runs with the workflow token, the trigger lists no activity types, the runner is the pinned image
reported('guard', 'a github-token input on the script step', '        with:\n          script: |', '        with:\n          github-token: ${{ vars.OTHER }}\n          script: |', 'github-token input');
reported('guard', 'a quoted github-token input', '        with:\n          script: |', '        with:\n          "github-token": x\n          script: |', 'github-token input');
reported('guard', 'types: on the trigger', '  pull_request_target:\n    branches: [main]\n', '  pull_request_target:\n    types: [opened]\n    branches: [main]\n', 'types: is declared');
reported('guard', 'types: in a flow mapping', '  pull_request_target:\n    branches: [main]\n', '  pull_request_target: { types: [opened], branches: [main] }\n', 'types: is declared');
reported('guard', 'a self-hosted runner', 'runs-on: ubuntu-24.04', 'runs-on: self-hosted', 'runs-on is not exactly');
reported('guard', 'a larger hosted runner', 'runs-on: ubuntu-24.04', 'runs-on: ubuntu-24.04-xl', 'runs-on is not exactly');
reported('guard', 'ubuntu-latest', 'runs-on: ubuntu-24.04', 'runs-on: ubuntu-latest', 'runs-on is not exactly');
reported('guard', 'a runner list', 'runs-on: ubuntu-24.04', 'runs-on: [ubuntu-24.04, self-hosted]', 'runs-on is not exactly');
reported('guard', 'runs-on removed', '    runs-on: ubuntu-24.04\n', '', 'runs-on is not exactly');
reported('guard', 'a second runs-on', '    timeout-minutes: 10\n', '    timeout-minutes: 10\n    runs-on: ubuntu-24.04\n', 'runs-on is not exactly');
reported('guard', 'a runner that only starts like the pin', 'runs-on: ubuntu-24.04', 'runs-on: ubuntu-24x04', 'runs-on is not exactly');

// check.yml
reported('check', 'a runner other than macos-14', 'runs-on: macos-14', 'runs-on: macos-latest', 'runs-on is not exactly');
reported('check', 'a self-hosted runner', 'runs-on: macos-14', 'runs-on: [self-hosted, macOS]', 'runs-on is not exactly');
reported('check', 'if: on the check job', '    timeout-minutes: 30\n', "    timeout-minutes: 30\n    if: github.event_name == 'push'\n", 'if: condition');
reported('check', 'if: on a step', '      - name: Tap this checkout\n', '      - name: Tap this checkout\n        if: false\n', 'if: condition');
reported('check', 'the test step removed', '      - name: Guard and lint tests\n        run: node --test test/guard_test.js test/lint_test.js\n', '', 'Guard and lint tests');
reported('check', 'the test step ignoring failure', 'test/lint_test.js\n', 'test/lint_test.js || true\n', 'Guard and lint tests');
reported('check', 'the test step running only the guard tests', ' test/lint_test.js\n', '\n', 'Guard and lint tests');
reported('check', 'the test step set to continue on error', '      - name: Guard and lint tests\n', '      - name: Guard and lint tests\n        continue-on-error: true\n', 'continue-on-error');
reported('check', 'the test step renamed', 'name: Guard and lint tests', 'name: Tests', 'Guard and lint tests');
reported('check', 'no pull_request trigger', '  pull_request:\n    branches: [main]\n', '', 'no pull_request trigger');
reported('check', 'no push trigger', '  push:\n    branches: [main]\n', '', 'no push trigger on main');
reported('check', 'push on another branch', '  push:\n    branches: [main]\n', '  push:\n    branches: [dev]\n', 'no push trigger on main');
reported('check', 'pull_request_target', '  pull_request:\n    branches: [main]\n', '  pull_request_target:\n    branches: [main]\n', 'pull_request_target');
reported('check', 'job renamed', '  check:\n    name: check\n', '  verify:\n    name: check\n', 'the job is not "check" named "check"');
reported('check', 'job display name changed', '    name: check\n', '    name: Check (macOS)\n', 'the job is not "check" named "check"');
reported('check', 'a matrix', '    timeout-minutes: 30\n', '    timeout-minutes: 30\n    strategy:\n      matrix:\n        os: [macos-14]\n', 'matrix or strategy');
reported('check', 'a second job', 'jobs:\n  check:\n', 'jobs:\n  other:\n    runs-on: x\n  check:\n', 'jobs are');
reported('check', 'a secret', '      HOMEBREW_NO_ANALYTICS: "1"\n', '      HOMEBREW_NO_ANALYTICS: "1"\n      T: ${{ secrets.TOKEN }}\n', 'secret is referenced');
reported('check', 'write permission', 'permissions:\n  contents: read\n\nconcurrency', 'permissions:\n  contents: write\n\nconcurrency', 'workflow permissions');
reported('check', 'job write permission', '    timeout-minutes: 30\n', '    timeout-minutes: 30\n    permissions:\n      contents: write\n', 'job permissions');
reported('check', 'a schedule', 'on:\n', 'on:\n  schedule:\n    - cron: "0 0 * * *"\n', 'extra trigger');
reported('check', 'an action pinned by tag', 'actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1', 'actions/checkout@main', 'pinned by commit');

reported('check', 'the live fixture step not copying the fixture', 'cp test/fixtures/mopm_live.rb', 'cp test/fixtures/mopm.rb', 'Live fixture');
reported('check', 'the live fixture step not listing mopm', '            echo mopm >> "$RUNNER_TEMP/formulae"\n', '', 'Live fixture');
reported('check', 'the live fixture step removed', '      - name: Live fixture\n', '      - name: Something else\n', 'Live fixture');
reported('check', 'the buildrules live fixture step not copying its fixture', 'cp test/fixtures/buildrules_live.rb', 'cp test/fixtures/mopm_live.rb', 'Live fixture (buildrules)');
reported('check', 'the buildrules live fixture step not listing buildrules', '            echo buildrules >> "$RUNNER_TEMP/formulae"\n', '', 'Live fixture (buildrules)');
reported('check', 'the buildrules live fixture step removed', '      - name: Live fixture (buildrules)\n', '      - name: Something else\n', 'Live fixture (buildrules)');
reported('check', 'the live fixture chosen by a change under .github/ only', "'^(\\.github|test)/'", "'^(\\.github)/'", 'live fixture is not chosen');
test('a comment that mentions a matrix, a secret or pull_request_target is not a finding', () => {
  const text = checkText.replace('name: check\n', 'name: check\n# matrix secrets.X pull_request_target workflow_dispatch\n');
  assert.deepEqual(lint.check(text), []);
});

test('permissions reads a block and returns null when absent', () => {
  assert.deepEqual(lint.permissions('permissions:\n  b: read\n  a: write\nx: 1\n', 0), ['a: write', 'b: read']);
  assert.equal(lint.permissions('x: 1\n', 0), null);
});

