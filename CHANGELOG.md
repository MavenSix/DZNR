# DZNR Changelog

All notable changes to DZNR are documented here. Versioning follows the EVOLUTION.md semantic rules:
- **Major** (1.0 → 2.0): cast changes, chain structure changes, locked architecture changes
- **Minor** (1.0 → 1.1): new skills added, new MCPs integrated, new disambiguation rules
- **Patch** (1.0.0 → 1.0.1): trigger keyword tweaks, Snape phrasing refinements, doc clarifications

---

## [1.4.0] - 2026-05-26

### Added - Phase 3.5.2: Industry posture system

- `routing/INDUSTRIES.md`: 8 industries across 4 clusters (luxury, automotive, retail, cpg, fintech, healthcare, technology, media-entertainment, public-sector). Each industry has a posture profile with aesthetic defaults, tone defaults, research weights, compliance considerations, and pitch vocabulary.
- Hybrid tagging trigger: Sherlock infers industry during discovery, user can override or refine. If user explicitly stated industry in original request, Tár writes the tag immediately and skips inference.
- Industry tag lives in `memory/project_[name].md` frontmatter as `industry:` field with optional `industry-secondary:` for sub-vertical specificity.
- Per-subagent application rules documented: Snape heaviest reader (aesthetic, voice, system priorities); Sherlock sets the tag and applies in research weighting; Morpheus heavy reader for outbound vocabulary; Gibson applies for experience conventions; Neo mostly ignores (code is code, with rare platform-expectation flags).
- New directory `memory-templates/` with `project-template.md` showing the project memory file shape including industry frontmatter.
- Sherlock's `identify-industry` step documented as stub; full implementation lands in Phase 3.6+ when Sherlock is built.

### Changed

- `agents/tar/AGENT.md`: Memory Access Protocol section extended with industry posture check and industry inference path (depends on Sherlock availability)
- `README.md`: routing index now includes INDUSTRIES.md

### Rationale

Kevin flagged during Phase 3.5 review that XCentium-as-branch in Neo was a category error: XCentium is an employer, not a kind of work. The platform (Sitecore, LWC, AEM) is the real branch; XCentium is just one client of that branch. The deeper question this surfaced: what IS the right cross-cutting axis for adjusting work to context?

Industry is that axis. Luxury, fintech, healthcare, and the others have meaningfully different vocabulary, conventions, audience expectations, and risk profiles. Tagging by industry gives DZNR adaptive intelligence without splintering into separate subagents per vertical.

### Notes

- Industry-specific reference files (luxury-aesthetics.md, fintech-compliance.md, etc.) will be added as adopters request them
- Industries to consider in v1.1+: real estate, travel/hospitality (luxury sub-vertical), manufacturing/industrial B2B, energy/utilities, telecommunications, logistics, sports, higher education

---

## [1.3.1] - 2026-05-26

### Changed - XCentium positioning scrub

Following Kevin's review of Phase 3.5, all XCentium-as-positioning framing removed from DZNR routing docs and subagent prompts. XCentium is an employer of Kevin's, not a kind of work or a structural branch in DZNR. The xcm-* skills (xcm-spec-generator, xcm-user-stories, xcm-component-gen, xcm-context-package, xcm-validation) remain referenced by their plugin names because they are external Anthropic-distributed plugin skills; the `xcm-` prefix is legacy upstream naming, not a DZNR positioning claim.

**Files updated:**

- `agents/neo/AGENT.md`: full rewrite of Platform Posture section. Platforms now listed alphabetically as peers (no privileged default). Description and prose updated. Skills section renamed from "XCentium delivery" to "Specs, stories, validation, and CMS delivery". "Offshore handoff package" reframed as "Downstream team handoff package" with explicit note that adopters may have offshore, in-house, partner agency, or independent dev teams.
- `routing/CHAINS.md`: Chain 4 heading changed from "Delivery Flow (XCentium pipeline)" to "Delivery Flow"
- `routing/TRIGGERS.md`: Neo section subtitle changed from "XCentium pipeline" to "Multi-platform delivery pipeline"
- `routing/SUBAGENT_ROSTERS.md`: Neo role description rewritten to list supported platforms explicitly. "XCentium Delivery" section header renamed to "Specs, stories, validation, and CMS delivery"
- `routing/FAILURE_MODES.md`: forward-looking phase note neutralized
- `README.md`: added "A note on skill naming" section explaining the `xcm-` prefix as legacy upstream artifact

