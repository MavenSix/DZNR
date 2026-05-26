# DZNR Changelog

All notable changes to DZNR are documented here. Versioning follows the EVOLUTION.md semantic rules:
- **Major** (1.0 → 2.0): cast changes, chain structure changes, locked architecture changes
- **Minor** (1.0 → 1.1): new skills added, new MCPs integrated, new disambiguation rules
- **Patch** (1.0.0 → 1.0.1): trigger keyword tweaks, Snape phrasing refinements, doc clarifications

---

## [1.2.0] - 2026-05-26

### Added - Phase 3.4: Tár subagent build (first fully-built subagent)

- `agents/tar/AGENT.md` expanded from stub (78 lines) to production system prompt (491 lines)
- Six core protocols documented:
  - **Routing Algorithm** with 8-step deterministic procedure (memory check, compound detection, explicit specialist scan, primary trigger scan, disambiguation, compound protocol, dispatch, handoff inference)
  - **Memory Access Protocol** with explicit reads (`memory/project_dznr_*.md`, `memory/MEMORY.md`) + reliance on global auto-memory for user profile and feedback memories
  - **Compound Request Parser** with 3-tier recognition and dependency graph construction (hybrid dispatch: parallel where safe, sequential where required)
  - **Dispatch Protocol** for single-subagent and multi-phase compound flows
  - **Ambiguity Protocol** with tiered voicing rules (Snape voices routing ambiguity, Tár voices scope ambiguity)
  - **Gandalf Orchestrator Mode Exception** (Chain 6 / IA only, well-bounded by explicit triggers)
- Confidence threshold heuristic documented (>80% silent route, 50-80% silent + log to memory, <50% Snape clarifies, <30% Snape clarifies + offers explanation)
- Failure mode protocol (3-strike retry then user-facing question)

### Validated
- 5 stress tests walked against the new prompt (Tests 1, 2, 8, 19, 23): all PASS
- Tests cover simple route, compound parallel+sequential dispatch, default disambiguation, advise-first consultation, Gandalf orchestrator-mode handoff
- No em-dashes present (per user style rule)

### Notes
- This is the first subagent moved from stub to production status
- Remaining subagents to be built in priority order: Neo (XCentium delivery), then Snape, Sherlock, Gibson, Morpheus, Gandalf, Snake Eyes
- Two coordination points flagged for future subagent builds: (1) advise-first flag must be honored by downstream subagents Gibson and Neo when implemented; (2) routing decision logging to project memory needs a memory file template

---

## [1.1.1] - 2026-05-19

### Added — Skill migration (Phase 3.3)
- 6 curated collision-resolution skills physically created in `dznr/skills/curated/` with frontmatter `name:` fields updated to match disambiguated directory names (competitive-brief-pm, competitive-brief-marketing, data-viz-analytical, data-viz-designerly, productivity-start, bio-research-start)
- 38 personal workshop skills migrated from `~/.claude/skills/` into `dznr/skills/workshop/`
- IA pack (6 skills from v1.1.0) preserved — no overwrites
- Backup of original `~/.claude/skills/` created at `~/.claude/skills.backup-2026-05-19-pre-DZNR-migration/`
- Migration report: `governance/MIGRATION_REPORT_2026-05-19.md`

### Pending
- Workshop symlink wiring (`scripts/sync-workshop.sh`) deferred to user-initiated next step

---

## [1.1.0] — 2026-05-19

### Added — Innovation Accelerator skill pack

- 6 new skills owned by Gandalf:
  - `innovation-accelerator` (master)
  - `ia-prepare` (Stage 1: pre-workshop discovery + brand eval)
  - `ia-discover-day1` (Stage 2: Day 1 facilitation)
  - `ia-define-day2` (Stage 3: Day 2 facilitation + sign-off gate)
  - `ia-synthesize` (Stage 4: requirements + Linear backlog + estimation)
  - `ia-build-handoff` (Stage 5: prototype + sprint kickoff)
- New architectural pattern: **Inverse Orchestration** — Gandalf calls other subagents during IA chains (documented exception, IA only)
- New routing chain: **Chain 6 — Innovation Accelerator**
- 3 new stress tests (Tests 23, 24, 25) — to be added in Step 4 regression
- Reference HTML files co-located in `skills/workshop/innovation-accelerator/references/`
- Proposal doc: `governance/proposals/2026-05-18-innovation-accelerator.md`

### Changed

- `agents/gandalf/AGENT.md` — adds "Orchestrator mode" as third operating model
- `routing/CHAINS.md` — adds Chain 6 with full decision tree
- `routing/TRIGGERS.md` — adds Gandalf IA triggers + stage-specific triggers
- `routing/SUBAGENT_ROSTERS.md` — Gandalf roster grows from 38 to 44 skills

---

## [1.0.0-alpha] — 2026-05-18

### Initial scaffold

**Architecture locked:**
- 8 character roles defined: Tár (orchestrator), Snape (brand+clarifier), Sherlock (discovery), Gibson (experience+AI product), Neo (delivery), Morpheus (pitch), Gandalf (workshop), Snake Eyes (specialist arsenal)
- Routing system documented across 5 files (TRIGGERS, CHAINS, SHARED_SKILLS, FAILURE_MODES, SUBAGENT_ROSTERS)
- 22 stress tests traced and passing
- Evolution Protocol established with 5-step workflow

**Skills consolidated:**
- 497 SKILL.md files scanned → 359 unique → ~162 routed through DZNR + ~55 parked in Snake Eyes
- 4 name collisions resolved (competitive-brief, data-visualization, frontend-design, start)
- 38 workshop skills assigned to Gandalf

**Integrations:**
- Magic Patterns MCP integration proposed and approved (pending MCP connection)
- Mobbin MCP integration mapped for when MCP becomes available

**Repo scaffold:**
- Folder structure created
- Plugin manifest authored
- Documentation skeleton in place

### Pending

- Skill migration (Phase 3.3)
- Tár subagent build (Phase 3.4)
- Neo subagent build (Phase 3.5)
- Remaining subagents (Phase 3.6+)

---

## Conventions

When adding entries:
- Use `## [version] — YYYY-MM-DD` format
- Group changes under: Added / Changed / Deprecated / Removed / Fixed / Security
- Link to the proposal doc in `governance/proposals/` if applicable
- Reference the stress-test run that validated the change
