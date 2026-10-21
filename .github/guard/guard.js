'use strict';
// The decision logic of the tap's path guard. A plain module: no dependencies, no network of its own. The `guard` workflow
// calls `run` with the github-script objects; the tests call it with fakes. Everything it knows about a pull request comes
// through `github.rest` (the API): it reads no file of a checkout and executes nothing from the pull request.
//
// The formula is judged by an exact ALLOW-LIST, not by deny rules. The release bot only ever submits what the release tool's
// renderer writes (tools/channels/formula.zig in the tool repository), so the guard holds that renderer's output as an ordered
// template of lines (`template` below) and accepts a formula only if it matches the template line for line, with nothing extra
// and nothing missing. A change of the renderer's output shape therefore needs the same change here (see README).

const SEMVER = '(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)';
// Release versions only: a prerelease (-rc.1) or build metadata (+x) is not a version this tap accepts.
const SEMVER_RE = new RegExp('^' + SEMVER + '$');
const BRANCH_RE = new RegExp('^bump/([a-z0-9][a-z0-9-]*)-v(' + SEMVER + ')$');

class Refusal extends Error {}

const refuse = (why) => {
  throw new Refusal('path guard refused: ' + why);
};

// ---- the template: the renderer's line grammar ----
// A line is an array of parts. A string part is a literal, matched character for character. A hole is one of the two objects
// below. Everything else the renderer writes (the class name, the formula name, the version, the owner, each url) is a literal
// here, because the guard already knows it: the name and the version come from the branch, the owner from this repository.
// So "one name, one version, every url's version equal to the branch's" holds by construction. There is deliberately NO
// `version` line: brew derives the version from the url, and `brew audit --strict` refuses a `version` line equal to it
// ("version is redundant with version scanned from URL"). The version is bound through the urls instead.
//
// TEXT is the renderer's `plainText` (desc, homepage, license): non-empty, no control character, no `"`, no `\`, no `#`. Such
// text cannot leave its string literal, interpolate, or hold a newline.
const TEXT = { hole: 'text', re: '[^\\x00-\\x1f\\x7f"\\\\#]+' };
// A sha256: 64 lower-case hex digits, as `sha256sum` writes them.
const SHA = { hole: 'sha256', re: '[0-9a-f]{64}' };

const escapeRe = (s) => s.replace(/[\\^$.*+?()[\]{}|\/-]/g, '\\$&');
const lineRe = (parts) => new RegExp('^' + parts.map((p) => (typeof p === 'string' ? escapeRe(p) : p.re)).join('') + '$');
const describe = (parts) => parts.map((p) => (typeof p === 'string' ? p : '<' + p.hole + '>')).join('');

// The release targets and where the renderer nests them: (os block, cpu block, file suffix). macOS on Intel is not a release
// platform, and linux-x86_64 is `on_intel` under `on_linux`. In the renderer's order.
const TARGETS = [
  { os: 'macos', cpu: 'arm', suffix: 'macos-arm64' },
  { os: 'linux', cpu: 'arm', suffix: 'linux-aarch64' },
  { os: 'linux', cpu: 'intel', suffix: 'linux-x86_64' },
];

// `mopm` is `Mopm`, `my-tool` is `MyTool`: the renderer's className.
function className(name) {
  let out = '';
  let up = true;
  for (const ch of name) {
    if (ch === '-') { up = true; continue; }
    out += up ? ch.toUpperCase() : ch;
    up = false;
  }
  return out;
}

