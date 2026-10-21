'use strict';
// Tests of .github/guard/guard.js against a fake of the parts of the GitHub API it uses. Run with node's built-in test runner
// (`node --test test/guard_test.js`); no dependencies. Every refusal path of the guard has a case here, and each case checks
// the refusal's reason, so a case cannot pass because some other check refused first.
//
// The guard accepts a formula only if it is, line for line, what the release tool's renderer writes. `renderFormula` below is
// this file's own writer of that text (not the guard's template); a test pins it byte for byte to the renderer's golden in
// test/fixtures, so the other tests build their formulas from something that is known to be the renderer's output.
const assert = require('node:assert/strict');
const g = require('../.github/guard/guard.js');

const OWNER = 'acme';
const BOT = 'tap-bot[bot]';
const HEAD = 'h'.repeat(40);
const BASE = 'b'.repeat(40);

const SUMS = { macos: 'c'.repeat(64), linuxArm: 'a'.repeat(64), linuxX86: 'b'.repeat(64) };
function renderFormula(o = {}) {
  const owner = o.owner || OWNER;
  const name = o.name || 'tool';
  const version = o.version || '1.2.3';
  const desc = 'desc' in o ? o.desc : 'A tool';
  const homepage = 'homepage' in o ? o.homepage : 'https://tool.example';
  const license = 'license' in o ? o.license : 'MIT';
  const sums = o.sums || SUMS;
  const cls = name.split('-').map((w) => w[0].toUpperCase() + w.slice(1)).join('');
  const file = (suffix) => 'https://github.com/' + owner + '/' + name + '/releases/download/v' + version + '/' + name + '-' + version + '-' + suffix + '.tar.gz';
  return [
    'class ' + cls + ' < Formula',
    '  desc "' + desc + '"',
    '  homepage "' + homepage + '"',
    '  version "' + version + '"',
    '  license "' + license + '"',
    '',
    '  on_macos do',
    '    on_arm do',
    '      url "' + file('macos-arm64') + '"',
    '      sha256 "' + sums.macos + '"',
    '    end',
    '  end',
    '',
    '  on_linux do',
    '    on_arm do',
    '      url "' + file('linux-aarch64') + '"',
    '      sha256 "' + sums.linuxArm + '"',
    '    end',
    '    on_intel do',
    '      url "' + file('linux-x86_64') + '"',
    '      sha256 "' + sums.linuxX86 + '"',
    '    end',
    '  end',
    '',
    '  def install',
    '    bin.install "' + name + '"',
    '  end',
    '',
    '  test do',
    '    assert_match "' + name + ' #{version}", shell_output("#{bin}/' + name + ' --version")',
    '  end',
    'end',
    '',
  ].join('\n');
}
const formulaText = (version, owner, name) => renderFormula({ version, owner, name });

const err = (status) => Object.assign(new Error('http ' + status), { status });

// A pull request that passes every check; `o` overrides parts of it.
function scenario(o = {}) {
  const owner = o.owner || OWNER;
  const formula = o.formula || 'tool';
  const version = o.version || '1.2.3';
  const calls = { content: [], refs: [] };
  const pr = Object.assign({
    number: 7,
    user: { login: BOT, type: 'Bot' },
    head: { ref: 'bump/' + formula + '-v' + version, sha: HEAD, repo: { full_name: owner + '/tap' } },
    base: { sha: BASE, repo: { full_name: owner + '/tap' } },
  }, o.pr || {});
  const files = o.files || [{ filename: 'Formula/' + formula + '.rb', status: 'added' }];
  const texts = {
    [HEAD]: 'head' in o ? o.head : formulaText(version, owner, formula),
    [BASE]: 'base' in o ? o.base : null,
  };
  const github = {
    paginate: async (fn, params) => { assert.equal(fn, github.rest.pulls.listFiles); assert.equal(params.pull_number, 7); return files; },
    rest: {
      pulls: { listFiles: () => assert.fail('listFiles is only passed to paginate') },
      repos: {
        getContent: async ({ owner, repo, path, ref }) => {
          calls.content.push({ owner, repo, path, ref });
          if (o.contentError && o.contentError.ref === ref) throw err(o.contentError.status);
          if (o.dir && o.dir === ref) return { data: [{ name: 'x' }] };
          const t = texts[ref];
          if (t === null || t === undefined) throw err(404);
          return { data: { content: Buffer.from(t, 'utf8').toString('base64') } };
        },
      },
      git: {
        getRef: async ({ owner, repo, ref }) => {
          calls.refs.push({ owner, repo, ref });
          if (o.tagStatus) throw err(o.tagStatus);
          return { data: {} };
        },
      },
    },
  };
  const infos = [];
  return {
    calls, infos,
    ctx: { github, context: { payload: { pull_request: pr }, repo: { owner, repo: 'tap' } }, core: { info: (s) => infos.push(s) }, botLogin: 'botLogin' in o ? o.botLogin : BOT },
  };
}

