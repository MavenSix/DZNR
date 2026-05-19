# DZNR Phase 3.3 Migration Report

**Date:** 2026-05-19
**Phase:** 3.3 — Skill migration (curated + workshop)
**Status:** ✅ Complete
**Validation:** PASSED

---

## What was migrated

### Group A — Curated skills (6 collision-resolution renames)

Six skills with frontmatter `name:` field updates to match their new disambiguated directory names. Per DECISIONS.md collision resolutions.

| New name | Source | Destination | Lines |
|----------|--------|-------------|-------|
| `competitive-brief-pm` | product-management plugin | `dznr/skills/curated/competitive-brief-pm/SKILL.md` | 302 |
| `competitive-brief-marketing` | marketing plugin | `dznr/skills/curated/competitive-brief-marketing/SKILL.md` | 331 |
| `data-viz-analytical` | data plugin | `dznr/skills/curated/data-viz-analytical/SKILL.md` | 305 |
| `data-viz-designerly` | designer-skills marketplace | `dznr/skills/curated/data-viz-designerly/SKILL.md` | ~60 |
| `productivity-start` | productivity plugin | `dznr/skills/curated/productivity-start/SKILL.md` | 158 |
| `bio-research-start` | bio-research plugin | `dznr/skills/curated/bio-research-start/SKILL.md` | 79 |

**Frontmatter updates verified:** all 6 files now have correct `name:` field matching their directory.

### Group B — Workshop skills (38 personal + IA pack preservation)

All 38 personal workshop skills copied from `~/.claude/skills/` into `dznr/skills/workshop/`. The 6 IA pack skills (created earlier this session) were preserved — no overwrites.

**Final workshop/ contents:** 44 skill directories

| Source | Count |
|--------|-------|
| Personal workshop skills migrated | 38 |
| IA pack skills (already in place) | 6 |
| **Total** | **44** |

Personal workshop skills migrated:
adapt, animate, arrange, audit, baseline-ui, bolder, brandkit, clarify, colorize, critique, delight, design-taste-frontend, distill, extract, fixing-accessibility, fixing-metadata, fixing-motion-performance, frontend-design, full-output-enforcement, gpt-taste, harden, high-end-visual-design, image-to-code, imagegen-frontend-mobile, imagegen-frontend-web, industrial-brutalist-ui, minimalist-ui, normalize, onboard, optimize, overdrive, polish, quieter, redesign-existing-projects, stitch-design-taste, teach-impeccable, typeset, ui-ux-pro-max

IA pack (already present, untouched):
innovation-accelerator, ia-prepare, ia-discover-day1, ia-define-day2, ia-synthesize, ia-build-handoff

### Group C — Backup created

Before any workshop migration:
- **Backup location:** `~/.claude/skills.backup-2026-05-19-pre-DZNR-migration/`
- **Contents:** 38 directories (identical to pre-migration `~/.claude/skills/`)
- **Status:** safe to delete after symlink wiring is confirmed working

---

## What was NOT touched

- Plugin skills (still in their plugin directories — accessed via references/)
- Anthropic-skills core (still in plugin location)
- Snake Eyes specialist skills (parked, called by name only)
- `~/.claude/skills/` itself — left untouched. Symlink wiring is the next deliberate step (NOT automated by this migration).

---

## Total skill count in DZNR repo

- **50 SKILL.md files** physically in `dznr/skills/`:
  - 44 in `skills/workshop/` (38 personal + 6 IA pack)
  - 6 in `skills/curated/` (renamed collision-resolution skills)

This is the active set DZNR will load. The remaining skills routed through subagent rosters live in their plugins and are referenced via `skills/references/*.md`.

---

## Validation results

`scripts/validate-routing.sh` re-run after migration: **PASSED**

All 5 routing docs present and well-sized:
- TRIGGERS.md (27596 bytes)
- CHAINS.md (34828 bytes)
- SHARED_SKILLS.md (19038 bytes)
- FAILURE_MODES.md (15582 bytes)
- SUBAGENT_ROSTERS.md (21219 bytes)
- STRESS_TEST.md present

References preserved:
- `skills/workshop/innovation-accelerator/references/IA_Facilitator_Run_of_Show_Guide.html`
- `skills/workshop/innovation-accelerator/references/Innovation_Accelerator_HighLevel_Flow.html`

---

## Next deliberate step — Workshop symlink (when ready)

The migration deliberately did NOT modify `~/.claude/skills/` yet. To complete the workshop sync setup:

```bash
cd "/Users/mavensix/Documents/Claude/Projects/DZNR (Agent)/dznr"
bash scripts/sync-workshop.sh
```

This script will:
1. Check if `~/.claude/skills` is already a symlink (no-op if so)
2. If it's a regular directory, prompt before backing it up (you already have a backup at `~/.claude/skills.backup-2026-05-19-pre-DZNR-migration/`, so this is safe)
3. Replace `~/.claude/skills` with a symlink to `dznr/skills/workshop/`

After symlink, editing any workshop skill in either `~/.claude/skills/` or `dznr/skills/workshop/` reflects in both. Kevin can author skills in his usual location and they auto-propagate to the DZNR repo.

**Don't run sync-workshop.sh until you're ready** — once it's run, your workshop directory is shared with the DZNR repo. Edits in either place affect both.

---

## Phase 3 status

| Phase | Status |
|-------|--------|
| 3.1 Evolution Protocol | ✅ Complete |
| 3.2 Repo scaffold | ✅ Complete |
| 3.3 Skill migration | ✅ Complete (this report) |
| 3.4 Build Tár | ⏭ Next |
| 3.5 Build Neo | ⏭ |
| 3.6+ Remaining subagents | ⏭ |

---

## CHANGELOG entry to add

```
## [1.1.1] — 2026-05-19

### Added — Skill migration (Phase 3.3)
- 6 curated collision-resolution skills physically created in dznr/skills/curated/
  with frontmatter name fields updated to match disambiguated directory names
- 38 personal workshop skills migrated from ~/.claude/skills/ into dznr/skills/workshop/
- IA pack (6 skills) preserved — no overwrites
- Backup of original ~/.claude/skills/ created at ~/.claude/skills.backup-2026-05-19-pre-DZNR-migration/

### Pending
- Workshop symlink wiring (sync-workshop.sh) deferred to user-initiated next step
```
