# DZNR Installation

## Prerequisites

- **Claude Code CLI** installed and authenticated. See https://docs.claude.com for current install instructions.
- **macOS, Linux, or WSL.** Windows native is not fully tested. WSL works the same as Linux.
- **Git** for cloning the repo.
- **Existing Claude plugins** that DZNR composes skills from (see plugin list below).

> Install commands in this document follow Claude Code plugin conventions as of 2026-05-26. If your Claude CLI version differs, verify with `claude --help` or check the official Claude Code docs.

### Required Claude plugins

DZNR's subagent rosters reference skills from these plugins. If a plugin is missing, the relevant skills will be unavailable but DZNR's routing still works (subagents flag the gap in their output).

Core required for all subagents:

- `anthropic-skills`
- `productivity`
- `design`
- `engineering`
- `figma`
- `brand-voice`
- `marketing`
- `product-management`
- `enterprise-search`
- `data`

Required for Snake Eyes specialist clusters (install only the ones you use):

- `searchfit-seo` (SEO cluster, Kevin-relevant)
- `pdf-viewer` (PDF Tools)
- `operations` (Operations cluster)
- `product-tracking-skills` (Telemetry cluster)
- `adobe-for-creativity` (Adobe cluster, Kevin-relevant)
- `legal` (Legal cluster, often parked)
- `bio-research` (Bio Research cluster, often parked)
- `cowork-plugin-management` (optional plugin management utility)

If a plugin is missing when DZNR routes to a skill from it, the subagent will flag the gap. You can install the missing plugin and re-run, or proceed without the skill.

## Install

```bash
# Clone the repo
git clone https://github.com/MavenSix/DZNR.git
cd DZNR

# Install as a Claude Code plugin
claude plugin install ./dznr

# Set up the workshop symlink (so ~/.claude/skills feeds into Gandalf)
./dznr/scripts/sync-workshop.sh
```

The `sync-workshop.sh` script handles three cases:

1. **No existing `~/.claude/skills`:** creates the symlink to `dznr/skills/workshop/`. Done.
2. **`~/.claude/skills` is already a symlink to the workshop:** detects and exits cleanly.
3. **`~/.claude/skills` exists as a regular directory with content:** warns, backs up to `~/.claude/skills.backup-[date]/`, then creates the symlink.

If you have a custom workshop in `~/.claude/skills`, back it up first (the script will warn before touching anything).

## Verify install

```bash
# Confirm DZNR registered as a plugin
claude plugin list | grep dznr

# Confirm subagents are available
claude agent list | grep dznr
```

Expected agents: `dznr:tar`, `dznr:snape`, `dznr:sherlock`, `dznr:gibson`, `dznr:neo`, `dznr:morpheus`, `dznr:gandalf`, `dznr:snake-eyes`.

> The exact `claude plugin list` and `claude agent list` syntax depends on your Claude CLI version. If those commands do not return the expected output, check `claude --help` for the equivalent commands.

## First run

```bash
claude chat
```

Then try:

> "What can DZNR do?"

Tár will respond with an overview of the cast. Then try a real request:

> "Audit https://example.com"

Sherlock should respond with a site audit. Sherlock may run the `identify-industry` step during the audit and write an industry tag to project memory.

## Industry tagging on first project

When you start a new project, DZNR will identify (or ask about) the industry. The tag affects how multiple subagents adjust their defaults. You can declare it up front:

> "Starting a new fintech project for [client]."

Or let Sherlock infer during initial discovery. Either way, the tag lives in your project memory and propagates to every subagent on subsequent requests.

Supported industries: luxury, automotive, retail, CPG, fintech, healthcare, technology, media/entertainment, public sector. See [routing/INDUSTRIES.md](../routing/INDUSTRIES.md) for full posture profiles.

## MCP integrations

DZNR documents MCP integrations in `routing/mcps/` with status tracking. Currently documented:

- **ACTIVE:** Figma, Pencil, Adobe, Blender (when local Blender is running), plus workspace cluster (Slack, Drive, Granola, Notion, Gmail/Calendar, PDF Tools, Gong, Shopify, Apple Notes, Apify) and deployment cluster (Vercel, Netlify, Supabase)
- **CONFIGURED-NOT-ACTIVE:** Magic Patterns (registry connected, session tools surface on demand)
- **PENDING:** Mobbin, Higgsfield (awaiting MCP availability)

DZNR routes to MCPs only when they are ACTIVE. PENDING MCPs trigger fallback workflows documented in their spec files. See [routing/MCPS.md](../routing/MCPS.md) for the full framework.

You can connect additional MCPs through your Claude app. DZNR will not interfere; it just routes to what is available.

## Uninstall

```bash
claude plugin uninstall dznr

# Optionally remove the workshop symlink
# (confirm with ls -la ~/.claude/skills before removing; restore your backup if applicable)
ls -la ~/.claude/skills
rm ~/.claude/skills
```

If you backed up a previous `~/.claude/skills` to `~/.claude/skills.backup-[date]/`, you can restore it after removing the symlink.

## Troubleshooting

### "Plugin manifest not found"

Make sure you are inside the DZNR repo root and the `dznr/` subdirectory exists. The plugin path is `./dznr`, not just `.`.

### "Workshop sync failed"

Check that `~/.claude/skills` exists or does not exist (the sync script will tell you). If it has unsaved skills, the script backs them up; check `~/.claude/skills.backup-[date]/` after running.

### "Subagent not found"

DZNR's subagents are namespaced under `dznr:`. Make sure you are using `@dznr:snape` not `@snape`. Verify with `claude agent list` (or your CLI version's equivalent).

### "Skill X not available"

Some skill came from a plugin you have not installed. Check `claude plugin list` (or equivalent) to see what is available, then install the missing plugin from the required-plugins list above.

### Industry tag not appearing in project memory

The `identify-industry` step runs when Sherlock is dispatched to a new project. If Sherlock has not been invoked on your project yet, the tag will not exist. Either invoke Sherlock for a discovery pass, or declare the industry explicitly: "this is a [industry] project."

### MCP tools not surfacing

Check the MCP's status in `routing/mcps/[name].md`. ACTIVE MCPs should surface tools when needed. CONFIGURED-NOT-ACTIVE MCPs (like Magic Patterns) load tools on demand when relevant context is shared. PENDING MCPs are not yet connected; fallback workflows apply.

### "Three retries failed"

DZNR's failure-mode playbook in [routing/FAILURE_MODES.md](../routing/FAILURE_MODES.md) documents what to do. Common: reframe the request, or invoke a different subagent if routing missed the intent.

## Next steps

- See [GETTING_STARTED.md](./GETTING_STARTED.md) for usage examples
- See [TEAM_REFERENCE_CARD.md](./TEAM_REFERENCE_CARD.md) for a one-page cheat sheet
- See [ADOPTERS.md](./ADOPTERS.md) if you want to fork DZNR for your own practice
- See [ARCHITECTURE.md](./ARCHITECTURE.md) for the architectural patterns
