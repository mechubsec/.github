<p align="center"><img src="https://raw.githubusercontent.com/mechubsec/.github/main/profile/mechub-mark.svg" width="96" alt="mechub mark"></p>

<h1 align="center">mechub</h1>

<p align="center">
  <b>sovereign network-security automation</b><br>
  <sub>deterministic decides · the model explains · a human approves</sub>
</p>

---

mechub is an ecosystem of self-hosted, MCP-driven automation for the people
who run firewalls, networks, and security operations at scale. It puts real
AI leverage in every operator's hands **without one byte of operational data
leaving the building, and with better attribution than before AI arrived.**

A gateway-brokered agent platform, not a chatbot with credentials: agents
reach infrastructure only through MCP servers fronting each management plane,
every tool call is scoped and audited, and autonomy is granted rung by rung,
enforced by token scope at the server rather than by prompt.

## The name

**mechub** — **M**achine **E**xecuted & **C**hecked · **Hub**.

It started as *mechanic hub*: a workshop for network-security tools you can
open up and work on. It now also says how they work — machines execute the
change, deterministic checks decide whether it stands, a human approves, and
the hub is where every vendor's MCP server meets, on hardware you own.

## The ecosystem

| Layer | Projects |
|---|---|
| **Foundation** | [`mecmcp`](https://github.com/mechubsec/mecmcp) · [`rustnetconf`](https://github.com/mechubsec/rustnetconf) · [`rustez`](https://github.com/mechubsec/rustez) |
| **MCP servers** | see maturity table below |
| **Data** | [`ssdf`](https://github.com/mechubsec/ssdf) — sovereign security data fabric |
| **Evaluation** | [`mechubbench`](https://github.com/mechubsec/mechubbench) — tool-call benchmark corpus and runner for network-automation agents |
| **Skills & tools** | [`fwskillsshare`](https://github.com/mechubsec/fwskillsshare) · [`firewallintentconverter`](https://github.com/mechubsec/firewallintentconverter) · [`fwconfigsanitizer`](https://github.com/mechubsec/fwconfigsanitizer) · [`srxsync`](https://github.com/mechubsec/srxsync) |

### MCP server maturity

Version numbers alone don't carry the maturity story — a server can sit on a
low 0.x for a long time because its vendor surface is small, not because it's
less field-tested. The status column is the honest signal; read it alongside
the version, not instead of it.

| Server | Latest release | Status |
|---|---|---|
| [`rustjunosmcp`](https://github.com/mechubsec/rustjunosmcp) | [v0.27.3](https://github.com/mechubsec/rustjunosmcp/releases/tag/v0.27.3) | ![status](https://img.shields.io/badge/status-beta-yellow) |
| [`rustpanosmcp`](https://github.com/mechubsec/rustpanosmcp) | [v0.14.0](https://github.com/mechubsec/rustpanosmcp/releases/tag/v0.14.0) | ![status](https://img.shields.io/badge/status-beta-yellow) |
| [`rustproxmoxmcp`](https://github.com/mechubsec/rustproxmoxmcp) | [v0.10.0](https://github.com/mechubsec/rustproxmoxmcp/releases/tag/v0.10.0) | ![status](https://img.shields.io/badge/status-beta-yellow) |
| [`rustsdcmcp`](https://github.com/mechubsec/rustsdcmcp) | [v0.1.0](https://github.com/mechubsec/rustsdcmcp/releases/tag/v0.1.0) | ![status](https://img.shields.io/badge/status-alpha-orange) |
| [`rustmistmcp`](https://github.com/mechubsec/rustmistmcp) | [v0.3.2](https://github.com/mechubsec/rustmistmcp/releases/tag/v0.3.2) | ![status](https://img.shields.io/badge/status-alpha-orange) |
| [`rustunifimcp`](https://github.com/mechubsec/rustunifimcp) | [v0.5.0](https://github.com/mechubsec/rustunifimcp/releases/tag/v0.5.0) | ![status](https://img.shields.io/badge/status-alpha-orange) |
| [`rustfortimcp`](https://github.com/mechubsec/rustfortimcp) | unreleased | ![status](https://img.shields.io/badge/status-planned-lightgrey) |
| [`rustopnsmcp`](https://github.com/mechubsec/rustopnsmcp) | unreleased | ![status](https://img.shields.io/badge/status-planned-lightgrey) |

No server in the family is tagged `stable` yet; all are running in the
maintainer's lab, not production, regardless of version number.

## Start here

- **Foundation:** Start with [`mecmcp`](https://github.com/mechubsec/mecmcp) for shared MCP orchestration and deterministic change-control foundations.
- **MCP servers:** Try [`rustjunosmcp`](https://github.com/mechubsec/rustjunosmcp) first, or [`rustunifimcp`](https://github.com/mechubsec/rustunifimcp) as a second released vendor-facing example.
- **Data:** Explore [`ssdf`](https://github.com/mechubsec/ssdf) for the sovereign security data fabric.
- **Skills & tools:** Use [`fwskillsshare`](https://github.com/mechubsec/fwskillsshare), [`firewallintentconverter`](https://github.com/mechubsec/firewallintentconverter), [`fwconfigsanitizer`](https://github.com/mechubsec/fwconfigsanitizer), or [`srxsync`](https://github.com/mechubsec/srxsync) for focused operator utilities.

Get in touch / testers wanted: for questions, ideas, or testing feedback, join the [mechub Discussions](https://github.com/orgs/mechubsec/discussions). Report vulnerabilities privately via [SECURITY.md](https://github.com/mechubsec/.github/blob/main/SECURITY.md).

## Principles

- **Self-hosted by default.** Your realm, your models, your rules.
- **Deterministic decides.** Code makes the safety-relevant call; the model
  explains it; a human approves it.
- **Honest maturity.** If something is partial or unverified, we say so.

Public mechub projects are MIT licensed. Report vulnerabilities privately via
the **Security** tab of the affected repository.

<p align="center"><sub>🌐 <a href="https://mechub.org">mechub.org</a></sub></p>
