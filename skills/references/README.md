# Skill References

This folder contains roster files for each subagent. Each file LISTS the skills the subagent uses **without duplicating the SKILL.md content**.

## Why references, not duplicates?

During Phase 1 ledger work, we found 138 duplicate SKILL.md files across plugin caches and marketplaces. We don't want to compound that problem.

For each routed skill, the canonical location is:
- **Plugin skills:** wherever the plugin runtime installs them (auto-managed)
- **Anthropic-skills core:** the anthropic-skills plugin location
- **Workshop skills:** `skills/workshop/` (symlinked from `~/.claude/skills/`)
- **DZNR-curated:** `skills/curated/` (renamed versions like `competitive-brief-pm`)

The reference files in this folder are pointers, not copies.

## Files
- `snape-roster.md` — Snape's 32 routed skills
- `sherlock-roster.md` — Sherlock's 22 routed skills
- `gibson-roster.md` — Gibson's 19 routed skills
- `neo-roster.md` — Neo's 24 routed skills
- `morpheus-roster.md` — Morpheus's 19 routed skills
- `snake-eyes-roster.md` — Snake Eyes' ~55 parked skills

Tár's roster lives in `agents/tar/AGENT.md` since it's small (8 skills).
Gandalf's roster IS `skills/workshop/` directly.
