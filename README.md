# homebrew-tap

Homebrew formulae for the tools published from https://github.com/komira-ai. Formulae only: the tarballs they install stay
on each tool's GitHub releases.

The `Formula/` directory is empty until a tool's first release publishes a formula. Once `mopm` has one:

```
brew tap komira-ai/tap
brew install mopm
```

or without tapping first: `brew install komira-ai/tap/mopm`. Other tools are listed here when their formulae exist.

## What is here

`Formula/<name>.rb`: one binary formula per tool (no build step, no bottles). Each has a
`url` and `sha256` per platform, copied from the SHA256SUMS of the tool's release, and a
`test do` that runs the tool and checks its output. The guard accepts only the shape the renderer writes (see "The allow-list").

`.github/workflows/guard.yml` and `.github/workflows/check.yml` are the two workflows; `.github/guard/guard.js` is the guard's
decision logic, and `test/` holds its tests and a lint of the workflows. The `check` job runs both test files with node's
built-in test runner (`node --test test/guard_test.js test/lint_test.js`) on the GitHub-hosted runner, with no dependencies.

## How a formula changes

Only the release bot changes a formula, and only through a pull request:

1. After a tool publishes a release `vX.Y.Z`, its release workflow opens a PR from the branch
   `bump/<formula>-vX.Y.Z` that adds or changes `Formula/<formula>.rb` and nothing else.
2. Two workflows run on the PR, `guard` and `check`. The jobs are named `guard` and `check`; they are the two required
   status checks of the `main` ruleset.
3. When both are green the PR is merged automatically (squash).

## What `guard` does

`guard` runs on `pull_request_target`, so GitHub runs the workflow file as it is on `main`, not the pull request's copy: a
pull request cannot edit away the guard that judges it. It never checks out or executes pull request code. It checks out
the base commit only (to load `.github/guard/guard.js`) and reads the pull request's files, branch and author through the
API. Its token can read contents and pull requests and nothing else, and it has no secrets.

It refuses the PR unless all of these hold:

- the PR was opened by the release bot, whose login is the repository variable `TAP_BOT_LOGIN` (set by the repository
  owner; unset means every PR is refused), and its branch is in this repository (not a fork). The login is the account's
  full login as GitHub reports it, which for a GitHub App includes the `[bot]` suffix: `<app-slug>[bot]`, not `<app-slug>`;
- the branch is `bump/<formula>-v<X.Y.Z>` (formula name: lowercase letters, digits and `-` only), a release version: no
  prerelease, no build metadata;
- no file under `.github/` is added, changed, removed or renamed (compared case-insensitively), so a pull request can never
  add a job named `guard` or `check` or change a workflow, the guard or its tests;
- exactly one file changed, `Formula/<formula>.rb`, added or modified (not removed, not renamed);
- the whole formula is the renderer's output, line for line (the allow-list, below). Nothing is searched for or denied: a
  line is allowed because it is on the list, and a formula with one line more, fewer or different is refused, with a reason
  that names the first line that differs (`line 9 is "...", it must be "..."`);
- the version is higher than the formula's on `main`, when there is one; the copy on `main` is read for its one
  `version "X.Y.Z"` line, and a missing, duplicate or non-X.Y.Z one is a refusal, not a pass;
- the tag `v<version>` exists in `<owner>/<formula>`. This assumes every tool repository is public: the guard reads the tag
  with this repository's read-only token, which cannot see a private repository, so a private tool reads as "no such tag" and
  its PRs are refused (the check fails closed, it never passes by default).

The guard decides what may change; it does not sandbox the formula's Ruby.

### The allow-list

The bot only ever submits what the release tool's renderer writes (`tools/channels/formula.zig` in the tool's repository).
`template` in `.github/guard/guard.js` holds that output as an ordered list of lines. Each line is a literal, or a literal
with typed holes; the formula must match it line for line, in order, with nothing extra and nothing missing. LF line endings,
a final newline and nothing after it; CRLF, a comment, a blank line or a trailing space is a refusal.

```ruby
class <Class> < Formula                     # <Class>: the formula name, capitalised at each "-" (mopm -> Mopm, my-tool -> MyTool)
  desc "<text>"                             # <text>: what the renderer's plainText allows: non-empty, no control character,
  homepage "<text>"                         #         and none of  "  \  #  (so it cannot leave its string or interpolate)
  version "<V>"                             # <V>: the version of the branch bump/<name>-v<V>
  license "<text>"

  on_macos do
    on_arm do
      url "https://github.com/<owner>/<name>/releases/download/v<V>/<name>-<V>-macos-arm64.tar.gz"
      sha256 "<64 lower-case hex digits>"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/<owner>/<name>/releases/download/v<V>/<name>-<V>-linux-aarch64.tar.gz"
      sha256 "<64 lower-case hex digits>"
    end
    on_intel do
      url "https://github.com/<owner>/<name>/releases/download/v<V>/<name>-<V>-linux-x86_64.tar.gz"
      sha256 "<64 lower-case hex digits>"
    end
  end

  def install
    bin.install "<name>"
  end

  test do
    assert_match "<name> #{version}", shell_output("#{bin}/<name> --version")
  end
end
```

