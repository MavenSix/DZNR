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
38 workshop skills (when sync is active).

## Adding a workshop skill
Workshop skills are authored by Kevin directly. To add a new one:
1. Create `~/.claude/skills/<skill-name>/SKILL.md` (which appears here via symlink)
2. Update `routing/SUBAGENT_ROSTERS.md` Gandalf section
3. If the skill introduces new trigger words, update `routing/TRIGGERS.md`
4. Re-run stress tests

See `governance/EVOLUTION.md` "Adding a workshop skill" section.

## Listing
See `routing/SUBAGENT_ROSTERS.md` → Gandalf section for the full list of 38.