const { test } = require('node:test');

const refused = async (name, o, reason) => test('refuses: ' + name, async () => {
  const s = scenario(o);
  await assert.rejects(() => g.decide(s.ctx), (e) => {
    assert.ok(e instanceof g.Refusal, 'expected a Refusal, got ' + e);
    assert.ok(e.message.startsWith('path guard refused: '), e.message);
    assert.ok(e.message.includes(reason), 'reason ' + JSON.stringify(reason) + ' not in ' + JSON.stringify(e.message));
    return true;
  });
});

// ---- the accepted cases ----
test('accepts a new formula', async () => {
  const s = scenario();
  const r = await g.decide(s.ctx);
  assert.deepEqual(r, { formula: 'tool', version: '1.2.3', path: 'Formula/tool.rb' });
  assert.deepEqual(s.calls.refs, [{ owner: OWNER, repo: 'tool', ref: 'tags/v1.2.3' }]);
  assert.deepEqual(s.calls.content.map((c) => c.ref), [HEAD, BASE]);
  assert.ok(s.calls.content.every((c) => c.path === 'Formula/tool.rb' && c.repo === 'tap'));
});
test('run reports through core.info and returns the decision', async () => {
  const s = scenario();
  const r = await g.run(s.ctx);
  assert.equal(r.version, '1.2.3');
  assert.equal(s.infos.length, 1);
  assert.match(s.infos[0], /Formula\/tool\.rb at 1\.2\.3 is allowed/);
});
test('accepts a higher version over the base, including 1.10.0 over 1.9.0', async () => {
  const s = scenario({ version: '1.10.0', files: [{ filename: 'Formula/tool.rb', status: 'modified' }], base: formulaText('1.9.0') });
  assert.equal((await g.decide(s.ctx)).version, '1.10.0');
});
// ---- who and where ----
refused('no bot login configured', { botLogin: '' }, 'bot login is not configured');
refused('undefined bot login', { botLogin: undefined }, 'bot login is not configured');
refused('another author', { pr: { user: { login: 'someone', type: 'Bot' } } }, 'author is someone');
refused('the bot login with the type User', { pr: { user: { login: BOT, type: 'User' } } }, 'author is');
refused('a fork', { pr: { head: { ref: 'bump/tool-v1.2.3', sha: HEAD, repo: { full_name: 'evil/tap' } } } }, 'fork');
refused('a deleted fork (null head repo)', { pr: { head: { ref: 'bump/tool-v1.2.3', sha: HEAD, repo: null } } }, 'fork');

// ---- the branch ----
for (const ref of ['feature/x', 'bump/tool', 'bump/tool-v1.2', 'bump/tool-v01.2.3', 'bump/tool-v1.2.3-rc.1', 'bump/tool-v1.2.3+b', 'bump/Tool-v1.2.3', 'bump/-v1.2.3', 'xbump/tool-v1.2.3', 'bump/tool-v1.2.3/x', 'bump/tool-v1.2.3\n']) {
  refused('branch ' + JSON.stringify(ref), { pr: { head: { ref, sha: HEAD, repo: { full_name: OWNER + '/tap' } } } }, 'is not bump/<formula>-v<X.Y.Z>');
}

