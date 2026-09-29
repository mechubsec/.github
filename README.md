# .github

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
