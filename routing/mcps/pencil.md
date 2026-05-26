---
mcp-name: pencil
status: ACTIVE
primary-owner: snape
secondary-owners: neo
proposal-doc: n/a (foundational integration)
activated-date: 2026-05-26
---

# Pencil

## What this MCP does

Pencil MCP is the editor for .pen design files (encrypted web and mobile app design files). Provides read, generate, snapshot, validate operations across design documents. The .pen file format is closed; Claude only accesses it via this MCP.

## Why DZNR uses it

Pencil is the alternative design tool DZNR supports beyond Figma. Some clients use Pencil; some projects need the .pen format. Snape orchestrates design work through Pencil when the file format demands it. Neo uses Pencil's export capabilities when generating code from .pen files.

## Triggers

Direct invocation:

- "Pencil"
- ".pen file"
- "open in Pencil"
- "Pencil.dev"

Capability-based (when relevant):

- "design system in Pencil"
- "generate from Pencil file"
- "export Pencil nodes"

## Workflow

Snape invocation (design work):

1. open_document on the .pen file
2. get_editor_state and get_guidelines to understand current scope
3. batch_design or batch_get for read operations
4. snapshot_layout for current state capture
5. set_variables and replace_all_matching_properties for systematic edits
6. find_empty_space_on_canvas for placing new content

Neo invocation (code export):

1. open_document on the .pen file
2. export_nodes to extract design elements
3. Use exported assets in code generation

Important rule from Pencil MCP instructions: .pen files are encrypted. Never use Read or Grep on .pen files directly; only via Pencil MCP tools.

## Fallback (when MCP is disconnected)

- .pen files cannot be accessed without Pencil MCP
- Snape suggests user export to a different format (PNG, SVG, code) from Pencil app manually
- Or suggests migrating the project to Figma if .pen format is not a hard requirement

## Memory tags

- .pen file paths used per project
- Pencil-specific design decisions (variables set, components defined)

## Activation steps

ACTIVE in this session. For other users:

1. Install Pencil app on the user's machine
2. Install Pencil MCP server
3. Verify MCP tools are available in Claude session

## Status history

- 2026-05-26: ACTIVE (verified in current session; spec formalized during Phase 3.6.5)