for (const name of ['to.ol', 'to_ol', 'to..ol', '_tool', 'tool_']) {
  refused('formula name ' + JSON.stringify(name) + ' (only a-z, 0-9 and - are allowed)', { pr: { head: { ref: 'bump/' + name + '-v1.2.3', sha: HEAD, repo: { full_name: OWNER + '/tap' } } } }, 'is not bump/<formula>-v<X.Y.Z>');
}

// ---- the files ----
refused('no file', { files: [] }, '0 files changed');
refused('two files', { files: [{ filename: 'Formula/tool.rb', status: 'added' }, { filename: 'README.md', status: 'modified' }] }, '2 files changed');
refused('another file', { files: [{ filename: 'README.md', status: 'modified' }] }, 'changed file is README.md');
refused('a workflow', { files: [{ filename: '.github/workflows/guard.yml', status: 'modified' }] }, 'nothing under .github/ may change');
refused('a workflow next to the formula (check.yml gaining a job named guard)', { files: [{ filename: 'Formula/tool.rb', status: 'added' }, { filename: '.github/workflows/check.yml', status: 'modified' }] }, 'nothing under .github/ may change');
refused('a new file under .github/', { files: [{ filename: '.github/workflows/extra.yml', status: 'added' }] }, 'nothing under .github/ may change');
refused('a removed file under .github/', { files: [{ filename: '.github/guard/guard.js', status: 'removed' }] }, 'nothing under .github/ may change');
refused('a rename out of .github/', { files: [{ filename: 'Formula/tool.rb', status: 'renamed', previous_filename: '.github/workflows/check.yml' }] }, 'nothing under .github/ may change');
refused('.GitHub/ in another case', { files: [{ filename: '.GitHub/workflows/check.yml', status: 'modified' }] }, 'nothing under .github/ may change');
refused('a path that merely ends with Formula/tool.rb', { files: [{ filename: 'sub/Formula/tool.rb', status: 'added' }] }, 'changed file is sub/Formula/tool.rb');
refused('a path that merely ends with the formula name', { files: [{ filename: 'xFormula/tool.rb', status: 'added' }] }, 'changed file is xFormula/tool.rb');
test('a file whose name merely starts with .github is not under .github/', async () => {
  const s = scenario({ files: [{ filename: '.github-notes', status: 'added' }] });
  await assert.rejects(() => g.decide(s.ctx), (e) => { assert.ok(e.message.includes('changed file is .github-notes'), e.message); return true; });
});
refused('another formula', { files: [{ filename: 'Formula/other.rb', status: 'added' }] }, 'changed file is Formula/other.rb');
refused('a removed formula', { files: [{ filename: 'Formula/tool.rb', status: 'removed' }] }, 'is removed');
refused('a renamed formula', { files: [{ filename: 'Formula/tool.rb', status: 'renamed', previous_filename: 'Formula/old.rb' }] }, 'is renamed');
refused('a modified formula with a previous filename', { files: [{ filename: 'Formula/tool.rb', status: 'modified', previous_filename: 'Formula/old.rb' }], base: formulaText('1.0.0') }, 'is a rename');
refused('a formula absent at the head', { head: null }, 'is not at the head of the branch');
refused('a directory at the formula path', { dir: HEAD }, 'is not a file');
refused('modified but absent on the base', { files: [{ filename: 'Formula/tool.rb', status: 'modified' }] }, 'is modified but is not on the base');

// ---- the base: monotonic, fail closed ----
const modified = [{ filename: 'Formula/tool.rb', status: 'modified' }];
refused('the same version as the base', { files: modified, base: formulaText('1.2.3') }, 'is not higher than 1.2.3');
refused('a lower version than the base', { files: modified, base: formulaText('1.3.0') }, 'is not higher than 1.3.0');
refused('a lower version by a longer number (1.2.3 vs 1.2.10)', { files: modified, base: formulaText('1.2.10') }, 'is not higher than 1.2.10');
refused('a base with no version line', { files: modified, base: formulaText('1.0.0').replace('  version "1.0.0"\n', '') }, '0 version lines');
refused('a base with two version lines', { files: modified, base: formulaText('1.0.0').replace('  desc "A tool"', '  version "1.0.0"\n  desc "A tool"') }, '2 version lines');
refused('a base with a non-X.Y.Z version', { files: modified, base: formulaText('1.0.0').replace('version "1.0.0"', 'version "latest"') }, 'not X.Y.Z');
refused('a base with a prerelease version', { files: modified, base: formulaText('1.0.0').replace('version "1.0.0"', 'version "1.0.0-rc.1"') }, 'not X.Y.Z');
refused('an added file that is already on the base at a higher version', { base: formulaText('2.0.0') }, 'is not higher than 2.0.0');

