# README opening template

Use this opening for every mechub repository. Keep the first screen useful to
an operator: state the value, show the maturity, explain the project, and give
the shortest safe path to a first local run.

```markdown
# <project name>

<One sentence describing the value this project provides.>

![Status: <Planned|Alpha|Beta|Stable>](https://img.shields.io/badge/status-<planned|alpha|beta|stable>-<color>)

a mechub project — sovereign AI operations for network and security teams

<Two or three sentences explaining what the project does, who it is for, and
what it connects to or produces.>

## Quick start

<The smallest offline-capable setup and first useful command. Link to
prerequisites or configuration details when needed.>
```

## Status vocabulary

Use exactly one of these maturity labels in the status badge:

| Status | Badge | Use when |
| --- | --- | --- |
| Planned | `status-planned-lightgrey` | The project is proposed or not yet usable. |
| Alpha | `status-alpha-blue` | An early usable version exists; interfaces and behaviour may change. |
| Beta | `status-beta-yellow` | The project is usable for evaluation; interfaces are stabilising. |
| Stable | `status-stable-brightgreen` | The supported path is established and maintained. |

Use the matching Shields.io status segment in the opening badge; do not create
additional maturity labels or colors:

```markdown
![Status: Planned](https://img.shields.io/badge/status-planned-lightgrey)
![Status: Alpha](https://img.shields.io/badge/status-alpha-blue)
![Status: Beta](https://img.shields.io/badge/status-beta-yellow)
![Status: Stable](https://img.shields.io/badge/status-stable-brightgreen)
```

Do not use `In production` to describe a maintainer's own homelab or lab
deployment. Say `running in the maintainer's lab` in prose instead. Reserve
production claims for deployments and evidence that the project can actually
support.

## README maintenance rules

- Keep the value statement to one sentence and put it before the badge.
- Keep the canonical subtitle exactly as shown in the template.
- Put release history and release narrative in `CHANGELOG.md`.
- Put lab notes, experiments, and deployment observations in `docs/`.
- Tool-count badges must match the release they describe. If a count is from
  the unreleased branch, label it `unreleased` rather than presenting it as a
  released capability. Reconcile the count whenever a release changes the
  available tools.
- Keep the quick start deterministic and offline-capable where the project
  permits; do not imply that model output performs an unreviewed change.
