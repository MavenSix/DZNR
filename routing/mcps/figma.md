---
mcp-name: figma
status: ACTIVE
primary-owner: snape
secondary-owners: neo
proposal-doc: n/a (foundational integration)
activated-date: 2026-05-26
---

# Figma

## What this MCP does

Figma MCP exposes Figma design files to Claude. Read design context, fetch screenshots, retrieve variables and design tokens, manipulate files via the Plugin API, generate diagrams in FigJam, build component libraries, and map Figma components to code via Code Connect.

## Why DZNR uses it

Figma is foundational to DZNR's design system, brand identity, and design-to-code workflows. Snape owns the design side (libraries, variables, design language); Neo owns the code-connect side (Figma component to code mapping). Both use the MCP heavily.

## Triggers

Direct invocation:

- "Figma"
- "Figma file"
- "open in Figma"

Capability-based:

- "build component library"
- "design system in Figma"
- "Figma variables"
- "design tokens from Figma"
- "Figma Dev Mode"
- "diagram in FigJam"
- "FigJam board"
- "Code Connect"

## Workflow

Snape invocation (design system work):

1. Identify the Figma file or context
2. Call get_design_context, get_metadata, get_variable_defs as needed for inspection
3. Use figma-use, figma-generate-library, figma-generate-design skills for write operations
4. Apply changes via use_figma (always load figma-use skill first per its requirements)
5. Verify with screenshots and metadata refresh

Neo invocation (code connect):

1. Identify the Figma component to map
2. Use add_code_connect_map and get_code_connect_suggestions to define the mapping
3. Generate code-connect template files (.figma.ts or .figma.js)
4. Validate with get_code_connect_map

## Fallback (when MCP is disconnected)

- Snape works from screenshots and exported assets
- Neo works from Figma's web UI and manual code-connect file authoring

## Memory tags

- Figma file IDs and URLs per project
- Design system library versions
- Code Connect mappings established

## Activation steps

ACTIVE in this session. For other users:

1. Install the Figma MCP server (first-party from Figma)
2. Authenticate via Figma personal access token
3. Pair the plugin with desktop Figma app (per figma-use skill instructions)
4. Verify by calling figma_get_status

## Status history

- 2026-05-26: ACTIVE (verified in current session; spec formalized during Phase 3.6.5)