// ---- the tag ----
refused('a tag that does not exist', { tagStatus: 404 }, 'tag v1.2.3 does not exist in ' + OWNER + '/tool');

// ---- API failures are not refusals and are not swallowed ----
for (const [name, o] of [
  ['a server error reading the tag', { tagStatus: 500 }],
  ['a server error reading the head', { contentError: { ref: HEAD, status: 500 } }],
  ['a server error reading the base', { contentError: { ref: BASE, status: 502 } }],
]) {
  test('propagates ' + name, async () => {
    await assert.rejects(() => g.decide(scenario(o).ctx), (e) => { assert.ok(!(e instanceof g.Refusal)); assert.ok(e.status >= 500); return true; });
  });
}

// ---- the building blocks ----
test('compareSemver orders integers, not strings', () => {
  const c = g.compareSemver;
  assert.equal(c('1.2.3', '1.2.3'), 0);
  assert.equal(c('1.2.4', '1.2.3'), 1);
  assert.equal(c('1.2.3', '1.2.4'), -1);
  assert.equal(c('1.10.0', '1.9.0'), 1);
  assert.equal(c('0.0.9', '0.0.10'), -1);
  assert.equal(c('2.0.0', '1.99.99'), 1);
  assert.equal(c('1.0.0', '2.0.0'), -1);
  assert.equal(c('10.0.0', '9.0.0'), 1);
  assert.equal(c('9007199254740993.0.0', '9007199254740992.0.0'), 1);
});
test('compareSemver is null for anything but X.Y.Z', () => {
  for (const bad of ['1.2', '1.2.3.4', '01.2.3', '1.2.3-rc.1', '1.2.3+b', 'v1.2.3', '', ' 1.2.3', '1.2.3\n', '1.2.x']) {
    assert.equal(g.compareSemver(bad, '1.2.3'), null, bad);
    assert.equal(g.compareSemver('1.2.3', bad), null, bad);
  }
});
test('SEMVER_RE accepts 0.0.0 and rejects the rest', () => {
  assert.ok(g.SEMVER_RE.test('0.0.0') && g.SEMVER_RE.test('10.20.30'));
  assert.ok(!g.SEMVER_RE.test('1.2.3\n') && !g.SEMVER_RE.test('1.02.3') && !g.SEMVER_RE.test('1.2.3-0'));
});
test('BRANCH_RE captures the formula and the version', () => {
  const m = g.BRANCH_RE.exec('bump/foo-v-bar-v1.2.3');
  assert.equal(m[1], 'foo-v-bar');
  assert.equal(m[2], '1.2.3');
  assert.equal(g.BRANCH_RE.exec('bump/foo-v1-v1.2.3')[1], 'foo-v1');
  assert.equal(g.BRANCH_RE.exec('bump/a-v0.0.0')[2], '0.0.0');
  assert.equal(g.BRANCH_RE.exec('bump/a-v1.2.3-rc.1'), null);
});

// ---- the allow-list: the renderer's output, line for line ----
const fs = require('node:fs');
const path = require('node:path');
const fixture = (name) => fs.readFileSync(path.join(__dirname, 'fixtures', name), 'utf8');
const MOPM = { owner: 'komira-ai', formula: 'mopm' };
const golden = fixture('mopm.rb');
const mopmOk = (head, extra) => g.decide(scenario(Object.assign({ head }, MOPM, extra)).ctx);
// Refused for a head formula. `at` is the line number the reason must name (the first differing line).
const mopmRefusedAt = (name, head, at, extra) => refused(name, Object.assign({ head }, MOPM, extra), ' line ' + at + ' ');
const lines = (text) => text.split('\n');
const withLines = (text, f) => f(lines(text)).join('\n');
const GOLDEN_RENDER = { owner: 'komira-ai', name: 'mopm', desc: 'Package manager for Mojo', homepage: 'https://mopm.dev', license: 'Apache-2.0', sums: { macos: 'c'.repeat(64), linuxArm: 'a'.repeat(64), linuxX86: 'b'.repeat(64) } };

