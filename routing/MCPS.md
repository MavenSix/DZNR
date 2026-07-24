# DZNR MCP Integration Framework

**Status:** v1.0 (Phase 3.6.5, 2026-05-26)
**Purpose:** Every MCP that DZNR routes through gets a documented spec covering ownership, triggers, workflow, status, fallback, and memory tags. New MCPs follow a predictable path from proposal to activation.

This document explains the framework. Per-MCP specs live in `routing/mcps/`.

---

## Why this exists

DZNR depends on external MCP servers for many capabilities (Figma orchestration, Adobe creative tools, design pattern libraries, 3D creation, AI video generation, etc.). Without a documented framework:

1. New MCPs get added ad-hoc, each in slightly different ways
2. PENDING / ACTIVE status is invisible until you actually try to use one
3. Subagent prompts duplicate MCP details inline, making updates painful
4. No clear path for adopters to add MCPs DZNR doesn't currently know about

The framework solves these by giving every MCP a single source of truth (one spec file) and a predictable lifecycle (proposal, documentation, connection, activation).

---

## How MCPs map to subagents

MCPs are owned by the subagent whose domain they extend. Examples:

- **Figma MCP**: Snape (brand and design systems primarily) and partially Neo (figma-code-connect)
- **Adobe MCP**: Snake Eyes (specialist invocation by name)
- **Blender MCP**: Gibson (3D experience design)
- **Magic Patterns MCP**: Snape (brand and UI exploration)
- **Mobbin MCP**: Sherlock (design pattern research) and Snape (pattern reference)
- **Higgsfield MCP**: Gibson (AI video generation as experience output) or Morpheus (video for pitch and campaign content)
- **Pencil MCP**: Snape (design file editing) and partially Neo (component code from design files)
- **Slack MCP**: cross-cutting (Tár for memory and references, Morpheus for outbound, Sherlock for search)
- **Google Drive MCP**: cross-cutting (Sherlock for discovery, Morpheus for document delivery)
- **Granola MCP**: cross-cutting (Sherlock for meeting transcripts as research input)

When an MCP serves multiple subagents, the spec lists primary owner first and secondary owners after.

---

## MCP lifecycle

Every MCP in DZNR moves through these states:

1. **PROPOSED**: Someone (Kevin or an adopter) suggests an MCP integration. Goes through Evolution Protocol Step 1 (proposal doc in `governance/proposals/`).
2. **DOCUMENTED**: Proposal approved. Spec written in `routing/mcps/[name].md`. Routing updates applied (triggers added to TRIGGERS.md, subagent prompts updated if needed). Status: PENDING.
3. **PENDING**: Spec is live; MCP is not connected yet. Subagent prompts have triggers wired but workflow falls back to manual substitute when actually invoked.
4. **CONFIGURED-NOT-ACTIVE**: MCP is connected at the registry/account level but tools are not yet exposed in active sessions. May happen because the MCP loads tools on-demand (e.g., only when a relevant context is shared) or because session-scoped tool surfacing has not yet exercised the MCP. Subagents treat this as functionally PENDING until first tool call succeeds.
5. **ACTIVE**: MCP server is connected, authenticated, AND tools have successfully fired in a Claude session. Verified once, then flag is set to ACTIVE in the spec file.
6. **DEPRECATED**: MCP is no longer used (replaced, sunset, or removed). Spec moved to `routing/mcps/deprecated/` with reason and replacement noted.

Status flips between PENDING, CONFIGURED-NOT-ACTIVE, and ACTIVE do NOT require Evolution Protocol re-approval. They're status updates, not architectural changes.

---

## Spec file shape

Every MCP spec lives at `routing/mcps/[mcp-name].md` and follows this structure:

```markdown
---
mcp-name: [exact-name-claude-uses]
status: PENDING | ACTIVE | DEPRECATED
primary-owner: [subagent name]
secondary-owners: [comma-separated]
proposal-doc: [path to governance/proposals/ entry]
activated-date: [YYYY-MM-DD or "pending"]
---

# [Display Name]

## What this MCP does
[1-2 sentence summary of capability]

## Why DZNR uses it
[The specific gap this MCP fills in DZNR's existing capabilities]

## Triggers
[List of trigger words/phrases that route to this MCP]

## Workflow
[Step-by-step what happens when the MCP is invoked, including input shape and expected output]

## Fallback (when MCP is disconnected)
[What the owning subagent does instead, so the user gets value even without the connection]

## Memory tags
[What gets written to project memory when this MCP is used, for traceability]

## Activation steps
[What user needs to do to flip status from PENDING to ACTIVE]

## Status history
[Changelog of status transitions with dates]
```

