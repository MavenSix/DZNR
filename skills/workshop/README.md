# Workshop Skills (Gandalf's roster)

This folder is **symlinked from `~/.claude/skills/`**. When Kevin edits a workshop skill locally, the change reflects here immediately and vice versa.

## Setup

After cloning this repo, run:
```bash
# Back up your existing ~/.claude/skills if any
mv ~/.claude/skills ~/.claude/skills.backup

# Symlink the workshop into ~/.claude/skills
ln -s "$(pwd)/skills/workshop" ~/.claude/skills
```

Or run `scripts/sync-workshop.sh` which handles this automatically.

## Current count
38 skills in Gandalf's roster, plus 3 Gibson-routed Kevin-authored skills (see below) that also live in this folder.

## Non-Gandalf skills in this folder
Three Kevin-authored skills live physically here but route to **Gibson** (Experience Engineering), not Gandalf: `seedance-director`, `seedance-shotlist-director`, `game-studio`. This folder is Kevin's authored-skill home (symlinked to `~/.claude/skills/`), so authored skills land here regardless of which subagent owns their routing. Gandalf's roster stays at its own explicit list in `routing/SUBAGENT_ROSTERS.md`. See `governance/DECISIONS.md` (2026-07-24 entry).

## Adding a workshop skill
Workshop skills are authored by Kevin directly. To add a new one:
1. Create `~/.claude/skills/<skill-name>/SKILL.md` (which appears here via symlink)
2. Update `routing/SUBAGENT_ROSTERS.md` Gandalf section
3. If the skill introduces new trigger words, update `routing/TRIGGERS.md`
4. Re-run stress tests

See `governance/EVOLUTION.md` "Adding a workshop skill" section.

## Listing
See `routing/SUBAGENT_ROSTERS.md` → Gandalf section for the full list of 38.
