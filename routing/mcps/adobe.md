---
mcp-name: adobe-for-creativity
status: ACTIVE
primary-owner: snake-eyes
secondary-owners: snape, morpheus
proposal-doc: n/a (foundational integration)
activated-date: 2026-05-26
---

# Adobe Creative Cloud

## What this MCP does

Adobe MCP wraps Adobe's creative tools (Express, Firefly, Lightroom, Photoshop-style image operations, document tools, asset library). Provides templated design, batch photo editing, social media resizing, photo retouching, video quick-cuts, image generation, and asset management.

## Server name

`mcp-name` is `adobe-for-creativity`, the server's own name as DZNR OS reads it. The claude.ai connector is "Adobe for creativity", which DZNR OS reads as `adobe-for-creativity` (prefix dropped, spaces to hyphens), and on 2026-10-06 both machines' daemons saw it under that name. Under `adobe` DZNR OS matched nothing and showed Adobe as having nothing to check, on both machines, for good.

One form still does not match: the `adobe-for-creativity` plugin declares its server as "Adobe for creativity", with spaces, and DZNR OS reads a plugin server by its own name, so that one stays unspecified. One spec carries one name, and the hyphenated one is the connector the Mac's `claude mcp list` shows Connected (the plugin's server there needs authentication). `google-calendar` in `workspace-and-data.md` has the same caveat. So the activation steps below connect the claude.ai connector, not the plugin.

The file keeps the name `adobe.md`. `routing/MCPS.md` puts a spec at `routing/mcps/[mcp-name].md`, and every other individual spec follows it; this one does not, because the docs and agent prompts call it Adobe. `scripts/validate-routing.sh` looks for a spec's file name as well as its mcp-name when it checks that no ACTIVE connector is still called pending, so under `adobe-for-creativity.md` that check would look only for strings the docs never use. The validator fails an individual spec whose file name is not its mcp-name unless the spec has this section.

## Why DZNR uses it

Adobe is a specialist toolkit. Routed through Snake Eyes (explicit invocation by name) primarily because the tools are coherent and specialized rather than general-purpose. Snape may reach into Adobe for specific brand-visual tasks; Morpheus may reach for social variations in campaign work.

## Triggers

Direct invocation only (Snake Eyes pattern):

- "Adobe Express"
- "Firefly"
- "Lightroom"
- "use adobe-design-from-template"
- "batch edit photos"
- "social media variations"
- "retouch portraits"
- "quick cut" (video)
- "resize photos and videos"

Capability-based (when Snake Eyes is invoked):

- "make a flyer"
- "design a poster"
- "create social media post"
- "Instagram story"
- "business card"
- "brochure"

## Workflow

Snake Eyes invocation:

1. User names the Adobe skill explicitly (e.g. "use adobe-design-from-template")
2. Snake Eyes deploys with the relevant adobe-* skill
3. adobe_mandatory_init runs first on initial invocation
4. Selected skill executes (template-based design, batch edit, etc.)
5. Output delivered as Firefly Board, downloadable URLs, or in-chat preview

Snape invocation (specific brand-visual tasks):

1. Snape identifies need for Adobe-specific tool (e.g. brand-consistent photo retouching across a portrait set)
2. Calls the relevant adobe-* skill via Snake Eyes pattern
3. Integrates output into brand or design system work

## Fallback (when MCP is disconnected)

- Snake Eyes describes the design intent in text
- Snape suggests substitute via canvas-design, svg-generative, or theme-factory skills for static design needs
- Morpheus handles social variations via manual export workflow

## Memory tags

- Adobe assets generated per project (Firefly Board URLs, exported file paths)
- Template choices and customizations

## Activation steps

ACTIVE in this session. For other users:

1. Sign in to Adobe account
2. Connect the claude.ai connector "Adobe for creativity" (claude.ai Settings, Connectors). `claude mcp list` then shows `claude.ai Adobe for creativity` as Connected, which DZNR OS reads as `adobe-for-creativity`
3. Verify by running adobe_mandatory_init

Authenticating only the plugin (the plugin_adobe-for-creativity_Adobe_for_creativity authenticate flow) is not enough for DZNR OS. That server is `plugin:adobe-for-creativity:Adobe for creativity`, which DZNR OS reads as "adobe for creativity", with spaces; it matches no spec, so Adobe still shows as not configured.

## Status history

- 2026-05-26: ACTIVE (verified in current session; spec formalized during Phase 3.6.5)
- 2026-10-06: `mcp-name` changed from `adobe` to `adobe-for-creativity`, the name both machines' DZNR OS daemons saw; under `adobe` nothing ever matched.
- 2026-10-06: activation steps connect the claude.ai connector, the server DZNR OS matches, rather than the plugin's; the file keeps the name `adobe.md` (see Server name).
