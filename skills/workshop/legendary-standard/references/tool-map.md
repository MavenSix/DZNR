# Tool map: which DZNR tool serves which step

Only tools DZNR specs (`routing/mcps/*.md`, `routing/mcps/plugin-connectors.md`, `routing/MCPS.md`) or
that DZNR OS has drivers for. Statuses are as the specs state them on 2026-10-23; read the spec before a
paid run, since a status can change without this file changing.

| Tool | DZNR route | Status | Steps it serves | What it is for here | Fallback |
|---|---|---|---|---|---|
| Midjourney, Kevin's own account | `browser-profile` (`routing/mcps/browser-profile.md`); DZNR OS driver `midjourney-sref` | PENDING; interactive sessions only, never the daemon | 4, 5 | The hero look with `--sref` and `--sw`; character consistency with `--cref` (v6) or `--oref` (v7); `--niji 6` for anime and cel work | Flux with a trained style; Midjourney via RunningHub without sref |
| RunningHub (saved workflows and community AI Apps) | `runninghub` spec; DZNR OS `runninghub` driver with Kevin's key | ACTIVE | 4, 5, 8, 10 | Topaz upscalers, Seedance, Kling, Wan and others where an app or workflow offers them; unlocked variations (Midjourney only where an app or workflow offers it, never sref work, which stays on Kevin's own account) | Higgsfield, Nano Banana, Flux |
| Flux (trained style) | DZNR OS `flux` driver and `fal-training` | driver present | 2, 4, 5 | A style trained on Kevin's own work reaches further than an sref (browser-profile spec); where QKI work runs today | Midjourney |
| Nano Banana | DZNR OS `nano-banana` driver (Gemini image) | driver present; needs a paid-tier key | 4, 5, 7 | Image-to-image edits from the locked hero: new angle, ratio, beat, colourway, an in-situ composite, a storyboard sheet | Higgsfield image edits |
| Higgsfield | `routing/mcps/higgsfield.md`; DZNR OS `higgsfield` driver | ACTIVE | 4, 5, 7, 8, 10 | Soul Character and reference elements for identity lock; image and video generation (default video model Seedance 2.5); `upscale_image` and `upscale_video` for Step 10 | RunningHub |
| Wan 3.0 via Runway | DZNR OS `runway` driver (`wan3`) | driver present | 8 | Image-to-video motion beats with native sound; grammar in `wan-video-prompts` | Kling, Seedance |
| Seedance 2.x | through Higgsfield (default video model) or a RunningHub workflow or AI App | Higgsfield ACTIVE; RunningHub ACTIVE | 8 | Multi-shot and shotlist motion; grammar in `seedance-director`, `seedance-shotlist-director` | Wan via Runway |
| Kling 3.0 | DZNR OS `kling` driver (std for draft, pro for hero) | driver present | 8 | Image-to-video when identity and physical motion matter; illustration on twos with a strong "hold linework" directive | Wan via Runway |
| Topaz upscalers via RunningHub | `runninghub` spec; DZNR OS `runninghub` driver (a saved workflow or AI App) | ACTIVE | 10 | Delivery-resolution upscale before motion | Higgsfield `upscale_image` / `upscale_video` |
| Adobe for creativity | `routing/mcps/adobe.md` (server `adobe-for-creativity`) | ACTIVE | 10 | Grain (`image_add_grain`), colour temperature, HSL, lens blur, halftone for print looks | Grade in Blender's compositor or by hand |
| Blender MCP | `routing/mcps/blender.md` | ACTIVE when the local Blender app runs | 4 (Layer 1 blocking), 7, 10 | Sets, device placement, camera blocking, 3D-real renders on packs whose medium allows it | Unreal MCP, or a described camera brief |
| Meshy, Tripo | DZNR OS drivers; also via Weavy for Cheetara | drivers present | 7 | A hero object as a mesh for staging or a live scene | Blender modelling |
| Figma MCP | `routing/mcps/figma.md` | ACTIVE | 6 | The type layer and layout; technical-poster plates | Pencil MCP |
| Pencil MCP | `routing/mcps/pencil.md` | ACTIVE | 6 | Type layer and UI layout in .pen files | Figma MCP |
| ElevenLabs | DZNR OS `elevenlabs` driver | driver present | 8 | Voice and sound for a motion beat or a site's ambient layer | Wan's native audio |
| threejs-* skills, threeui-catalog | workshop skills | installed | 8, and the site (`immersive-world-site`) | Live 3D scenes, scroll-scrubbed beats, HUD components | static plates with CSS motion |

**Not DZNR routes, though creators in the evidence used them:** Magnific (upscale), Minimax Hailuo
(video), Google Flow, DaVinci Resolve, CapCut, Cinema 4D and Redshift. Name them only as what a creator
stated; never route a job to them.

**Cost and confirmation:** paid video and upscale runs follow the spend gate DZNR OS already enforces;
draft at the shortest length that shows the beat (5 to 8 seconds), then extend the approved one.
