# DZNR Consolidation Decisions

**Owner:** Kevin
**Locked:** 2026-05-18
**Purpose:** Single source-of-truth for every decision made during skill consolidation. Future sessions reference this so we don't relitigate. Updates require explicit Kevin approval.

---

## Target structure (chosen)

**Option C: Hybrid**

- `~/.claude/skills/` → personal workshop, stays as-is
- `~/Documents/Claude/Projects/DZNR (Agent)/` → DZNR repo, curated agent skills live here
- `~/.claude/plugins/` → marketplaces and plugin caches, untouched

Promotion path: workshop → DZNR repo when a skill is ready to be part of the orchestrated agent system.

---

## Rename strategy (chosen)

**Don't rename inside installed plugins.**

Reasoning: Plugins already namespace via `plugin-name:skill-name`. The collision is cosmetic, not functional. Renaming inside an installed plugin breaks on the next plugin update because the plugin authors push their own `name:` field in the frontmatter.

What we do instead: when we copy curated versions into the DZNR repo, we give them clear names there. Plugin originals stay untouched as backup.

---

## Collision resolutions

### 1. competitive-brief (BOTH versions kept)

**Kevin's call:** "Product management is my line of work — that's my default. But I need the marketing version too for competitive analysis."

| Source | Kept? | DZNR name | Notes |
|--------|-------|-----------|-------|
| `product-management:competitive-brief` | ✅ Default | `competitive-brief-pm` (in DZNR repo) | Strategic/PRD-flavored. Default trigger for "competitive brief". |
| `marketing:competitive-brief` | ✅ Secondary | `competitive-brief-marketing` (in DZNR repo) | Positioning/messaging-flavored. Trigger explicitly when doing competitive marketing work. |

**Implementation:**
- Installed plugins: leave alone, no edits to frontmatter
- DZNR repo: when curated into DZNR, copy both with disambiguated names above
- Orchestrator routing: default to PM version unless context names marketing/positioning/messaging

---

### 2. data-visualization (BOTH versions kept, separate skills)

**Kevin's call:** "These need to be separate skills still."

| Source | Kept? | DZNR name | Notes |
|--------|-------|-----------|-------|
| `data:data-visualization` | ✅ | `data-viz-analytical` | Rigorous, matplotlib/seaborn/plotly. For real data work. |
| `designer-skills:data-visualization` | ✅ | `data-viz-designerly` | Visual design lens — color theory, hierarchy. For when the chart is part of a brand story. |

**Implementation:**
- Both stay loaded as separate skills
- Different names in DZNR repo to make the distinction obvious
- Orchestrator: default to analytical version for data work, designerly for editorial/brand work

---

### 3. frontend-design (KEEP KEVIN'S VERSION)

**Kevin's call:** "I like MY front-end design skill better. Hopefully I can make modifications later to update it."

