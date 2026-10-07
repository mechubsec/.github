# .github

<!-- mechub-version: unreleased -->

```
●───●
     \        m e c h u b
  ●───●───●   deterministic decides · the model explains · a human approves
```

Default community health files for [`mechubsec`](https://github.com/mechubsec).
GitHub applies the files here to any public repository under this organization that
does not provide its own:

- [`SECURITY.md`](SECURITY.md) — how to report a vulnerability (GitHub Private
  Vulnerability Reporting)
- [`CONTRIBUTING.md`](CONTRIBUTING.md) — contribution guidelines
- [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md) — expected conduct

A repository can override any of these by committing its own copy.

## Templates (not inherited)

Some configuration files must live in each repository and cannot be inherited:

- [`dependabot/`](dependabot/) — Dependabot version update configuration template.
  Copy `dependabot/dependabot.yml` to your repo's `.github/dependabot.yml`.

See each template directory's README for usage instructions.

## Reusable workflows

- [`.github/workflows/gitleaks.yml`](.github/workflows/gitleaks.yml) — secret
  scan with the pinned gitleaks binary (no license needed). Call it from any
  mechubsec repo, pinned to a commit SHA:

  ```yaml
  jobs:
    secrets:
      uses: mechubsec/.github/.github/workflows/gitleaks.yml@<commit sha>
  ```

  It scans the PR (base..head) or push (before..after) range, as
  gitleaks-action did; manual/scheduled runs scan full history. It picks up
  the caller's `.gitleaks.toml` if present. Bump the gitleaks
  version here, once, then update callers' pinned SHA.

- [`.github/workflows/readme-version.yml`](.github/workflows/readme-version.yml) —
  fails if a repo's README.md doesn't declare its released version, or
  declares the wrong one. Call it from any mechubsec repo, pinned to a
  commit SHA:

  ```yaml
  jobs:
    readme-version:
      uses: mechubsec/.github/.github/workflows/readme-version.yml@<commit sha>
  ```

  ### The `mechub-version` marker convention

  Every repo's README.md carries one HTML-comment marker line, invisible
  when rendered on GitHub, ideally near the top:

  ```md
  <!-- mechub-version: v0.18.1 -->
  ```

  or, for a repo with no release yet:

  ```md
  <!-- mechub-version: unreleased -->
  ```

  CI checks the marker deterministically rather than parsing README prose
  (existing READMEs state their version inconsistently — a blockquote, a
  prose paragraph, or not at all — and regexing free-form text to gate CI is
  exactly the non-deterministic parsing Mechub's house rule warns against):

  - If the repo has a `v*` tag, the marker must equal the latest one
    exactly (by version sort).
  - If the repo has no `v*` tag yet, the marker must be exactly
    `unreleased`.
  - A missing marker always fails the check.

  The checker is [`.github/scripts/check-readme-version.sh`](.github/scripts/check-readme-version.sh),
  with fixture-based tests in
  [`.github/scripts/test-check-readme-version.sh`](.github/scripts/test-check-readme-version.sh).