test('the test-side renderFormula reproduces the renderer\'s golden byte for byte', () => {
  assert.equal(renderFormula(GOLDEN_RENDER), golden);
});
test('accepts the golden of the real renderer (PR 142 head): three url/sha256 pairs, install, its test block', async () => {
  assert.deepEqual(await mopmOk(golden), { formula: 'mopm', version: '1.2.3', path: 'Formula/mopm.rb' });
});
test('accepts the golden as a bump over the previous golden on the base', async () => {
  const s = scenario(Object.assign({ head: golden, base: golden.replace(/1\.2\.3/g, '1.2.2'), files: [{ filename: 'Formula/mopm.rb', status: 'modified' }] }, MOPM));
  assert.equal((await g.decide(s.ctx)).version, '1.2.3');
});
test('accepts the holes the renderer allows: any plain desc, homepage, license (even the words version and url), any hashes', async () => {
  for (const o of [
    { desc: 'A tool, any version; see url', homepage: 'http://x.org/a?b=1&c=2', license: 'Apache-2.0 OR MIT' },
    { desc: 'Café ☃ tool', homepage: 'https://x' },
    { name: 'my-tool', version: '10.20.30', sums: { macos: '0123456789abcdef'.repeat(4), linuxArm: 'f'.repeat(64), linuxX86: '0'.repeat(64) } },
    { name: 'a', version: '0.0.1' },
    { name: 'tool2-x9', version: '2.0.0' },
  ]) {
    const name = o.name || 'tool';
    const version = o.version || '1.2.3';
    const s = scenario({ formula: name, version, head: renderFormula(o) });
    assert.deepEqual(await g.decide(s.ctx), { formula: name, version, path: 'Formula/' + name + '.rb' }, JSON.stringify(o));
  }
});

// Fixtures the renderer writes under flags the bot never uses, and its output before the Intel Mac release was dropped.
mopmRefusedAt('the renderer without a version line (--no-explicit-version)', fixture('mopm_no_version.rb'), 4);
mopmRefusedAt('the renderer with a file:// base (--url-base)', fixture('mopm_file_url.rb'), 9);
mopmRefusedAt('the renderer before Intel macOS was dropped (on_intel inside on_macos)', fixture('mopm_with_macos_intel.rb'), 12);
mopmRefusedAt('the golden with CRLF line endings', golden.replace(/\n/g, '\r\n'), 1);
mopmRefusedAt('the golden without its final newline', golden.slice(0, -1), 33);
mopmRefusedAt('the golden with a blank line at the end', golden + '\n', 34);
mopmRefusedAt('the golden for a branch of another formula name', golden, 1, { formula: 'other' });
mopmRefusedAt('the golden for a tap of another owner', golden, 9, { owner: 'evil' });
mopmRefusedAt('the golden with a version that is not the branch\'s', golden.replace(/1\.2\.3/g, '1.2.4'), 4);
mopmRefusedAt('the golden whose version line is right but a url is of another release', golden.replace('download/v1.2.3/mopm-1.2.3-linux-aarch64', 'download/v1.2.2/mopm-1.2.3-linux-aarch64'), 16);
mopmRefusedAt('the golden whose url file name carries another version', golden.replace('mopm-1.2.3-linux-x86_64', 'mopm-1.2.2-linux-x86_64'), 20);
mopmRefusedAt('the golden with the macOS file under on_linux', golden.replace('mopm-1.2.3-linux-aarch64', 'mopm-1.2.3-macos-arm64'), 16);
mopmRefusedAt('the golden with the linux targets swapped', golden.replace('linux-aarch64', 'TMP').replace('linux-x86_64', 'linux-aarch64').replace('TMP', 'linux-x86_64'), 16);
mopmRefusedAt('the golden with a macos-x86_64 url in place of the macos-arm64 one', golden.replace('macos-arm64', 'macos-x86_64'), 9);
mopmRefusedAt('the golden with a url of another host', golden.replace('https://github.com/komira-ai/mopm', 'https://example.org/komira-ai/mopm'), 9);
mopmRefusedAt('the golden with a url of another repository', golden.replace('komira-ai/mopm/releases/download/v1.2.3/mopm-1.2.3-linux-x86_64', 'komira-ai/other/releases/download/v1.2.3/mopm-1.2.3-linux-x86_64'), 20);
mopmRefusedAt('the golden with a url with a query', golden.replace('linux-x86_64.tar.gz', 'linux-x86_64.tar.gz?x=1'), 20);
mopmRefusedAt('the golden with a single-quoted url', golden.replace('url "https://github.com/komira-ai/mopm/releases/download/v1.2.3/mopm-1.2.3-macos-arm64.tar.gz"', "url 'https://github.com/komira-ai/mopm/releases/download/v1.2.3/mopm-1.2.3-macos-arm64.tar.gz'"), 9);
mopmRefusedAt('the golden with a single-quoted version', golden.replace('version "1.2.3"', "version '1.2.3'"), 4);
mopmRefusedAt('the golden with the test block\'s command changed', golden.replace('--version")', '--version; id")'), 30);
mopmRefusedAt('the golden with the test line for another name', golden.replace('"mopm #{version}"', '"tool #{version}"'), 30);
mopmRefusedAt('the golden with a test block opened as post_install', golden.replace('  test do', '  post_install do'), 29);