| Source | Kept? | DZNR name | Notes |
|--------|-------|-----------|-------|
| `~/.claude/skills/frontend-design/` (Kevin's) | ✅ Winner | `frontend-design` | Kevin's authored version. Lives in workshop. |
| Plugin/cache versions of `frontend-design` | ❌ | — | Don't load. Plugin originals stay on disk untouched, just not curated into DZNR. |

**Implementation:**
- Kevin's `frontend-design` gets imported into DZNR repo
- Plugin version stays on disk but is not part of the DZNR orchestrated set
- Future modifications: Kevin can edit the DZNR copy. Workshop copy stays as personal default.

---

### 4. start (RENAMED to disambiguate)

**Kevin's call:** "Rename to disambiguate."

| Source | Kept? | DZNR name | Notes |
|--------|-------|-----------|-------|
| `productivity:start` | ✅ | `productivity-start` (in DZNR repo) | Initialize productivity dashboard. |
| `bio-research:start` | ✅ (if used) | `bio-research-start` (in DZNR repo, only if you do biotech work) | Orient in bio-research plugin. |

**Implementation:**
- Installed plugins: leave alone
- DZNR repo: rename on copy-in to make the distinction loud
- Note: if you don't actively use bio-research, we skip importing it entirely

---

## Workshop skills (`~/.claude/skills/`, 38 skills)

**Kevin's call:** "Bulk import all 38 into DZNR for now. Triage when building each subagent."

| Action | Status |
|--------|--------|
| Move workshop skills into DZNR? | Yes, all 38 |
| Destination | `DZNR (Agent)/skills/workshop/` |
| Decisions on keep/kill/maybe | Deferred to subagent build time |
| Workshop folder stays in `~/.claude/skills/` | Yes, as the working copy (Kevin authors there) |

**Sync rule:** When Kevin modifies a workshop skill in `~/.claude/skills/`, the DZNR repo copy is updated via a sync script (to be written later). DZNR copy is the published version; workshop copy is the draft.

---

## Exact-duplicate cleanup policy

**Decision:** Leave plugin caches and marketplace mirrors alone. The Claude Code runtime manages those. We just stop counting them in our inventory.

What we DO clean up:
- ✅ `~/Desktop/claude-skills-upgrade/` → review and archive once we confirm migration is complete
- ✅ `~/Downloads/synthetic-persona/` → version-compare against loaded `synthetic-audience`, decide
- ❌ `~/.claude/plugins/cache/*` → leave alone
- ❌ `~/.claude/plugins/marketplaces/*` → leave alone

---

## Snake Eyes — Specialist Arsenal (parked, callable explicitly)

These plugins stay installed and accessible but are NOT wired into the DZNR orchestrator routing. They live in the Snake Eyes roster — silent specialists, deployed by name:

- bio-research (off-domain unless you start biotech work)
- legal (separate concern, call explicitly when needed)
- product-tracking-skills (telemetry, call explicitly)
- operations (mostly compliance/vendor stuff, call explicitly)
- adobe-for-creativity (call when needed)

---

## What gets imported into DZNR

### Tier 1 — Core orchestration (always loaded)
- orchestrator
- memory-management
- consolidate-memory
- schedule

### Tier 2 — Anthropic-skills core (curated subset)
All 57 Anthropic-skills core skills, organized by subagent (see SKILLS_INVENTORY.md section 5.2 for the breakdown).

### Tier 3 — Plugin skills (curated)
Specific skills from these plugins, mapped to subagents:
- adobe-for-creativity (subagent: Visual)
- brand-voice (subagent: Brand & Voice)
- data (subagent: Data — note both data-viz versions)
- design (subagent: Design Systems & UI)
- enterprise-search (subagent: Discovery)
- figma (subagent: Design Systems & UI)
- marketing (subagent: Pitch & Story, includes competitive-brief-marketing)
- product-management (subagent: Strategy, includes competitive-brief-pm)
- searchfit-seo (subagent: SEO/Content)

### Tier 4 — Workshop (38 skills, bulk-imported)
All of `~/.claude/skills/` copied into `DZNR/skills/workshop/`. Triaged later when building subagents.

---

## Open questions (parked, not decided yet)

1. Do you want DZNR distributed via a Claude Code plugin marketplace or just GitHub clone-and-install?
2. What's the trigger keyword set for DZNR vs invoking the orchestrator skill directly?
3. Do subagents need their own memory partitions or share the global memory system?

These get answered when we start building Subagent 1.

---

## Change log

| Date | Decision | Notes |
|------|----------|-------|
| 2026-05-18 | Initial decisions locked | All 4 collisions resolved, structure chosen, workshop deferred |
| 2026-05-18 | Magic Patterns MCP integration approved (PENDING connection) | Primary owner: Snape. Secondary: Gibson. Gandalf imagegen-frontend-* overlap rule established. First run of Evolution Protocol — used as canonical worked example. Live status conditional on MCP connection. |
