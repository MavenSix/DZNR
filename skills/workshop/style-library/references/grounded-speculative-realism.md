# Grounded Speculative Realism

**In one line:** objects, vehicles and machines that never existed, photographed as if they had: documentary settings, archive or overcast light, real wear, and the design grammar of a real era, so the viewer thinks "it could have existed".

**Family:** found in the research.
**Exemplified by:** @an_improbable_future (on Instagram and at animprobablefuture.com: alt-history consumer hardware, vehicles and mechs on concrete aprons, in hangars and fields; the studio describes its work as "Designed by AI, created & curated by me"), @designchapel (the Wipeout fan trailer: used-future racers with chipped paint and decals, fog and halation), Kevin's Cosmos Future Architecture and Tech boards (lost Sony hardware, monoliths, cine cameras).

## Use it when / not when

- **Use when:** a story world needs props, vehicles or devices that feel manufactured; a speculative product needs to be believed before it is built; Pulse needs establishing artefacts for a near-future or alt-history novel; a pitch needs "what if this existed" imagery that survives scrutiny.
- **Not when:** the brief wants fantasy spectacle with no logic, the pack declares a drawn or painterly medium, or the piece depends on real third-party brands the client has no rights to. On an author world it is offered when the pack is photographic; the era and place come from the canon.

**Trademarks:** An Improbable Future's believability leans on real marques. DZNR does not put real third-party trademarks on client, Pulse or author work without rights. Use the heritage grammar (proportions, type style, colour coding of an era), invent the marque, or use the client's own mark, set by hand.

## Signature cues

- **Composition:** catalogue plates: dead-centre orthographic side profile for vehicles, three-quarter at eye height, or top-down flat-lay on seamless white for handhelds. Series in pairs: the still and its motion version, or two angles of one subject, so a feed reads as a collection. Real context at real scale: a person, a lane line, a pallet, a soldier at 1:20.
- **Palette (desaturated world, one saturated signal per image):**

| Role | Name | Hex |
|---|---|---|
| Ground | Wet concrete | #8C8E8D |
| Sky | Overcast white | #D9DCDD |
| Shadow | Lifted black (film scan) | #22262A |
| Body | Faded ABS | #C9C6BE |
| Signal | Livery red | #D9361E |
| Signal (alt) | Terminal magenta | #E0479E |