// Every bypass of the earlier deny rules, as a head formula (each was accepted by an earlier guard or is its shape).
const BYPASS_URL = 'url "https://example.org/x.tar.gz"';
mopmRefusedAt('the indentation desync of on_macos and on_intel (a mis-indented end hides the on_intel block)',
  fixture('mopm_with_macos_intel.rb').replace('    end\n  end\n\n  on_linux', '    end\n end\n\n  on_linux'), 12);
mopmRefusedAt('the indentation desync with tabs on the on_macos block',
  golden.replace('  on_macos do\n    on_arm do', '\ton_macos do\n    on_arm do').replace('    end\n  end\n\n  on_linux', '    end\n\tend\n\n  on_linux'), 7);
mopmRefusedAt('a top-level on_intel block after the license', withLines(golden, (l) => [...l.slice(0, 5), '  on_intel do', '    ' + BYPASS_URL, '  end', ...l.slice(5)]), 6);
mopmRefusedAt('a top-level on_intel block at the end of the class', withLines(golden, (l) => [...l.slice(0, 31), '  on_intel do', '    ' + BYPASS_URL, '  end', ...l.slice(31)]), 32);
mopmRefusedAt('a heredoc whose line interpolates url', withLines(golden, (l) => [...l.slice(0, 5), '  x = <<~EOS', '#{url "https://example.org/x"}', '  EOS', ...l.slice(5)]), 6);
mopmRefusedAt('a heredoc whose line is indented before its interpolation', withLines(golden, (l) => [...l.slice(0, 5), '  x = <<~EOS', '    \t#{version "9.9.9"}', '  EOS', ...l.slice(5)]), 6);
mopmRefusedAt('"; version" after the homepage', golden.replace('"https://mopm.dev"', '"https://mopm.dev"; version "9.9.9"'), 3);
mopmRefusedAt('"; version" inside the homepage string', golden.replace('https://mopm.dev', 'https://mopm.dev"; version "9.9.9'), 3);
mopmRefusedAt('send with strings building url', withLines(golden, (l) => [...l.slice(0, 5), '  send("ur" + "l", "https://example.org/x")', ...l.slice(5)]), 6);
mopmRefusedAt('public_send, eval and require lines', withLines(golden, (l) => [...l.slice(0, 5), '  public_send(:u.to_s + "rl", "x"); eval("1"); require "x"', ...l.slice(5)]), 6);
mopmRefusedAt('a desc that closes its string and calls send', golden.replace('Package manager for Mojo', 'x" + send("ur" + "l", "y") + "'), 2);
mopmRefusedAt('a desc that interpolates', golden.replace('Package manager for Mojo', 'x #{system("id")}'), 2);
mopmRefusedAt('a desc with a backslash', golden.replace('Package manager for Mojo', 'x\\'), 2);
mopmRefusedAt('a desc with a tab', golden.replace('Package manager for Mojo', 'x\ty'), 2);
mopmRefusedAt('an empty desc', golden.replace('Package manager for Mojo', ''), 2);
mopmRefusedAt('a license with an interpolation', golden.replace('Apache-2.0', '#{1}'), 5);
mopmRefusedAt('a second class method (an extra def)', withLines(golden, (l) => [...l.slice(0, 24), '  def self.x; end', ...l.slice(24)]), 25);
mopmRefusedAt('a comment line anywhere', withLines(golden, (l) => [...l.slice(0, 5), '  # url "x"', ...l.slice(5)]), 6);
mopmRefusedAt('the Intel Mac release rendered into the linux block', golden.replace('    on_intel do\n      url "https://github.com/komira-ai/mopm/releases/download/v1.2.3/mopm-1.2.3-linux-x86_64.tar.gz"', '    on_intel do\n      url "https://github.com/komira-ai/mopm/releases/download/v1.2.3/mopm-1.2.3-macos-x86_64.tar.gz"'), 20);
mopmRefusedAt('sha256 of 63 digits', golden.replace('c'.repeat(64), 'c'.repeat(63)), 10);
mopmRefusedAt('sha256 of 65 digits', golden.replace('c'.repeat(64), 'c'.repeat(65)), 10);
mopmRefusedAt('sha256 in upper case', golden.replace('c'.repeat(64), 'C'.repeat(64)), 10);
mopmRefusedAt('sha256 that is not hex', golden.replace('c'.repeat(64), 'g'.repeat(64)), 10);
mopmRefusedAt('sha256 with a trailing modifier', golden.replace('c'.repeat(64) + '"', 'c'.repeat(64) + '" if true'), 10);

