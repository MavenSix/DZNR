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
# Clone the repo to your home directory
git clone https://github.com/MavenSix/DZNR.git ~/DZNR
```

That's the only required install step. DZNR loads as a local plugin via the `--plugin-dir` flag when you run Claude Code:

```bash
claude --plugin-dir ~/DZNR
```

You can also pass `--plugin-dir` from anywhere by pointing at the absolute path. If you prefer to run Claude Code from inside the repo, `claude --plugin-dir .` works too.

### Why not `claude plugin install ./dznr`?

The `claude plugin install` command requires a configured marketplace. DZNR is not currently published to one, so the install command would fail with "Plugin not found in any configured marketplace." The `--plugin-dir` flag is Claude Code's official path for loading a local plugin directly during development or for solo and small-team use.

If you want to publish DZNR to your own marketplace (or fork it into a team marketplace), see `claude plugin marketplace --help`.

### Optional: workshop sync

The workshop sync makes Gandalf's 38 personally-authored craft skills available outside DZNR's namespace (so you can use them in non-DZNR projects):

```bash
~/DZNR/scripts/sync-workshop.sh
```

The script handles three cases:

1. **No existing `~/.claude/skills`:** creates the symlink to `dznr/skills/workshop/`. Done.
2. **`~/.claude/skills` is already a symlink to the workshop:** detects and exits cleanly.
3. **`~/.claude/skills` exists as a regular directory with content:** warns, backs up to `~/.claude/skills.backup-[date]/`, then creates the symlink.

If you have a custom workshop in `~/.claude/skills`, back it up first (the script will warn before touching anything).

## Verify install

Open a Claude Code session with DZNR loaded:

```bash
claude --plugin-dir ~/DZNR
```

Inside Claude Code, run:

```
/agents
```

You should see eight DZNR subagents under the `dznr:` namespace:

- `dznr-os:tar:tar` (orchestrator)
- `dznr-os:snape:snape` (brand and design systems)
- `dznr-os:sherlock:sherlock` (discovery and research)
- `dznr-os:gibson:gibson` (experience engineering and AI product)
- `dznr-os:neo:neo` (delivery and code)
- `dznr-os:morpheus:morpheus` (pitch and story)
- `dznr-os:gandalf:gandalf` (workshop tri-mode)
- `dznr-os:snake-eyes:snake-eyes` (specialist arsenal)

If they appear, DZNR loaded successfully. Run `/dznr` (with no arguments) to see Tár introduce the cast in her own voice.

You can also run `claude plugin validate ~/DZNR` from a shell to validate the plugin manifest and agent definitions. Expected output: "Validation passed with warnings" (the warnings are about README.md files in agent directories, which are cosmetic).

Then try a real request via the everyday command:

```
/dznr audit https://example.com
```

Tár routes to Sherlock for the audit. Sherlock may run the `identify-industry` step during the audit and write an industry tag to project memory. You'll see Tár's in-character status announcements at each phase boundary so you can watch the routing happen.

For a compound test, try:

```
/dznr discover the brand at https://stripe.com and propose how their docs design system could evolve, end-to-end
```

Tár will detect compound (the `end-to-end` Tier 1 phrase), present the bundle plan with any scope questions she needs answered upfront, then dispatch in phases. Each phase announces who's working and what they're doing in that character's voice.

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

Since DZNR is loaded via `--plugin-dir`, "uninstalling" is just:

1. Stop using the `--plugin-dir ~/DZNR` flag in your `claude` commands.
2. Optionally delete the cloned repo: `rm -rf ~/DZNR`
3. Optionally remove the workshop symlink:

```bash
# Confirm with ls -la ~/.claude/skills before removing
ls -la ~/.claude/skills
rm ~/.claude/skills
```

If you backed up a previous `~/.claude/skills` to `~/.claude/skills.backup-[date]/`, you can restore it after removing the symlink.

## Troubleshooting

### "Plugin not found in any configured marketplace"

You used `claude plugin install ./dznr`. That command requires a marketplace; DZNR is loaded via `--plugin-dir` instead. Use `claude --plugin-dir ~/DZNR` to launch Claude Code with DZNR loaded.

### "Workshop sync failed"

Check that `~/.claude/skills` exists or does not exist (the sync script will tell you). If it has unsaved skills, the script backs them up; check `~/.claude/skills.backup-[date]/` after running.

### "Subagent not found" or `/dznr` does not appear

DZNR's subagents are namespaced under `dznr:`. Direct invocation uses the triple-colon pattern: `@dznr-os:tar:tar`, `@dznr-os:snape:snape`, and so on. Verify with `/agents` inside Claude Code; you should see all eight DZNR subagents listed under the Library tab.

If `/dznr` does not appear when you type `/`, the slash command may not be registered. Confirm `~/DZNR/commands/dznr.md` exists. If it does, the `--plugin-dir` load may not be picking up commands; check Claude Code's release notes for plugin command support in your CLI version.

### "Skill X not available"

Some skill came from a plugin you have not installed. The DZNR plugin only ships agents, not other plugins' skills. Install the missing plugin from your Claude Code marketplace if you want the full skill set.

### Plugin validation warnings

Running `claude plugin validate ~/DZNR` may show 8 warnings about README.md files in agent directories lacking frontmatter. These are cosmetic and do not affect plugin behavior. They will be addressed in a future cleanup pass.

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