// The formula text as ordered lines (the last, empty, is the text after the final newline), for formula `name` at `version`
// in the repository `owner/name`.
function template(name, version, owner) {
  const base = 'https://github.com/' + owner + '/' + name + '/releases/download/v' + version + '/';
  const t = [
    ['class ' + className(name) + ' < Formula'],
    ['  desc "', TEXT, '"'],
    ['  homepage "', TEXT, '"'],
    ['  license "', TEXT, '"'],
  ];
  for (const os of ['macos', 'linux']) {
    t.push([''], ['  on_' + os + ' do']);
    for (const cpu of ['arm', 'intel']) {
      for (const tg of TARGETS) {
        if (tg.os !== os || tg.cpu !== cpu) continue;
        t.push(
          ['    on_' + cpu + ' do'],
          ['      url "' + base + name + '-' + version + '-' + tg.suffix + '.tar.gz"'],
          ['      sha256 "', SHA, '"'],
          ['    end'],
        );
      }
    }
    t.push(['  end']);
  }
  t.push(
    [''],
    ['  def install'],
    ['    bin.install "' + name + '"'],
    ['  end'],
    [''],
    ['  test do'],
    ['    assert_match "' + name + ' #{version}", shell_output("#{bin}/' + name + ' --version")'],
    ['  end'],
    ['end'],
    [''],
  );
  return t;
}

const shown = (s) => JSON.stringify(s.length > 120 ? s.slice(0, 120) + '...' : s);

// Refuses unless `text` is exactly the template, line for line. The reason names the first line that differs.
function checkTemplate(text, where, name, version, owner) {
  const want = template(name, version, owner);
  const have = text.split('\n');
  for (let i = 0; i < Math.max(want.length, have.length); i++) {
    if (i >= have.length) refuse(where + ' line ' + (i + 1) + ' is missing, it must be ' + shown(describe(want[i])));
    if (i >= want.length) refuse(where + ' line ' + (i + 1) + ' is extra: ' + shown(have[i]));
    if (!lineRe(want[i]).test(have[i])) refuse(where + ' line ' + (i + 1) + ' is ' + shown(have[i]) + ', it must be ' + shown(describe(want[i])));
  }
}

// -1, 0, 1 for two release versions; null when either is not X.Y.Z. Compared as integers of any size.
function compareSemver(a, b) {
  const x = SEMVER_RE.exec(a);
  const y = SEMVER_RE.exec(b);
  if (x === null || y === null) return null;
  for (let i = 1; i <= 3; i++) {
    const p = BigInt(x[i]);
    const q = BigInt(y[i]);
    if (p !== q) return p < q ? -1 : 1;
  }
  return 0;
}

// The version of the formula already on main, read from its urls. That text is history the guard accepted earlier (it is not a
// pull request's input), and it may be in an older shape than the template (for one, with a `version "X.Y.Z"` line), so it is
// not matched against the template. Fail closed: every `url` line must be a release url of `owner/name` whose directory version
// and file name version agree, all urls must name one version, and there must be at least one. An old-shape `version` line is
// tolerated (at most one, and it must equal the urls' version); it is never the source of the version.
function baseVersion(text, where, name, owner) {
  const urlRe = new RegExp('^\\s*url "https://github\\.com/' + escapeRe(owner) + '/' + escapeRe(name) + '/releases/download/v(' + SEMVER + ')/' + escapeRe(name) + '-(' + SEMVER + ')-[a-z0-9_-]+\\.tar\\.gz"$');
  const urls = new Set();
  const declared = [];
  let n = 0;
  for (const line of text.split('\n')) {
    if (/^\s*url\b/.test(line)) {
      n++;
      const m = urlRe.exec(line);
      if (m === null) refuse(where + ' has a url line that is not a release url of ' + owner + '/' + name + ': ' + shown(line));
      // m[1] and m[5] are the two versions (each SEMVER holds three groups, so the second one starts at group 5).
      if (m[1] !== m[5]) refuse(where + ' has a url whose directory version ' + m[1] + ' differs from its file name version ' + m[5]);
      urls.add(m[1]);
    }
    const v = /^  version "([^"]*)"$/.exec(line);
    if (v !== null) declared.push(v[1]);
  }
  if (n === 0) refuse(where + ' declares 0 url lines, expected at least 1');
  if (urls.size !== 1) refuse(where + ' has urls of ' + urls.size + ' different versions, expected 1');
  const version = [...urls][0];
  if (declared.length > 1) refuse(where + ' declares ' + declared.length + ' version lines, expected at most 1');
  if (declared.length === 1 && declared[0] !== version) refuse(where + ' declares version ' + JSON.stringify(declared[0]) + ', but its urls are of ' + version);
  return version;
}

