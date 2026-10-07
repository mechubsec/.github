# mechub repository style guide

Use this guide when creating or updating a mechub repository README, subtitle,
or GitHub repository metadata. It keeps the organization recognizable without
overstating maturity or vendor relationships.

## README opening

- The first H1 must equal the exact repository name. Preserve names such as
  `rustjunosmcp`; do not insert a dash to make `rust-junosmcp`.
- Use the subtitle `sovereign AI operations for network and security teams` in
  every repository README.
- Use one status label only: `Planned`, `Alpha`, `Beta`, or `Stable`.
- Do not use `In production` for a maintainer's homelab. Write `running in the
  maintainer's lab` when that is the evidence available.
- Include the canonical disclaimer exactly once in each README, replacing
  `{Vendor}` with the relevant vendor name:

  > This is an independent, community project. It is not affiliated with, endorsed by, or supported by {Vendor}.

## Naming

Use these fuller forms everywhere, including headings, prose, and metadata:

- `HPE Juniper Mist`
- `Junos SRX`

## Repository metadata

- Append `— a mechub project` to every GitHub repository description. The
  description is maintained in GitHub; this suffix is the organization
  standard.
- Keep repository descriptions concise and factual. Do not imply vendor
  endorsement, production readiness, or capabilities that are not available.

## Pull requests

- Keep the PR focused on one change and state the verification performed.
- Apply this guide to README edits in the same PR when practical.
- Preserve the project rule: deterministic code decides, the model explains,
  and a human approves.

