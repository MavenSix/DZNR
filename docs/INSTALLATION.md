# DZNR Installation

## Prerequisites

- **Claude Code CLI** installed and authenticated (see https://docs.claude.com)
- **macOS, Linux, or WSL** (Windows native not fully tested yet)
- **Git** for cloning the repo
- **Existing Claude plugins** — DZNR composes skills from plugins you already have installed. The current required set:
  - `anthropic-skills` (core)
  - `productivity`
  - `design`
  - `engineering`
  - `figma`
  - `brand-voice`
  - `marketing`
  - `product-management`
  - `enterprise-search`
  - `data`
  - `searchfit-seo`
  - `pdf-viewer`
  - `cowork-plugin-management`
  - `operations`
  - `product-tracking-skills`
  - `adobe-for-creativity`
  - `legal`
  - `bio-research` (optional — only if doing biotech work)

If any are missing, DZNR will still install but some subagent rosters will have unavailable skills. Check after install.

## Install

```bash
# Clone the repo
git clone https://github.com/MavenSix/DZNR.git
cd DZNR

# Install as a Claude Code plugin
claude plugin install ./dznr

# Set up the workshop symlink (so your ~/.claude/skills feeds into Gandalf)
./dznr/scripts/sync-workshop.sh
```

## Verify

After install:

```bash
# Confirm DZNR registered
claude plugin list | grep dznr

# Confirm subagents are available
claude agent list | grep dznr
# Should show: dznr:tar, dznr:snape, dznr:sherlock, dznr:gibson, dznr:neo, dznr:morpheus, dznr:gandalf, dznr:snake-eyes
```

## First run

```bash
claude chat
```

Then try:
> "What can DZNR do?"

Tár will respond with an overview of the cast and what each subagent handles.

## Uninstall

```bash
claude plugin uninstall dznr

# Remove the workshop symlink (your skills stay in ~/.claude/skills if you backed up)
rm ~/.claude/skills  # only if it's the symlink — confirm with ls -la first
```

## Troubleshooting

### "Plugin manifest not found"
Make sure you're inside the DZNR repo root and the `dznr/` subdirectory exists. The plugin path is `./dznr`, not just `.`.

### "Workshop sync failed"
Check that `~/.claude/skills` exists or doesn't exist (the sync script will tell you). If it has unsaved skills, back them up first.

### "Subagent not found"
DZNR's subagents are namespaced under `dznr:`. Make sure you're using `@dznr:snape` not `@snape`.

### "Skill X not available"
Some skill came from a plugin you haven't installed. Run `claude plugin list` to see what's available and install the missing plugin.

## Status
This installation guide is a stub. Phase 3.3 (migration script) will populate the actual install scripts.
