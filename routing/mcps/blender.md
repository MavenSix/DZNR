---
mcp-name: blender
status: ACTIVE
primary-owner: gibson
secondary-owners: none
proposal-doc: n/a (pre-framework integration)
activated-date: 2026-05-26
---

# Blender

## What this MCP does

Blender MCP exposes the Blender 3D creation app to Claude via Python scripting. Claude can create scenes, lighting, materials, and renders directly in a running Blender instance using bpy (Blender's Python API).

## Why DZNR uses it

Gibson's 3D experience design work benefits from direct Blender control during concept development. The Blender MCP enables:

- Scene setup and composition from a text brief
- Lighting and material iteration without manual UI navigation
- Quick renders for concept validation and pitch visuals
- Programmatic scene exploration for procedural or generative work

This complements Three.js (for web-deliverable 3D) and Meshy / Tripo3D (for AI-generated 3D assets). Blender is where pre-production happens; the other tools deploy the output.

## Triggers

Direct invocation:

- "Blender"
- "render in Blender"
- "Blender scene"

Capability-based (when ACTIVE):

- "create a 3D scene"
- "render this concept"
- "3D pre-production"
- "set up lighting for"
- "build a 3D environment"

## Workflow

Gibson invocation:

1. Gibson identifies the 3D need (scene composition, lighting study, material exploration, render for pitch)
2. Inspects current scene state via get_blendfile_summary tools before making changes (per Blender MCP instructions: never assume missing values, inspect the scene first)
3. Executes Python via execute_blender_code for scene operations, OR uses dedicated tools (screenshot, render) for inspection and output
4. Reviews render output, iterates if needed
5. Hands final renders to downstream subagent (Snape for brand application, Morpheus for pitch embedding, Neo for web-deliverable conversion)

Notes for Gibson when using Blender MCP:
- Respect existing structure and naming conventions in the .blend file
- Use bpy.ops for standard operations (primitives, modifiers, origin setting)
- Use bpy.data for precise control and avoiding side effects
- Verify or set the active object and selection before operator calls; operators change selection as a side effect
- Update the dependency graph after changes before reading computed properties
- In edit mode, access mesh geometry through the bmesh API, flush bmesh changes back to the mesh
- Reference docs are bundled with the MCP server in data/api (bpy API) and data/manual (Blender user manual). Grep these directly when needed.

## Fallback (when MCP is disconnected)

If Blender app is not running or MCP is unavailable:

1. Gibson describes the 3D direction in text (composition, lighting setup, material choices)
2. Suggests user open Blender manually to execute, OR routes to Three.js / WebGL implementation if the deliverable is web-based
3. If renders are needed for pitch, suggests AI image generation as substitute (imagegen-frontend-web Gandalf skill)

## Memory tags

- Blender file paths: which .blend files were used on this project (for reproducibility)
- Render outputs: paths to rendered images or sequences
- Scene decisions: lighting setup, material palette, camera framing choices for project continuity

## Activation steps

For Blender MCP to be ACTIVE:

1. Install Blender app on the user's machine (if not already)
2. Install the Blender MCP add-on (this is a Blender add-on, not just an MCP server; check Blender MCP project docs)
3. Enable the add-on in Blender's preferences
4. Start Blender; the MCP server runs inside the Blender app
5. Verify MCP tools appear in Claude session (look for Blender tools in the tool list)
6. Status is already ACTIVE in this DZNR session as of 2026-05-26

## Status history

- 2026-05-26: ACTIVE (MCP verified available in current Claude session; spec formalized during Phase 3.6.5)
