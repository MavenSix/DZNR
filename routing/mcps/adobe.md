---
mcp-name: adobe
status: ACTIVE
primary-owner: snake-eyes
secondary-owners: snape, morpheus
proposal-doc: n/a (foundational integration)
activated-date: 2026-05-26
---

# Adobe Creative Cloud

## What this MCP does

Adobe MCP wraps Adobe's creative tools (Express, Firefly, Lightroom, Photoshop-style image operations, document tools, asset library). Provides templated design, batch photo editing, social media resizing, photo retouching, video quick-cuts, image generation, and asset management.

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
2. Authenticate via the plugin_adobe-for-creativity_Adobe_for_creativity authenticate flow
3. Verify by running adobe_mandatory_init

## Status history

- 2026-05-26: ACTIVE (verified in current session; spec formalized during Phase 3.6.5)
