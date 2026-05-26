---
mcp-name: magic-patterns
status: CONFIGURED-NOT-ACTIVE
primary-owner: snape
secondary-owners: gibson
proposal-doc: governance/proposals/2026-05-18-magic-patterns-integration.md
activated-date: pending
---

# Magic Patterns

## What this MCP does

Magic Patterns is a UI design and iteration tool. The MCP integration exposes three operations to Claude:

- `get_design`: retrieve an existing Magic Patterns design by reference
- `read_files`: read the files associated with a Magic Patterns design
- `update_design`: modify an existing Magic Patterns design

The variant-generation Magic Patterns is best known for happens in their UI; the MCP provides Claude with access to designs and the ability to iterate on them once they exist.

## Why DZNR uses it

DZNR's existing brand-from-scratch and design-systems skills are synthesis tools: they take inputs and produce coherent outputs. They are not exploration tools.

Magic Patterns fills two roles in DZNR:

1. **Iteration partner (primary, via MCP)**: when a user has explored variants in Magic Patterns' UI and selected one, Snape uses the MCP to read the design, understand it in DZNR's design system context, and update it as the brand and design work matures
2. **Exploration anchor (secondary, via Magic Patterns UI)**: when DZNR needs UI variant breadth, Snape suggests the user generate variants in Magic Patterns' UI, then share back the design URL for the MCP to pick up

Secondary use by Gibson: when designing AI-driven web experiences or immersive UI overlays, Magic Patterns designs can become the visual anchor that Gibson translates into Three.js scenes or React Three Fiber components.

## Triggers

Direct invocation:

- "Magic Patterns"
- "magicpatterns"

Capability-based (route to Magic Patterns when MCP is ACTIVE):

- "generate UI options"
- "show me design variants"
- "explore UI directions"
- "iterate on this design"
- "variants of this component"
- "text to UI"
- "generate UI from prompt"
- "give me design options"
- "what are some visual directions for"

## Workflow

When Snape invokes Magic Patterns (once tools are available in session):

1. **Iteration on an existing design**:
   - User provides a Magic Patterns design URL or reference
   - Snape calls `get_design` to retrieve the design
   - Snape calls `read_files` if file-level access is needed
   - Snape applies industry posture from `routing/INDUSTRIES.md` and brand context from project memory to identify refinement direction
   - Snape calls `update_design` with the refinement (token updates, layout adjustments, content changes)
   - Snape verifies the update via a follow-up `get_design` call

2. **New exploration handoff**:
   - User asks for UI variants without an existing design
   - Snape suggests: "Generate variants in Magic Patterns at magicpatterns.com using this prompt: [Snape-constructed prompt with industry context and brand constraints]. Share the design URL back when you've picked one."
   - User returns with a URL; Snape proceeds with iteration workflow above

When Gibson invokes Magic Patterns (lower frequency):

1. Gibson works with Magic Patterns designs that have already been generated and chosen
2. Same prompt-construction guidance but with experiential context (motion expectations, depth, ambient or active states) included in the user's Magic Patterns prompt
3. Gibson passes selected variant to Snape if brand integration is needed, or implements directly if the experience layer is standalone

The MCP does NOT do blank-slate variant generation from Claude. Variant generation happens in Magic Patterns' own UI; the MCP picks up where the user left off.

## Fallback (when MCP is disconnected)

Snape uses a manual UI exploration substitute:

1. Snape generates 2-3 sketched design directions as text descriptions plus high-level token suggestions (color palette, typography pairing, layout shape, motion approach).
2. Each direction gets a 1-2 sentence rationale anchored in industry posture.
3. User picks; Snape executes refinement using the standard design-systems skill flow.

This preserves the exploration intent at lower bandwidth. The fallback is acceptable for most brand and design work; the MCP becomes valuable when 4-8 variant breadth is genuinely needed (boundary-pushing aesthetic exploration, first-pass design system direction, design audit reference work).

## Memory tags

When Magic Patterns is used on a project, write to project memory:

- **Variant prompt**: the constructed prompt used (so the project's exploration can be reproduced or refined)
- **Variant selection**: which variant the user picked and brief reason (anchors future design direction)
- **Discarded directions**: variants the user explicitly rejected (so Snape doesn't re-propose them later)

Example memory entry:
> Magic Patterns variant exploration, 2026-05-26. Prompt: hospitality brand homepage hero, luxury industry posture, warm-charcoal palette, serif typography emphasis. Variant 3 selected (asymmetric grid with single hero image at 65vh, restrained motion). Discarded: variant 1 (too retail-conversion-feel), variant 5 (typography too contemporary, drifted from brand inheritance).

## Activation steps

Current state (verified 2026-05-26):

- Registry status: connected, enabled in chat
- Session tool availability: NOT currently loaded in this session
- MCP URL: https://mcp.magicpatterns.com/mcp
- Tools exposed by MCP: get_design, read_files, update_design

To get the tools loaded in a session:

1. Confirm Magic Patterns shows as connected in your Claude app's connector settings (already true as of 2026-05-26)
2. Tools may load on-demand when a Magic Patterns design URL is shared in conversation. Try sharing a design URL to test.
3. If tools still do not surface, check the Claude session's deferred tools list or restart the session
4. Once a Magic Patterns tool returns a valid response from a direct call, flip frontmatter `status` to `ACTIVE` and set `activated-date` to that day

Why not ACTIVE yet:

The registry confirms the connection but the tools are not surfaced in this session. This may be because Magic Patterns MCP loads tools only when there is an active design context (URL shared in conversation, or open project). Without a project to point at, the tools stay dormant. This is consistent with the tool shapes (`get_design`, `read_files`, `update_design` all operate on existing designs).

This is **CONFIGURED-NOT-ACTIVE**: connected at the registry layer, not yet exercising tools in DZNR. Status flips to ACTIVE when a real Magic Patterns design is brought into a session and the MCP tools fire successfully.

## Status history

- 2026-05-18: PROPOSED (proposal doc filed)
- 2026-05-18: DOCUMENTED (initial integration in TRIGGERS.md and Snape's prompt)
- 2026-05-26: PENDING (spec formalized in routing/mcps/ framework as part of Phase 3.6.5)
- 2026-05-26: CONFIGURED-NOT-ACTIVE (registry connection verified, session tool surfacing pending first real use)
