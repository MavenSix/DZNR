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
42 skills in Gandalf's roster (the four quality-standard skills, `legendary-standard`, `quality-gate`, `prompt-architecture` and, in v2.21.0, `midjourney-legendary`, added 2026-10-23), plus Kevin-authored skills routed to other subagents (see below) that also live in this folder.

## Non-Gandalf skills in this folder
Three Kevin-authored skills live physically here but route to **Gibson** (Experience Engineering), not Gandalf: `seedance-director`, `seedance-shotlist-director`, `game-studio`. This folder is Kevin's authored-skill home (symlinked to `~/.claude/skills/`), so authored skills land here regardless of which subagent owns their routing. Since 2026-10-23 two more route to **Snape** (`style-library`, `kevin-taste`) and one more to **Gibson** (`immersive-world-site`); `routing/SUBAGENT_ROSTERS.md` lists every non-Gandalf skill here with its owner. Gandalf's roster stays at its own explicit list in `routing/SUBAGENT_ROSTERS.md`. See `governance/DECISIONS.md` (2026-07-24 entry).

## Adding a workshop skill
Workshop skills are authored by Kevin directly. To add a new one:
1. Create `~/.claude/skills/<skill-name>/SKILL.md` (which appears here via symlink)
2. Update `routing/SUBAGENT_ROSTERS.md` Gandalf section
3. If the skill introduces new trigger words, update `routing/TRIGGERS.md`
4. Re-run stress tests

See `governance/EVOLUTION.md` "Adding a workshop skill" section.

## Listing
See `routing/SUBAGENT_ROSTERS.md` → Gandalf section for the full list of 38.
