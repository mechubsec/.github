# mechub style guide

This guide is the shared standard for mechub repository documentation and
metadata. Apply it consistently while keeping each repository's technical
description specific and honest.

## README opening

Every README starts with an H1 containing the exact repository name. Do not
insert or remove dashes, including in names such as `rustjunosmcp`.

Use the canonical subtitle:

> sovereign AI operations for network and security teams

Use one status badge with exactly one of these labels: **Planned**, **Alpha**,
**Beta**, or **Stable**. Do not use “In production” for a maintainer's
homelab; describe that state as “running in the maintainer's lab”.

Keep the opening focused on the project's value, audience, maturity, and
shortest safe local path. Quick starts should be deterministic and
offline-capable where the project permits, and must not imply that model
output performs an unreviewed change.

## Vendor and project naming

Use the fuller product names **HPE Juniper Mist** and **Junos SRX** wherever
those products are referenced.

Append this description suffix to repository descriptions:

> — a mechub project

## Affiliation disclaimer

Each README contains this disclaimer exactly once, replacing `{Vendor}` with
the relevant vendor name:

> This is an independent, community project. It is not affiliated with,
> endorsed by, or supported by {Vendor}.

## Review checklist

- The H1 exactly matches the repository name.
- The canonical subtitle and one approved status label are present.
- Vendor names use the fuller forms above.
- The affiliation disclaimer appears exactly once.
- Claims describe evidence-backed behavior and do not overstate lab usage.
- The repository description ends with “— a mechub project”.