**Validated:**

- All 5 Neo stress tests still pass (TEST 1 Sitecore, TEST 5 LWC, TEST 15 design system, TEST 16 tech stack, TEST 20 native chat). Branch labels changed but trigger resolution is identical.
- Zero new XCentium-as-positioning references outside of CHANGELOG and governance/MIGRATION_REPORT history files.
- One XCentium mention remains intentional: in `routing/INDUSTRIES.md` Why-industries-not-companies reasoning section, used as the example of why org-name is the wrong organizing branch.

### Rationale

Kevin's quote when this was flagged: "I don't want companies to be a branch of this skill for designers. Now there could be industry branches like luxury, automotive, retail, finance, technology, manufacturing, and etc."

This patch removes the company-as-branch framing. The companion 1.4.0 release introduces industry-as-branch as the correct organizing axis.

---

## [1.3.0] - 2026-05-26

### Added - Phase 3.5: Neo subagent build (second production subagent)

- `agents/neo/AGENT.md` expanded from stub (45 lines) to production system prompt (477 lines)
- **Portability constraint applied**: Neo is platform-agnostic by default. XCentium is one branch among equals alongside generic React/Next/Vue, native mobile (iOS, Android, RN, Flutter), Salesforce LWC, Sitecore XM Cloud, AEM, static site generators, and backend services. Non-XCentium adopters see a clean delivery subagent without XCentium clutter.
- Core protocols documented:
  - **Chain 4 NODE 1-9 execution logic** with deterministic platform detection
  - **Hard validation loops** at NODE 4 (Layer 1 spec accuracy) and NODE 6 (Layer 2 visual fidelity); no override on either layer
  - **Mandatory Gandalf calls at NODE 5**: harden, polish, fixing-accessibility (always); fixing-motion-performance (when motion exists). Per-request user override allowed with explicit phrasing ("skip hardening", "speed mode", "rush this") logged in chain output for QA transparency.
  - **Advise-first protocol** when Tár flags consultation framing: 2-4 platform options with trade-offs across 6 axes (effort, performance, cost, complexity, ecosystem fit, feasibility risk) plus Neo's recommended pick and reasoning
  - **Memory access** for platform decisions per project (sticky after first build) and recurring validation failures (upstream spec quality signal)
- Cross-subagent patterns documented: receiving handoffs from Sherlock/Snape/Gibson/Gandalf-IA-mode, calling Gandalf as a tool, pulling Snape for design-fidelity reviews at NODE 4, handing off to Morpheus at NODE 9

### Changed

- `agents/tar/AGENT.md` advise-first trigger list extended to include "tell me which", "which should I use", "help me choose" (caught during Neo stress test TEST 16; cleaner detection on recommendation requests)

### Validated

- 5 stress tests walked against Neo's prompt: TEST 1 (Sitecore JSS spec), TEST 5 (LWC with QA loop), TEST 15 (full design system build with WCAG 2.2 and motion), TEST 16 (product/market analysis with tech stack feasibility), TEST 20 (native chat prototype in compound). All PASS.
- Mandatory Gandalf calls verified to fire correctly at NODE 5 across all platforms
- Hard validation loops verified at NODE 4 and NODE 6
- Advise-first activation verified on consultation framing
- Zero em-dashes in Neo's AGENT.md (per user style rule)

### Notes

- Two subagents now in production: Tár (orchestrator) and Neo (delivery)
- Future iterations may move platform-specific reference content (Sitecore, LWC, AEM internals) to load-on-demand reference files to keep core prompt lean if adoption grows
- Remaining subagents: Snape, Sherlock, Gibson, Morpheus, Gandalf, Snake Eyes

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