Use `routing/mcps/_template.md` as the starting point for new specs.

---

## When subagent prompts reference MCPs

Subagent prompts (Snape, Gibson, Morpheus, etc.) should reference MCPs by pointer, not by embedded detail. The right pattern in a subagent prompt is:

> ### Magic Patterns MCP
>
> See `routing/mcps/magic-patterns.md` for full spec. Status flag: **PENDING**.
>
> Triggers: "Magic Patterns", "generate UI options", "show me design variants" (full list in spec).
>
> When activated, Snape calls Magic Patterns for UI variant exploration during brand and design work. Fallback to manual UI exploration substitute when PENDING.

The pointer plus status flag is enough for the subagent to operate. Full workflow details live in the spec. This keeps subagent prompts focused on subagent logic, not MCP plumbing.

---

## Currently documented MCPs

As of v1.6.0, DZNR has spec files for the following MCPs in `routing/mcps/`:

### Design and UI
- `figma.md`: ACTIVE
- `magic-patterns.md`: CONFIGURED-NOT-ACTIVE (registry connected, session tools not yet surfaced)
- `mobbin.md`: PENDING
- `pencil.md`: ACTIVE
- `adobe.md`: ACTIVE (Snake Eyes)

### Creative tech and 3D
- `blender.md`: ACTIVE (when local Blender app is running)
- `higgsfield.md`: ACTIVE

### Workspace and data
- `figma.md`: ACTIVE (also under Design)
- `slack.md`: ACTIVE
- `google-drive.md`: ACTIVE
- `granola.md`: ACTIVE (meeting transcripts)
- `notion.md`: ACTIVE
- `gmail-and-calendar.md`: ACTIVE

### Specialist
- `gong.md`: ACTIVE
- `pdf-tools.md`: ACTIVE
- `shopify.md`: ACTIVE (when needed)
- `supabase.md`: ACTIVE (when needed)
- `vercel.md`: ACTIVE (when needed)
- `netlify.md`: ACTIVE (when needed)

ACTIVE status assumes the MCP server is connected in the user's current Claude session. Adopters may have different subsets active.

---

## How to add a new MCP

1. **Propose.** Write a proposal in `governance/proposals/YYYY-MM-DD-[mcp-name]-integration.md` covering: capability, gap it fills, owning subagent(s), triggers, expected workflow, fallback behavior, activation cost.

2. **Document.** Once approved, create `routing/mcps/[mcp-name].md` using `_template.md`. Set status to PENDING. Update relevant subagent prompt(s) to reference the spec. Add triggers to `routing/TRIGGERS.md` if new ones are introduced.

3. **Regression test.** Walk relevant stress tests with the new MCP in PENDING state. Confirm fallback behavior works. Confirm subagent prompt references are correct.

4. **Connect.** Install the MCP server in your Claude session (this happens outside DZNR's repo, in your Claude app settings or marketplace). Authenticate as needed. Verify the MCP returns valid responses from a direct tool call.

5. **Activate.** Once verified, edit the spec frontmatter: change `status: PENDING` to `status: ACTIVE`, set `activated-date` to today. Commit the status change as a patch release.

This is the canonical path. Steps 1-3 are Evolution Protocol; steps 4-5 are user actions outside DZNR git.

---

## How to deactivate an MCP

If an MCP is replaced or sunset:

1. Move spec from `routing/mcps/[name].md` to `routing/mcps/deprecated/[name].md`
2. Update frontmatter: `status: DEPRECATED`, add `deprecated-date` and `reason`
3. Update relevant subagent prompts to remove the pointer (or replace with successor MCP if applicable)
4. Add CHANGELOG entry

Deprecated specs stay in the repo for historical reference. They are not deleted.

---

## Status

- ✅ v1.0: Framework documented (this file)
- ✅ v1.0: Template spec created (`routing/mcps/_template.md`)
- ✅ v1.0: Initial MCP specs documented for all currently-known MCPs
- ⏭ Sherlock and Gibson subagent prompts will reference MCPs via this framework when they are built (Phase 3.7+)
- ⏭ Adopter-specific MCPs can be added without changes to DZNR core (just new spec files)
