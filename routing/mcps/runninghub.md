---
mcp-name: runninghub
status: ACTIVE
primary-owner: gibson
secondary-owners: cheetara, morpheus, snake-eyes
proposal-doc: n/a (added directly in v2.5.0 after DZNR OS Build Plan v1.5 review, 2026-09-04)
activated-date: 2026-10-23
---

# RunningHub

## What this MCP does

RunningHub (https://www.runninghub.ai) is a cloud ComfyUI platform with a REST API. DZNR OS reaches it through its native `runninghub` driver with Kevin's key, which runs saved workflows and community AI Apps: Topaz upscalers, Seedance, Kling, Wan and others where an app or workflow offers them, plus Hunyuan3D and other ComfyUI graphs. Workflows run on GPU instances at 24GB (default) or 48GB (`plus`).

There is no official RunningHub MCP server or SDK as of 2026-09-04. The HM-RunningHub GitHub org (36 repos) ships a Python CLI (`RH_CLI`), an agent skill in SKILL.md format (`OpenClaw_RH_Skills`) and ComfyUI node packs. DZNR does not use a third-party MCP wrapper: the DZNR OS driver is the route, and DZNR subagents reach it through the DZNR OS router.

## Why DZNR uses it

Three gaps it closes:

1. **Upscale before motion.** Topaz upscalers in a saved workflow or AI App give Step 10 of `legendary-standard` a delivery-resolution plate before any clip is made, alongside Higgsfield's upscale tools.
2. **Video execution.** The `seedance-director`, `seedance-shotlist-director` and `wan-video-prompts` briefs run on Seedance, Kling or Wan wherever a saved workflow or AI App offers that model, and Higgsfield remains the other Seedance route.
3. **Cloud ComfyUI.** Cheetara's optional Local ComfyUI row (Hunyuan3D mini, TRELLIS on the 8 GB RTX 3070 Ti PC) has a cloud twin. Any saved workflow runs on a 24GB or 48GB instance when the PC is offline.

Sref-locked Midjourney work stays on Kevin's own Midjourney account (the sref library and his profile live there; see `routing/mcps/browser-profile.md` and `skills/workshop/midjourney-legendary/`). RunningHub never carries an sref lock. Midjourney runs through RunningHub only where a saved workflow or AI App offers it, and only for unlocked prompts.

Role decided with Kevin on 2026-09-04 and confirmed 2026-10-23 ("RunningHub is good"): **workflows and AI Apps plus cloud ComfyUI.** Direct accounts (Higgsfield Soul Characters, Kevin's own Midjourney for sref, ElevenLabs project voices) stay primary for hero quality. RunningHub is the lane for upscaling, for video and image models that a workflow or app offers, and the ComfyUI runner when the PC is unavailable.

## Triggers

Direct invocation:

- "RunningHub"
- "run this on RunningHub"
- "RunningHub workflow", "RunningHub app"

Capability-based (route here when a saved workflow or AI App offers the model, or when the primary tool is unavailable):

- "Topaz", "upscale this before we animate it"
- "Seedance" (any version) when executing, not just prompting
- "Kling", "Wan" when Kevin has no direct key for that model and an app or workflow offers it
- "run the ComfyUI workflow", "cloud ComfyUI", "PC is off, run it in the cloud"
- "AI app for [product shot, sticker pack, poster template]"
- Any image, video or 3D request where the primary driver has failed and the router is walking the fallback chain

Anti-triggers:

- Anything flagged confidential or under client NDA (unreleased products, unannounced talent). RunningHub is a Chinese company using Tencent COS storage; route confidential work to direct accounts or local.
- Photorealistic imagery of real, identifiable people. RunningHub blocks this (error 1505) and DZNR should not attempt it there.
- Sref-locked Midjourney renders, QKI or otherwise. Those stay on Kevin's own Midjourney account.

## Workflow

Gibson invocation (experiential image and video):

1. Gibson identifies the asset need and the quality tier (draft, standard, hero)
2. Checks whether a direct-account tool covers it (Higgsfield for character-locked video, Kevin's Midjourney for sref)
3. If not, or if the direct tool is down, picks the saved workflow or AI App for the matching model family and fills its fields from the brief
4. Polls for completion (5-second interval; statuses QUEUED, RUNNING, SUCCESS, FAILED)
5. Reviews output, iterates, writes the asset and its cost to project memory

Cheetara invocation (upscale before motion; cloud mesh iteration; non-sref variations):

1. Cheetara runs the Prime Gate or the Fidelity Gate as always; RunningHub does not change QKI law or an author's pack
2. Upscales an approved plate with a Topaz workflow or app before it is animated
3. For mesh iteration when the PC is offline, runs the saved Hunyuan3D workflow with `instanceType: plus`
4. Writes outputs to the asset manifest with `source: runninghub` so provenance is traceable

Morpheus invocation (pitch and campaign video):

1. Morpheus has a Seedance shotlist from `seedance-shotlist-director`
2. Executes each shot through the Seedance workflow or AI App
3. Confirms cost before any batch over five shots
4. Assembles the reel; cites RunningHub as the render source in the deck's attribution block

Snake Eyes invocation (community AI Apps by name):

1. User names an AI App or a template class ("product shot app", "blind box design")
2. Snake Eyes discovers the app's input fields via the API demo endpoint
3. Fills fields from the brief and runs the app
4. Returns results with cost; does not chain further without instruction

## Fallback (when the driver is unavailable)

- **Gibson:** describes the asset direction in text; suggests Kevin run it in RunningHub's web UI or on the PC's local ComfyUI
- **Cheetara:** upscales with Higgsfield's upscale tools instead; mesh iteration deferred to local ComfyUI or Weavy
- **Morpheus:** hands the Seedance shotlist to Higgsfield, or to Kevin as a ready-to-paste document for RunningHub's web UI
- **Snake Eyes:** reports the app ID and field list so Kevin can run it manually

RunningHub is itself a fallback for some direct-account tools, so a RunningHub outage on top of a primary outage means the task queues rather than degrades further. DZNR should say so plainly.

## Memory tags

- **workflowId or webappId:** for saved workflows and apps, so the next project can reuse them
- **Model behind the app or workflow:** `runninghub:<app-or-workflow>/<model>` so re-runs hit the same model
- **Cost per asset:** `consumeCoins` and `consumeMoney` (CNY) with the USD conversion applied
- **Confidential exclusions:** any project where RunningHub was excluded by policy, so the exclusion persists

## Activation

Done. DZNR OS holds Kevin's key (never in a spec or memory file) and its native `runninghub` driver uses it. DZNR subagents reach it through the DZNR OS router.

## Status history

- 2026-09-04: PENDING (spec created in v2.5.0 after the DZNR OS Build Plan v1.5 review established RunningHub's role as aggregator fallback plus cloud ComfyUI)
- 2026-10-23: ACTIVE via the DZNR OS `runninghub` driver with Kevin's key: saved workflows and community AI Apps (Kevin: "RunningHub is good")
