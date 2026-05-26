---
mcp-name: mobbin
status: PENDING
primary-owner: sherlock
secondary-owners: snape
proposal-doc: n/a (added to framework on 2026-05-26)
activated-date: pending
---

# Mobbin

## What this MCP does

Mobbin is a curated library of real-world mobile and web design patterns sourced from production apps. It indexes screens, flows, and components by category, industry, and pattern type, providing visual reference for design research.

## Why DZNR uses it

DZNR's discovery and design work both benefit from "what do high-quality reference apps do for this pattern?" Mobbin is the canonical answer source. Sherlock uses it during competitive and pattern research. Snape uses it as inspiration anchor when designing new patterns or evolving existing ones.

Without Mobbin, Sherlock's pattern research relies on manual screenshot collection and Snape's pattern reference comes from memory or ad-hoc Googling. Both are slower and less comprehensive.

## Triggers

Direct invocation:

- "Mobbin"
- "check Mobbin"
- "Mobbin reference"

Capability-based (when ACTIVE):

- "find reference patterns for"
- "how do other apps do"
- "real-world examples of"
- "pattern research"
- "industry-typical patterns for"
- "what are best-in-class patterns for"

## Workflow

Sherlock invocation (research):

1. Sherlock reads industry tag and current research focus
2. Constructs query with pattern type (onboarding, checkout, search, settings, etc.) + industry filter
3. Calls Mobbin to retrieve reference set
4. Synthesizes findings: common patterns, divergent patterns, what each app does differently
5. Outputs to research artifact as a pattern reference section

Snape invocation (design reference):

1. Snape identifies pattern being designed (component, flow, layout)
2. Calls Mobbin for industry-tagged or category-tagged references
3. Reviews 5-10 examples for inspiration anchors
4. Applies Snape's taste filter: which references align with project's industry posture
5. Uses 2-3 selected references to inform new design direction, NOT as direct copies

## Fallback (when MCP is disconnected)

Manual reference research:

1. Sherlock or Snape names 3-5 best-in-class apps known to do this pattern well
2. Suggests user open Mobbin's website manually to gather references
3. Proceeds with design work using general knowledge of pattern conventions

Lower bandwidth than direct MCP access but preserves intent.

## Memory tags

When Mobbin is referenced on a project:

- **Reference patterns used**: which patterns inspired which design decisions
- **Industry-specific anchors**: best-in-class apps in the project's industry that informed direction

## Activation steps

1. Check Mobbin's website or Claude marketplace for their MCP integration. Mobbin may offer a developer API; the MCP wrapper may be community-built or first-party.
2. Install MCP server in Claude session.
3. Authenticate (likely requires a Mobbin subscription account).
4. Test with a category query.
5. Flip frontmatter status to ACTIVE.

## Status history

- 2026-05-26: PENDING (spec created during Phase 3.6.5 framework build)