- **Materials:** translucent smoke ABS showing PCBs, scuffed enamel paint, peeling barcode and asset-tag stickers, gaffer-tape repairs, graphite smudges, sun-faded labels, anodised fasteners, drill holes, rubber grips worn shiny, decals and panel lines.
- **Light:** flat overcast daylight on concrete; hangar fluorescents at 4000K; north-window light on a seamless sweep; never golden-hour glow, never rim neon. Slight halation on highlights, lifted blacks, fine grain like a 400-speed scan.
- **Type pairing (suggestions):** Helvetica Neue Bold or Neue Haas Grotesk for statement framing (the studio site's choice: one face, one weight, three sizes); a period-correct product face for invented marques (Eurostile for 70s to 90s tech, Microgramma, or a custom wordmark); IBM Plex Mono for serials and captions.
- **Motion:** slow reels of the object in place: a 6 to 10 second walk-around at walking pace, a door opening, a screen waking, a rotor spinning up. Camera handheld-steady or on a slider, never orbiting at drone speed.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| AI sheen: glossy everything, glow, neon rim light | "Archival photograph", "overcast", "lifted blacks, fine grain"; add `--no glow, neon, lens flare` |
| Box-fresh surfaces | Name two or three wear marks per subject (peeling sticker, scuffed edge, tape repair) |
| A mash of eras (a CRT on a 2040 hovercar with no logic) | Pick one heritage anchor and year ("a 1999 portable terminal that never shipped") |
| Real brand logos on client work | Invent the marque or use the client's mark, set by hand after generation |
| Fantasy setting with no scale | Put it somewhere real: an airfield apron, a warehouse, a cornfield, with a person for scale |
| Generic three-quarter hero pose on black | Catalogue framing on seamless or documentary context; same framing across the series |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Archival {press | catalogue | field-test} photograph of {SUBJECT}, {ERA_ANCHOR, e.g. "a 1999 portable data terminal that never shipped"}, {VIEW} {SETTING: on a cracked concrete airfield apron | in a fluorescent-lit white hangar | on a seamless white sweep}, {BODY: materials and colours}, one {SIGNAL_COLOUR} {SIGNAL_PART}, {WEAR_1}, {WEAR_2}, {WEAR_3}, {SCALE_CUE}, flat overcast daylight, medium format, 80mm, f/8, neutral grade, slightly lifted blacks, fine film grain --ar {1:1 | 4:5 | 3:2} --raw --s 50 --no glow, neon, lens flare, logo, text --sref {SREF_CODE} --sw {100-250}
```

For Midjourney V8.2, the full set for this style (hero still, series variant, Edit Model instruction for the series, video beat and a filled example) is in `midjourney-legendary` (`references/library-styles.md`, Grounded Speculative Realism), with the parameter recipes and Kevin's sref library.

### Still: natural language (Nano Banana, Higgsfield)

```text
Make an archival photograph of {SUBJECT}, which is {ERA_ANCHOR}. It stands {SETTING}, seen {VIEW}. It is made of {BODY}. Only one part is strongly coloured: {SIGNAL_PART} in {SIGNAL_COLOUR} ({SIGNAL_HEX}); everything else is muted. It has been used for years: {WEAR_1}, {WEAR_2}, {WEAR_3}. Include {SCALE_CUE} so its size is clear. The light is flat and overcast, like a press photo from the period, with slightly lifted blacks and fine grain. No glow, no logos, no writing.
```

Series line: attach the approved still and say "Same object, same wear, same light and lens. Change only {ONE_VARIABLE: the angle to a pure side profile | the setting to a hangar | the colourway}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create an 8-second, 16:9 image-to-video clip from the attached still, documentary photographic realism. Preserve the object, its wear, its markings, the setting, the overcast light and the grain exactly. The object stays centre frame; the camera is on a slider at eye height. At 0-3 seconds a slow lateral slide left, 30cm, nothing else moves. At 3-6 seconds {ONE_ACTION: the canopy lifts | the screen wakes with magenta terminal text | the rotor spins up}. At 6-8 seconds the slide stops and holds on the object. Sound: wind across the apron, a distant engine, the mechanical sound of the action, then quiet. No lens flare, no glow, no added logos or text.
```

Pair the clip with its still as a diptych; the pair is the unit that ships.

### UI or web section (structured brief)

```text
Build statement: a statement-scale single column for {STUDIO_OR_PROJECT}, Swiss frame around speculative artefacts, {STACK}.
Tokens: Paper "White" #FFFFFF, Ink "Black" #111111, Secondary rgba(17,17,17,0.6), Signal "Burnt orange" #C4562E (submit button only), no radius on images, no shadows.
Type: one family, Helvetica Neue 700, three sizes: statement clamp(40px, 7vw, 120px) line-height 0.95 tracking -0.02em; caption 15px; serial IBM Plex Mono 12px.
Layout: single column, 44px left margin, text ragged right at 90 percent width, images full-bleed, 160px between statements.
Copy: three statements, one per screen ("{STATEMENT_1}", "{STATEMENT_2}", "{STATEMENT_3}"); each image captioned with its fiction ("{OBJECT}, {YEAR}. Never shipped.").
Device (one): the hero is a looping muted video of the hero object with the studio name running as a giant marquee through it, 19s loop.
Accessibility: captions are text, not baked in; video has a pause control; reduced motion swaps the video for its still; AA contrast throughout.
Performance: hero video 1080p under 3MB with a poster AVIF, images lazy-loaded below the fold, LCP under 2.5s, CLS under 0.05.
```

### 3D / Three.js scene note

For a live artefact: a PBR model with worn materials (roughness maps carrying scuffs, a decal texture for the sticker, translucent shell with transmission), an overcast HDRI and a concrete ground with a soft shadow; camera at eye height, limited orbit of 40 degrees, no auto-rotate. Mesh from Meshy or Tripo, cleaned and decaled in Blender MCP; build with `threejs-loaders`, `threejs-materials`, `threejs-textures`, `threejs-lighting`; add grain and slight halation in `threejs-postprocessing` at low strength.

## Gate notes

`quality-gate` checks this style hardest on: no sheen or glow, wear present, one saturated signal per image, a single era anchor, real scale cues, and no third-party trademark without rights. On an author world the Fidelity Gate runs first (era and place from canon). `minimalist-ui` and `typeset` cover the frame; `instrument-grade-product` is the sibling for studio-clean objects.
