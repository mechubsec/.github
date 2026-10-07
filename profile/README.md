<p align="center"><img src="https://raw.githubusercontent.com/mechubsec/.github/main/profile/mechub-mark.svg" width="96" alt="mechub mark"></p>

<h1 align="center">mechub</h1>

<p align="center">
  <b>sovereign AI operations for network and security teams</b><br>
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
| **MCP servers** | [`rustjunosmcp`](https://github.com/mechubsec/rustjunosmcp) · [`rustpanosmcp`](https://github.com/mechubsec/rustpanosmcp) · [`rustsdcmcp`](https://github.com/mechubsec/rustsdcmcp) · [`rustmistmcp`](https://github.com/mechubsec/rustmistmcp) · [`rustproxmoxmcp`](https://github.com/mechubsec/rustproxmoxmcp) · [`rustunifimcp`](https://github.com/mechubsec/rustunifimcp) · [`rustfortimcp`](https://github.com/mechubsec/rustfortimcp) · [`rustopnsmcp`](https://github.com/mechubsec/rustopnsmcp) |
| **Data** | [`ssdf`](https://github.com/mechubsec/ssdf) — Sovereign Security Data Fabric; the only repository with a Python core |
| **Evaluation** | [`mechubbench`](https://github.com/mechubsec/mechubbench) — tool-call benchmark corpus and runner for network-automation agents |
| **Skills & tools** | [`fwskillsshare`](https://github.com/mechubsec/fwskillsshare) · [`firewallintentconverter`](https://github.com/mechubsec/firewallintentconverter) · [`fwconfigsanitizer`](https://github.com/mechubsec/fwconfigsanitizer) · [`srxsync`](https://github.com/mechubsec/srxsync) |

## Start here

- **Foundation:** Start with [`mecmcp`](https://github.com/mechubsec/mecmcp), the shared foundation for connecting the ecosystem to management planes.
- **MCP servers:** Use a vendor server such as [`rustunifimcp`](https://github.com/mechubsec/rustunifimcp) to explore a runnable example that fronts a management plane.
- **Data:** [`ssdf`](https://github.com/mechubsec/ssdf) provides the Sovereign Security Data Fabric and its Python core.
- **Evaluation:** [`mechubbench`](https://github.com/mechubsec/mechubbench) contains benchmark cases and a runner for network-automation tool calls.
- **Skills & tools:** [`fwskillsshare`](https://github.com/mechubsec/fwskillsshare) shares reusable skills, while the companion tools convert, sanitize, and synchronize firewall data.

For a newcomer, `mecmcp` is the recommended first repository because it explains
the common foundation; `rustunifimcp` is the shortest runnable server example.

## Principles

- **Self-hosted by default.** Your realm, your models, your rules.
- **Deterministic decides.** Code makes the safety-relevant call; the model
  explains it; a human approves it.
- **Honest maturity.** If something is partial or unverified, we say so.

Public mechub projects are MIT licensed. Report vulnerabilities privately via
the **Security** tab of the affected repository.

<p align="center"><sub>🌐 <a href="https://mechub.org">mechub.org</a></sub></p>
