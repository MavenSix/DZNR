---
mcp-name: higgsfield
status: PENDING
primary-owner: gibson
secondary-owners: morpheus, snape
proposal-doc: n/a (added to framework on 2026-05-26)
activated-date: pending
---

# Higgsfield

## What this MCP does

Higgsfield is an AI video generation platform. Given text prompts, reference images, or motion guidance, it produces short-form AI-generated video clips suitable for hero reels, social content, and experiential video layers.

## Why DZNR uses it

Generative video is a near-future capability that several DZNR subagents could leverage:

- **Gibson** for experiential video layers in immersive installations, AI product hero reels, and narrative-driven experience content
- **Morpheus** for pitch deck B-roll, campaign sizzle reels, and case study video
- **Snape** for brand video content when brand identity work extends to motion

Without Higgsfield (or equivalent), generative video falls outside DZNR's tooling and the user has to handle it manually in external tools.

## Triggers

Direct invocation:

- "Higgsfield"
- "Higgsfield video"
- "generate AI video"

Capability-based (when ACTIVE):

- "create a sizzle reel"
- "AI video hero"
- "generative B-roll"
- "short video for"
- "motion video from this brief"

## Workflow

Gibson invocation (experiential video):

1. Gibson identifies the video need within an experience design (hero loop, ambient narrative, transition sequence)
2. Constructs prompt with experiential context (mood, motion characteristics, world-building anchors)
3. Calls Higgsfield with prompt plus reference imagery if available
4. Reviews output for fit; iterates with refined prompts if needed
5. Integrates video into experience build or hands to Neo for production embedding

Morpheus invocation (pitch and campaign video):

1. Morpheus identifies video need in deck or campaign (opener reel, B-roll, case study highlight)
2. Constructs prompt with brand voice and narrative arc context
3. Calls Higgsfield; selects best variant
4. Embeds in deck (via pptx) or campaign asset

Snape invocation (brand video):

1. Snape identifies brand video need (brand reel, identity motion, value proposition video)
2. Constructs prompt anchored in industry posture and brand guidelines
3. Calls Higgsfield; applies taste filter to outputs
4. Refines selection with brand-system motion principles

## Fallback (when MCP is disconnected)

Substitute paths depending on subagent:

- **Gibson**: describes the video direction in text, suggests user use Higgsfield's web UI directly, or proposes Three.js / WebGL animation as alternative for experiences that don't require photorealism
- **Morpheus**: suggests stock footage or describes video brief for user to commission separately
- **Snape**: describes brand motion direction in text plus storyboard frames

## Memory tags

- **Video prompts used**: for traceability and refinement across iterations
- **Selected outputs**: which clips were used and where they were embedded

## Activation steps

1. Sign up for Higgsfield account
2. Check whether Higgsfield offers an MCP integration; if not, check API access and whether community has built an MCP wrapper
3. Install MCP server when available
4. Authenticate via API key or OAuth
5. Test with a short prompt
6. Flip frontmatter status to ACTIVE

## Status history

- 2026-05-26: PENDING (spec created during Phase 3.6.5 framework build)
