# DZNR

**A practitioner-grade Claude Code plugin for complex design, AI product, and experience engineering work.**

DZNR is a master orchestrator that routes work to 8 specialist subagents, each with a documented domain, deterministic routing logic, and failure protocol. Built for real client engagement and team usage, not landing-page demos.

**Version:** 1.11.0 (beta)
**Last updated:** 2026-05-26

---

## What makes DZNR different

Most AI design agents are a single system prompt that says "be helpful." When they break, no one knows why. DZNR is built differently:

**Eight subagents, each with a clear domain.** No one subagent tries to do everything. When work crosses domains, the subagents hand off to each other through documented protocols.

**Industry posture system.** Every project carries an industry tag (luxury, automotive, retail, CPG, fintech, healthcare, technology, media/entertainment, public sector). Subagents adjust their defaults per industry: Snape applies industry-typical aesthetic defaults, Morpheus uses industry-typical pitch vocabulary, Sherlock weights research toward industry-relevant signals.

**Compound request handling.** A request like "audit this site, build the brand, scaffold the components, and make me a pitch deck" gets parsed into a dependency graph and dispatched in phases. Six deliverables come back together.

**Personal craft preservation.** Gandalf subagent owns your workshop skills. Your custom skills win over generic plugin versions. Adopters who fork DZNR substitute their own workshop.

**Mandatory four-lens AI ethics check.** When Gibson designs an AI product, the spec ships with an Empathy, Strategic Judgment, Guardianship, and Verification artifact. Non-optional. Same posture as Neo's mandatory hardening calls.

**Per-claim source attribution.** Morpheus's outbound artifacts cite their sources inline ("[Sherlock, site-audit]", "[Gibson, 3d-experience-design concept doc]"). Bulletproof under scrutiny.

**Confirm-before-auto-run on rebuild language.** When you say "rebuild" or "redesign", Sherlock asks before running a discovery pass. Transparency over speed; collaborative tempo.

**Failure-mode playbook.** Six failure categories, each with a detection rule and recovery protocol.

**Evolution Protocol.** New tools, skills, MCPs, and subagents can be added through a documented 5-step workflow with regression testing.

**MCP integration framework.** Every MCP DZNR routes through has a documented spec covering ownership, triggers, workflow, status, fallback, and memory tags. Adopters add their own MCPs by dropping a spec file in `routing/mcps/`.

---

## The cast

| Character | Subagent | Domain | Skills |
|-----------|----------|--------|--------|
| **Tár** | Orchestrator | Routing, memory, tempo | 8 |
| **Snape** | Brand and Design Systems + Clarifier | Identity, voice, design system. Voices clarifying questions when routing is ambiguous. | 32 |
| **Sherlock** | Discovery and Research | Read patterns, audit, synthesize. Sets the project industry tag. Never builds. | 22 |
| **Gibson** | Experience Engineering + AI Product | Two modes (immersive design + AI product) plus overlap. Mandatory four-lens AI ethics check. | 19 |
| **Neo** | Delivery and Code | Specs, components, ship. Platform-pure: Sitecore, Salesforce, AEM, React, native mobile, static sites, backend services. | 24 |
| **Morpheus** | Pitch and Story | Outbound. Per-claim source attribution. Format-organized deliverables. | 19 |
| **Gandalf** | Workshop tri-mode | Your personal craft. The ONLY subagent who can call others (in orchestrator mode, Innovation Accelerator only). | 44 |
| **Snake Eyes** | Specialist Arsenal | Silent. Seven specialist clusters. Called by name. Soft-routed for SEO. | ~55 |

---

## Quick example

> "I need a discovery and heuristic analysis for this site, a brand and style breakdown with synthetic audiences and user journeys, with a project plan of key opportunity areas."

DZNR detects the compound request, presents the bundle plan, then executes:

- **Phase 1 (Sherlock, parallel):** site discovery, heuristics, brand inputs, synthetic audiences, user journeys, opportunity scan
- **Phase 2 (Snape, sequential):** brand and style breakdown using Sherlock's brand inputs
- **Phase 3 (Morpheus, sequential):** project plan with prioritized opportunity areas

Gandalf is called for distill, extract, and critique along the way. All six deliverables come back together with per-claim source attribution.

---

## Installation

See [docs/INSTALLATION.md](./docs/INSTALLATION.md) for the full guide.

Quick version:

```bash
git clone https://github.com/MavenSix/DZNR.git
cd ~
claude --plugin-dir ~/DZNR
```

That launches Claude Code with DZNR loaded as a local plugin. Confirm registration with `/agents`; you should see the eight DZNR subagents (`dznr:tar:tar`, `dznr:snape:snape`, and so on).