// The generated test: take every line of the golden and break that one line four ways; each must be refused, and for the
// edits of a line (append, change one character) the reason must name that very line.
const lineOf = (e) => Number(/ line (\d+) /.exec(e.message)[1]);
function mutantsOf(label, text, name, version, owner) {
  const ls = lines(text);
  const tpl = g.template(name, version, owner);
  assert.equal(tpl.length, ls.length, label + ': the template and the text have the same number of lines');
  let n = 0;
  const bad = (ml, why, exactLine) => {
    n++;
    const s = scenario({ owner, formula: name, version, head: ml.join('\n') });
    return assert.rejects(() => g.decide(s.ctx), (e) => {
      assert.ok(e instanceof g.Refusal, label + ' ' + why + ': ' + e);
      if (exactLine !== undefined) assert.equal(lineOf(e), exactLine, label + ' ' + why + ': ' + e.message);
      return true;
    });
  };
  return (async () => {
    for (let i = 0; i < ls.length; i++) {
      await bad(ls.filter((_, j) => j !== i), 'delete line ' + (i + 1));
      await bad([...ls.slice(0, i + 1), ls[i], ...ls.slice(i + 1)], 'duplicate line ' + (i + 1));
      await bad(ls.map((x, j) => (j === i ? x + ' # x' : x)), 'append to line ' + (i + 1), i + 1);
      // one character changed in each literal position of the line (the holes are skipped; the name, version and owner are literals)
      const parts = tpl[i];
      const lits = parts.reduce((a, p) => a + (typeof p === 'string' ? p.length : 0), 0);
      const holeLen = ls[i].length - lits;
      let pos = 0;
      for (const p of parts) {
        const len = typeof p === 'string' ? p.length : holeLen;
        if (typeof p === 'string') {
          for (let k = 0; k < len; k++) {
            const c = ls[i][pos + k];
            const mutated = ls[i].slice(0, pos + k) + (c === '~' ? '!' : '~') + ls[i].slice(pos + k + 1);
            await bad(ls.map((x, j) => (j === i ? mutated : x)), 'change char ' + (pos + k) + ' of line ' + (i + 1), i + 1);
          }
        }
        pos += len;
      }
    }
    return n;
  })();
}
test('every one-line mutant of the golden is refused (delete, duplicate, append " # x", change one literal character)', async () => {
  const n = await mutantsOf('mopm golden', golden, 'mopm', '1.2.3', 'komira-ai');
  assert.ok(n > 700, 'only ' + n + ' mutants were generated');
});
test('every one-line mutant of a formula with a hyphenated name and other holes is refused', async () => {
  const o = { owner: 'acme', name: 'my-tool', version: '10.2.3', desc: 'x y', homepage: 'https://x.y', license: 'MIT OR Apache-2.0' };
  const n = await mutantsOf('my-tool', renderFormula(o), 'my-tool', '10.2.3', 'acme');
  assert.ok(n > 700, 'only ' + n + ' mutants were generated');
});
test('a hole refuses what the renderer\'s plainText refuses: a quote, a backslash, a hash, a control character, nothing', async () => {
  for (const bad of ['"', '\\', '#', '\r', '\x00', '\x1f', '\x7f', '']) {
    for (const [prefix, at] of [['  desc "', 2], ['  homepage "', 3], ['  license "', 5]]) {
      const ls = lines(golden);
      ls[at - 1] = prefix + 'a' + bad + 'b"';
      if (bad === '') ls[at - 1] = prefix + '"';
      const s = scenario(Object.assign({ head: ls.join('\n') }, MOPM));
      await assert.rejects(() => g.decide(s.ctx), (e) => { assert.ok(e instanceof g.Refusal && lineOf(e) === at, JSON.stringify(bad) + ' at ' + at + ': ' + e.message); return true; });
    }
  }
});