// `ctx`: { github, context, botLogin }. Throws Refusal (message starts "path guard refused:") or an API error.
// Returns { formula, version, path }.
async function decide({ github, context, botLogin }) {
  const pr = context.payload.pull_request;
  const owner = context.repo.owner;
  const repo = context.repo.repo;

  if (!botLogin) refuse('the bot login is not configured (repository variable TAP_BOT_LOGIN)');
  if (pr.user.login !== botLogin || pr.user.type !== 'Bot') refuse('author is ' + pr.user.login + ', not the release bot');
  if (!pr.head.repo || pr.head.repo.full_name !== pr.base.repo.full_name) refuse('the branch is in a fork');
  const branch = BRANCH_RE.exec(pr.head.ref);
  if (!branch) refuse('branch ' + pr.head.ref + ' is not bump/<formula>-v<X.Y.Z>');
  const formula = branch[1];
  const version = branch[2];
  const path = 'Formula/' + formula + '.rb';

  const files = await github.paginate(github.rest.pulls.listFiles, { owner, repo, pull_number: pr.number, per_page: 100 });
  // Nothing under .github/ may change through a pull request (case-insensitively, as either side of a rename): the names of
  // the required checks are defined by the workflows on main, so a pull request must not be able to add a job named `guard`.
  const inGithub = files.find((x) => [x.filename, x.previous_filename].some((n) => typeof n === 'string' && /^\.github(\/|$)/i.test(n)));
  if (inGithub) refuse('the pull request changes ' + (inGithub.previous_filename || inGithub.filename) + ': nothing under .github/ may change through a pull request');
  if (files.length !== 1) refuse(files.length + ' files changed, expected exactly ' + path);
  const f = files[0];
  if (f.filename !== path) refuse('changed file is ' + f.filename + ', expected ' + path);
  if (f.status !== 'added' && f.status !== 'modified') refuse(path + ' is ' + f.status + ', expected added or modified');
  if (f.previous_filename) refuse(path + ' is a rename');

  const read = async (ref) => {
    try {
      const r = await github.rest.repos.getContent({ owner, repo, path, ref });
      if (Array.isArray(r.data) || typeof r.data.content !== 'string') refuse(path + ' is not a file at ' + ref);
      return Buffer.from(r.data.content, 'base64').toString('utf8');
    } catch (e) {
      if (e.status === 404) return null;
      throw e;
    }
  };
  const text = await read(pr.head.sha);
  if (text === null) refuse(path + ' is not at the head of the branch');
  // The allow-list: the whole formula is the renderer's output for this name and version, or the pull request is refused.
  checkTemplate(text, path, formula, version, owner);

  const before = await read(pr.base.sha);
  if (f.status === 'modified' && before === null) refuse(path + ' is modified but is not on the base');
  if (before !== null) {
    const old = baseVersion(before, path + ' on the base', formula, owner);
    if (compareSemver(version, old) <= 0) refuse('version ' + version + ' is not higher than ' + old + ' on the base');
  }

  try {
    await github.rest.git.getRef({ owner, repo: formula, ref: 'tags/v' + version });
  } catch (e) {
    if (e.status === 404) refuse('tag v' + version + ' does not exist in ' + owner + '/' + formula);
    throw e;
  }
  return { formula, version, path };
}

// The github-script entry point: fails the job on any refusal.
async function run({ github, context, core, botLogin }) {
  const r = await decide({ github, context, botLogin });
  core.info('path guard: ' + r.path + ' at ' + r.version + ' is allowed');
  return r;
}

module.exports = { run, decide, compareSemver, baseVersion, template, checkTemplate, className, Refusal, SEMVER_RE, BRANCH_RE, TARGETS };
