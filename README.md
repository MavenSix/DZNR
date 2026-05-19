# DZNR

**A practitioner-grade agent for complex design, AI product, and experience engineering work.**

DZNR is a master orchestrator with 7 specialist subagents, each with a defined domain, routing logic, and failure protocol. Built for real client engagement and team usage — not landing-page demos.

---

## What makes DZNR different

Most AI design agents are a single system prompt that says "be helpful." When they break, no one knows why. DZNR has:

- **A documented routing system.** 22 stress tests with traced verdicts. Every request maps to a deterministic decision tree.
- **Compound request handling.** Multi-deliverable requests across multiple subagents become bundled execution plans.
- **Personal craft preservation.** Gandalf subagent owns your workshop skills. Your custom skills win over generic plugin versions.
- **Failure-mode playbook.** 6 failure categories, each with a detection rule and recovery protocol.
- **Evolution Protocol.** New tools and skills can be added through a 5-step workflow with regression testing.
- **Team-ready.** Built for collaborative use with a 2-3 person team, expandable later.

---

## The cast

| Character | Subagent | Domain | Skills |
|-----------|----------|--------|--------|
| **Tár** | Orchestrator | Routing, memory, tempo | 8 |
| **Snape** | Brand & Design Systems + Clarifier | Identity + visual scaffolding. Voices clarifications when routing is ambiguous. | 32 |
| **Sherlock** | Discovery & Research | Read patterns, audit, synthesize. Never builds. | 22 |
| **Gibson** | Experience Eng + AI Product | Immersive, 3D, spatial, AI-driven futures. | 19 |
| **Neo** | Delivery & Code | Specs, components, ship it. | 24 |
| **Morpheus** | Pitch & Story | Outbound. Present, persuade, narrate. | 19 |
| **Gandalf** | Workshop (peer + tool) | Your personal craft. Called by Tár or by other subagents mid-work. | 38 |
| **Snake Eyes** | Specialist Arsenal (parked) | Silent. Called by name. Soft-routed for SEO. | ~55 |

---

## Installation

See [docs/INSTALLATION.md](./docs/INSTALLATION.md).

Quick version:
```bash
# Clone the repo
git clone https://github.com/MavenSix/DZNR.git
cd DZNR

# Install as a Claude Code plugin
claude plugin install ./dznr
```

---

## Getting started

See [docs/GETTING_STARTED.md](./docs/GETTING_STARTED.md).

After installation, just talk to DZNR like you would any other agent. The routing handles the rest.

Example: *"I need a discovery and heuristic analysis for this site, with a brand breakdown and synthetic audiences and user journeys, plus a project plan of key opportunity areas."* → DZNR detects the compound request, dispatches Sherlock for parallel research, hands Snape the brand work, hands Morpheus the project plan, delivers all 6 artifacts together.

---

## For your team

If a teammate is using DZNR, hand them [docs/TEAM_REFERENCE_CARD.md](./docs/TEAM_REFERENCE_CARD.md). It's a one-page cheat sheet covering what DZNR says when it asks for clarification or hits a failure mode.

---

## Architecture overview

For the full architecture, open [docs/DZNR_architecture.html](./docs/DZNR_architecture.html) in a browser.

For the routing system internals, see:
- [routing/TRIGGERS.md](./routing/TRIGGERS.md) — keyword maps per subagent
- [routing/CHAINS.md](./routing/CHAINS.md) — multi-subagent chain decision trees
- [routing/SHARED_SKILLS.md](./routing/SHARED_SKILLS.md) — shared-skill disambiguation
- [routing/FAILURE_MODES.md](./routing/FAILURE_MODES.md) — failure-mode playbook
- [routing/SUBAGENT_ROSTERS.md](./routing/SUBAGENT_ROSTERS.md) — full skill rosters

---

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) and [governance/EVOLUTION.md](./governance/EVOLUTION.md).

Changes to DZNR follow a 5-step Evolution Protocol: propose → review → update routing → regression test → deploy.

---

## License

UNLICENSED (private, team-use only). May open-source in the future.

---

## Status

**Version:** 1.0.0 (alpha — Phase 3 build in progress)
**Last updated:** 2026-05-18