(Comments after `#` above are this README's; the file has none.) The holes are bound, not free: `<name>` and `<V>` come from the
branch (so one name and one version, and every url's version is the version line's), `<owner>` is this repository's owner.
The targets are exactly `linux-x86_64`, `linux-aarch64` and `macos-arm64`, in the renderer's nesting; there is no Intel
macOS. The only free text is `desc`, `homepage` and `license`, and the three hashes.

Because only the listed lines can be present, there is no Ruby the formula can carry that the list does not name: no extra
method, `send`, `eval`, `require`, heredoc, second `url` or `version`, `file://` base, or `on_intel` outside `on_linux`. The
words `version` and `url` are fine inside a `desc` (they are inside a string that cannot be closed).

The version already on `main` is read differently: that text is history the guard accepted earlier, possibly in an older
shape, so it is not matched against the template. Exactly one line `  version "X.Y.Z"` is read from it; none, several or a
non-X.Y.Z one is a refusal.

What the list does not prove: that the hashes are the release's (the bot copies them from the release's SHA256SUMS; `check`
installs the formula on macOS), or that the description is true. A formula that matches the list can still be wrong, only not
dangerous in Ruby.

#### When the formula's shape changes

The renderer and the template are one contract kept in two repositories. A change to the renderer's output (a new target, a
new line, a changed `test do`) makes every bot PR refused by `guard` until `template` and `TARGETS` here change to match, and
those edits are refused by `guard` too (they are under `.github/`, see "Who can change what"). So a shape change is a release
in two steps, in this order:

1. Land the renderer change in the tool repository, but do not release a tool version with it. The test fixtures
   (`test/fixtures`, with `PROVENANCE`) are re-rendered from the new renderer.
2. The repository owner changes `template`/`TARGETS`, the fixtures and their tests here, through the ruleset procedure below,
   and merges.
3. Only then the tool releases; its bot PR matches the new template and passes.

If a tool releases first, the bot PR is refused with the first line that differs, and nothing is lost: update the template,
then re-run the release's publish step for that version. The template never accepts both shapes at once, so
during the change the old shape is refused; do the two steps close together.

The tests pin the renderer's output as `test/fixtures/mopm.rb` (the golden, which must be accepted) and the older or flagged
renders (no `version` line, `--url-base` file URL, the Intel macOS render), which must be refused. A generated test breaks
every line of the golden four ways (delete it, duplicate it, append ` # x`, change one non-hole character) and requires a
refusal each time.
renderer (`test/fixtures`, with `PROVENANCE`) and require it to accept the one the bot writes and refuse planted variants.

`test/lint_test.js` also pins, for `guard.yml`: no `github-token` input on the script step (it runs with the workflow's
read-only token), no `types:` on the trigger (an event outside the list would skip the required check), and for both
workflows exactly one `runs-on`, the pinned hosted image (`ubuntu-24.04` for `guard`, `macos-14` for `check`).

## What `check` does

`check` runs on `pull_request` and on `push` to `main`, with a read-only token and no secrets. First it runs the tests of the
guard and of the workflow lint (node's built-in test runner; the node the runner image ships; no dependencies); a failing test
fails the job. For each formula the PR adds or
modifies (all of them on a push): `brew audit --strict --online`, `brew style`, `brew install`, `brew test`, on a macOS
runner. A PR that changes no formula passes it trivially. `check` does not decide who may change what; `guard` does.

## Who can change what

Assumption: nothing under `.github/` ever changes through the bot's pull-request flow, and the names of the required checks
are defined only by the workflows already on `main`. That is why `guard` refuses any pull request that touches `.github/`.

A human edit (this README, a workflow, the guard, the tests) is refused by `guard` by design, so it cannot merge while the
ruleset requires `guard`. The ruleset has no bypass actors, so no one, administrators included, can merge around it.
Changing a rule therefore means editing the ruleset itself: an administrator relaxes the `main` ruleset, the change is
merged, and the ruleset is restored. Editing a workflow in a pull request does not change the judge of that pull request.

## Settings the repository owner makes

- The repository variable `TAP_BOT_LOGIN`: the login of the GitHub App that opens bump PRs, including the `[bot]` suffix.
- A ruleset on `main` with no bypass actors, requiring pull requests, the status checks `guard` and `check`, and
  auto-merge by squash.

## Not covered

The runner is macOS on Apple silicon. Linux and macOS on Intel are installed from the same
formula but are not installed by this check.