// ---- the building blocks ----
test('template: the renderer\'s nesting and targets, exactly three url lines', () => {
  const t = g.template('mopm', '1.2.3', 'komira-ai').map((p) => p.map((x) => (typeof x === 'string' ? x : '<' + x.hole + '>')).join(''));
  assert.equal(t.filter((l) => /^ +url /.test(l)).length, 3);
  assert.deepEqual(g.TARGETS.map((x) => [x.os, x.cpu, x.suffix]), [['macos', 'arm', 'macos-arm64'], ['linux', 'arm', 'linux-aarch64'], ['linux', 'intel', 'linux-x86_64']]);
  assert.ok(!t.some((l) => /x86_64|macos-x/.test(l) && !/linux-x86_64/.test(l)));
  assert.equal(t[1], '  desc "<text>"');
  assert.equal(t[3], '  version "1.2.3"');
  assert.equal(t.length, 33);
});
test('className: mopm is Mopm, my-tool is MyTool, a--b is AB', () => {
  assert.equal(g.className('mopm'), 'Mopm');
  assert.equal(g.className('my-tool'), 'MyTool');
  assert.equal(g.className('a--b'), 'AB');
  assert.equal(g.className('tool2-x9'), 'Tool2X9');
});
test('baseVersion reads exactly one plain version line of the formula on main', () => {
  assert.equal(g.baseVersion(golden, 'b'), '1.2.3');
  assert.equal(g.baseVersion('class A\n  version "9.8.7"\nend\n', 'b'), '9.8.7');
  for (const [text, why] of [['', '0 version lines'], ["  version '1.2.3'\n", '0 version lines'], ['  version "1.2.3"\n  version "1.2.3"\n', '2 version lines'], ['  version "1.2.3-rc.1"\n', 'not X.Y.Z'], ['  version "latest"\n', 'not X.Y.Z']]) {
    assert.throws(() => g.baseVersion(text, 'b'), (e) => e instanceof g.Refusal && e.message.includes(why), JSON.stringify(text));
  }
});
test('a bump is accepted over a base written in an older shape (the base is only read for its one version line)', async () => {
  const s = scenario(Object.assign({ head: golden, base: fixture('mopm_with_macos_intel.rb').replace(/1\.2\.3/g, '1.2.2'), files: [{ filename: 'Formula/mopm.rb', status: 'modified' }] }, MOPM));
  assert.equal((await g.decide(s.ctx)).version, '1.2.3');
});