For workshop sync (optional, only if you want Gandalf's skills available outside DZNR):

```bash
./scripts/sync-workshop.sh
```

> **Note on install paths.** `claude plugin install` requires a configured marketplace; the `--plugin-dir` flag loads a local plugin directly and is the recommended adopter install path. If you want to publish DZNR to your own marketplace, see `claude plugin marketplace --help`.

---

## Getting started

See [docs/GETTING_STARTED.md](./docs/GETTING_STARTED.md) for examples and patterns.

Two ways to use DZNR:

**Everyday command (recommended):**

```
/dznr [your request]
```

This routes to Tár, the orchestrator. She figures out which specialist subagent handles your request, or composes a compound chain across multiple subagents. Empty `/dznr` triggers Tár introducing herself and the cast.

`/dznr` is a user-level slash command that you install with one copy command after cloning (see [INSTALLATION.md](./docs/INSTALLATION.md)). Without the copy step, the same command is available as the plugin-namespaced `/dznr:conduct`.

**Direct subagent invocation (power user):**

```
@dznr:gandalf:gandalf polish this React component
@dznr:sherlock:sherlock audit https://example.com
@dznr:morpheus:morpheus write a launch narrative from these inputs
```

Useful when you know exactly which subagent fits and want to skip Tár's routing layer.

Each invocation surfaces in-character status announcements at handoff points so you can watch the orchestration happen, not just the final output.

---

## For your team

Three things to hand a teammate:

- **[docs/QUICKSTART.md](./docs/QUICKSTART.md)** for designers who do not live in Terminal. Step-by-step from "Open Terminal" to "your first DZNR prompt" with what-you-see and what-if-it-breaks for every step. Visual version at [docs/quickstart.html](./docs/quickstart.html). The fastest path for non-technical adopters.
- **[docs/PROMPT_LIBRARY.md](./docs/PROMPT_LIBRARY.md)** with 31 copy-paste prompts across nine design disciplines. Interactive HTML version at [docs/prompt-library.html](./docs/prompt-library.html) with search and copy buttons.
- **[docs/TEAM_REFERENCE_CARD.md](./docs/TEAM_REFERENCE_CARD.md)** as a one-page cheat sheet covering clarification flow, subagent invocation, and routing ambiguity behavior.

**One-line install for non-technical teammates:**

```bash
curl -fsSL https://raw.githubusercontent.com/MavenSix/DZNR/main/install.sh | bash
```

That single line handles prereq checks, the clone, the slash command setup, and the optional workshop sync.

---

## For adopters

If you want to fork DZNR for your own design practice (or your team's), see [docs/ADOPTERS.md](./docs/ADOPTERS.md). Covers:

- What's universal vs Kevin-specific
- How to substitute your own workshop skills
- How to customize industry clusters
- How to add or remove MCPs
- How to manage the soft-route exception

DZNR is built so the architecture transfers cleanly even though some content (the specific 44-skill Gandalf workshop, the specific industry posture profiles) is Kevin's.

---

## Architecture overview

For the architecture write-up, see [docs/ARCHITECTURE.md](./docs/ARCHITECTURE.md). For a visual reference (note: predates Phase 3 architectural additions, refresh planned), open [docs/DZNR_architecture.html](./docs/DZNR_architecture.html) in a browser.

Routing system internals:

- [routing/TRIGGERS.md](./routing/TRIGGERS.md): keyword maps per subagent
- [routing/CHAINS.md](./routing/CHAINS.md): multi-subagent chain decision trees and compound request handling
- [routing/SHARED_SKILLS.md](./routing/SHARED_SKILLS.md): shared-skill disambiguation matrix
- [routing/FAILURE_MODES.md](./routing/FAILURE_MODES.md): failure-mode playbook
- [routing/SUBAGENT_ROSTERS.md](./routing/SUBAGENT_ROSTERS.md): full skill rosters per subagent
- [routing/INDUSTRIES.md](./routing/INDUSTRIES.md): industry posture system (8 industries across 4 clusters)
- [routing/MCPS.md](./routing/MCPS.md): MCP integration framework (per-MCP specs in `routing/mcps/`)

### A note on skill naming

Some delivery skills Neo uses are prefixed `xcm-` (xcm-spec-generator, xcm-user-stories, xcm-component-gen, xcm-context-package, xcm-validation). The `xcm-` prefix is a legacy artifact of the upstream Anthropic plugin that ships these skills. The skills themselves are platform-agnostic and operate across any stack Neo supports. Treat the prefix as a forgettable name detail, not a positioning claim.

---

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) and [governance/EVOLUTION.md](./governance/EVOLUTION.md).

Changes follow the Evolution Protocol: propose, review, update routing, regression test, deploy.

---

## License

UNLICENSED (private, team-use only). May open-source in the future.

---

## Status

**Version:** 1.11.0 (beta)
**Cast:** complete (all 8 subagents in production)
**Last released:** 2026-05-26
