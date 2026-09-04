---
mcp-name: runninghub
status: PENDING
primary-owner: gibson
secondary-owners: cheetara, morpheus, snake-eyes
proposal-doc: n/a (added directly in v2.5.0 after DZNR OS Build Plan v1.5 review, 2026-09-04)
activated-date: pending
---

# RunningHub

## What this MCP does

RunningHub (https://www.runninghub.ai) is a cloud ComfyUI platform with a REST API that fronts roughly 420 generative model endpoints behind one key: Seedance 2.0 and 2.5, Kling 3.0, Wan 3.0, Veo 3.1, Sora-2, Midjourney v7 and v8, Flux, Seedream, Nano Banana, Qwen-Image, Suno, MiniMax speech, Hunyuan3D v3.1, Meshy6, Hitem3D, Topaz upscalers, and more. Three API surfaces: run a saved ComfyUI workflow by ID with node-field overrides, run a published community AI App by ID, or call a standard model endpoint directly. GPU instances at 24GB (default) or 48GB (`plus`).

There is no official RunningHub MCP server or SDK as of 2026-09-04. The HM-RunningHub GitHub org (36 repos) ships a Python CLI (`RH_CLI`), an agent skill in SKILL.md format (`OpenClaw_RH_Skills`), and ComfyUI node packs. Third-party MCP wrappers exist (`tolatolatop/runninghub-mcp`, `difyz9/runninghub-crew`) with very low adoption. DZNR treats RunningHub as an API-backed capability, reachable either through a third-party MCP (PENDING until verified) or, once DZNR OS ships, through its native `runninghub.ts` driver.

## Why DZNR uses it

Three gaps it closes:

1. **Midjourney via API.** Midjourney has no public API. Cheetara's QKI pipeline and Gibson's hero-image work currently rely on a human-in-the-loop web step. RunningHub exposes Midjourney v7 and v8 as callable endpoints, which makes unattended hero-image generation possible for the first time. Sref-locked QKI work stays on Kevin's own Midjourney account (the sref library lives there); RunningHub covers everything else.
2. **Seedance via API.** The `seedance-director` and `seedance-shotlist-director` skills produce Seedance 2.0 prompts, but Seedance has no direct public API. RunningHub is the execution path for those prompts.
3. **Cloud ComfyUI.** Cheetara's optional Local ComfyUI row (Hunyuan3D, TRELLIS on the RTX 3090 box) has a cloud twin. Any saved workflow runs on a 24GB or 48GB instance when the PC is offline.

Role decided with Kevin on 2026-09-04: **aggregator fallback plus cloud ComfyUI.** Direct accounts (Higgsfield Soul Characters, Kevin's own Midjourney for sref, ElevenLabs project voices) stay primary for hero quality. RunningHub is the fallback lane for every image, video, 3D, and music task, the primary for Midjourney-via-API without sref, and the ComfyUI runner when the PC is unavailable.

## Triggers

Direct invocation:

- "RunningHub"
- "run this on RunningHub"
- "RunningHub workflow", "RunningHub app"

Capability-based (route here when the primary tool is unavailable or when the request names one of these models with no direct account):

- "Seedance" (any version) when executing, not just prompting
- "Kling", "Wan", "Sora-2", "Veo" when Kevin has no direct key for that model
- "Midjourney via API", "batch Midjourney", "unattended hero images"
- "run the ComfyUI workflow", "cloud ComfyUI", "PC is off, run it in the cloud"
- "AI app for [product shot, sticker pack, poster template]"
- Any image, video, 3D, or music request where the primary driver has failed and the router is walking the fallback chain

Anti-triggers:

- Anything flagged confidential or under client NDA (unreleased products, unannounced talent). RunningHub is a Chinese company using Tencent COS storage; route confidential work to direct accounts or local.
- Photorealistic imagery of real, identifiable people. RunningHub blocks this (error 1505) and DZNR should not attempt it there.
- Sref-locked QKI hero renders. Those stay on Kevin's own Midjourney account.

## Workflow

Gibson invocation (experiential image and video):

1. Gibson identifies the asset need and the quality tier (draft, standard, hero)
2. Checks whether a direct-account tool covers it (Higgsfield for character-locked video, Kevin's Midjourney for sref)
3. If not, or if the direct tool is down, constructs the prompt and calls RunningHub's standard model endpoint for the matching model family
4. Polls for completion (5-second interval; statuses QUEUED, RUNNING, SUCCESS, FAILED)
5. Reviews output, iterates, writes the asset and its cost to project memory

Cheetara invocation (QKI assets without sref lock; cloud mesh iteration):

1. Cheetara runs the Prime Gate as always; RunningHub does not change QKI law
2. For non-sref hero renders (variations, secondary characters, background plates), calls Midjourney v7 via RunningHub with the QKI injection block
3. For mesh iteration when the PC is offline, runs the saved Hunyuan3D workflow on RunningHub with `instanceType: plus`
4. Writes outputs to the asset manifest with `source: runninghub` so provenance is traceable

Morpheus invocation (pitch and campaign video):

1. Morpheus has a Seedance shotlist from `seedance-shotlist-director`
2. Executes each shot through RunningHub's Seedance 2.5 endpoint
3. Confirms cost before any batch over five shots
4. Assembles the reel; cites RunningHub as the render source in the deck's attribution block

Snake Eyes invocation (community AI Apps by name):

1. User names an AI App or a template class ("product shot app", "blind box design")
2. Snake Eyes discovers the app's input fields via the API demo endpoint
3. Fills fields from the brief and runs the app
4. Returns results with cost; does not chain further without instruction

## Fallback (when MCP is disconnected)

- **Gibson:** describes the asset direction in text; suggests Kevin run it in RunningHub's web UI (Quick Create or rhTV canvas) or on the PC's local ComfyUI
- **Cheetara:** reverts to the human-in-the-loop Midjourney path already documented in her MCP Coordination table; mesh iteration deferred to local ComfyUI or Weavy
- **Morpheus:** hands the Seedance shotlist to Kevin as a ready-to-paste document for RunningHub's web UI
- **Snake Eyes:** reports the app ID and field list so Kevin can run it manually

RunningHub itself is the fallback for direct-account tools, so a RunningHub outage on top of a primary outage means the task queues rather than degrades further. DZNR should say so plainly.

## Memory tags

- **Model and endpoint used:** `runninghub:<vendor>/<model>/<task>` so re-runs hit the same model
- **workflowId or webappId:** for saved workflows and apps, so the next project can reuse them
- **Cost per asset:** `consumeCoins` and `consumeMoney` (CNY) with the USD conversion applied
- **Confidential exclusions:** any project where RunningHub was excluded by policy, so the exclusion persists

## Activation steps

1. Create a RunningHub account and purchase an **Enterprise-Shared** API key (pay-as-you-go). Consumer-Member keys only unlock the Workflow and AI App APIs; the standard model endpoints return error 1014 on a consumer key.
2. Store the key as `RUNNINGHUB_API_KEY` in the environment; never in a spec or memory file.
3. Path A (before DZNR OS): install a third-party MCP wrapper (`tolatolatop/runninghub-mcp` or equivalent), configure it with the key, verify one image call and one poll succeed. Flip status to CONFIGURED-NOT-ACTIVE, then ACTIVE after first successful call in a DZNR session.
4. Path B (after DZNR OS Phase 1 ships): the native `packages/drivers/runninghub.ts` driver is the integration; DZNR subagents reach it through the DZNR OS router. Flip status to ACTIVE and note "via DZNR OS driver" in the status history.
5. Test: one Midjourney v7 image, one Seedance 2.5 five-second clip, one saved-workflow run. Record `taskCostTime` and cost for each in memory as the baseline.

## Status history

- 2026-09-04: PENDING (spec created in v2.5.0 after the DZNR OS Build Plan v1.5 review established RunningHub's role as aggregator fallback plus cloud ComfyUI)
