# Techwear Editorial

**In one line:** identity hidden behind engineered surfaces: helmets, visors, balaclavas and technical shells shot with a fashion-editorial finish, faces receding so the garment and its gear tell the story, with one signal colour.

**Family:** found in the research.
**Exemplified by:** @ovyonlabs (ASEMIC for @asemic.system: faceless figures in technical suits against mineral terrain, circular portals, mono spec text on circular paths; its line "The body as terrain." governs every frame), @pxdx.baddies (the BUSHI techwear samurai on a greige studio sweep, one coherent world across key visual and game UI), Kevin's Cosmos Gear board (about 75 saves: ring visors, clear helmets, quilted hoods, balaclavas, translucent PVC, 3D-printed boots).

## Use it when / not when

- **Use when:** a character's role matters more than their face (couriers, soldiers, pilots, a faction), an apparel or wearable brand needs a campaign, a story world needs believable wardrobe, or a cast of many must share one look.
- **Not when:** the story turns on a recognisable face and expression, the brief is warm and personal, or canon says the character's face is seen in that scene. On an author world, costume comes from the canon and the pack; this is an option for how it is shot.

**Marks:** do not put real fashion or sportswear brand marks on the output. Describe construction (taped seams, quilted panels, a moulded visor) and invent the label, or use the client's own mark, set by hand.

## Signature cues

- **Composition:** fashion-editorial full body or three-quarter, back three-quarter or profile so the face recedes; figure on a seamless sweep or composited into terrain through a circular portal; 4:5 or 2:3; one figure per frame, generous negative space for a wordmark.
- **Palette (mineral neutrals, one signal):**

| Role | Name | Hex |
|---|---|---|
| Ground | Greige sweep | #C9B8A0 |
| Mineral | Basalt grey | #5E5A57 |
| Garment light | Chalk | #EDEDEB |
| Garment dark | Charcoal | #2B2B2D |
| Signal | Safety orange | #F26A1B |
| Signal (alt) | Dusty mauve | #D8A9B7 |

- **Materials:** technical nylon, Gore-Tex-type three-layer shells with taped seams, quilted panels, knitted balaclavas, glossy injection-moulded ABS helmets, clear polycarbonate visors, chrome goggles, frosted silicone, webbing, cord locks, water beading on fabric.
- **Light:** soft key from a large source at 45 degrees, fill card, subtle rim; or natural blue-hour light on terrain with one warm horizon. Medium format, 85 to 100mm, shallow depth of field on details.
- **Type pairing (suggestions):** a characterful high-contrast serif wordmark (GT Sectra, Canela) or an ultra-wide extended display face (Monument Extended, Druk Wide) for names; a mono for spec text (IBM Plex Mono, Space Mono) set small, on paths or in label chips ("CODE 0446", fabric weight, coordinates).
- **Motion:** garment as subject: wind moving a hood, rain beading and running off a shell, a visor sliding down, a slow turn on a turntable. 4 to 6 seconds, held.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Faces front and centre, the gear secondary | Hood, visor, balaclava or back turned; state "face hidden" in the prompt |
| Costume-party sci-fi (random armour, LEDs everywhere) | Name construction: seams, panels, fastenings, materials, a reason for each part |
| Real brand logos on the garments | Invent the label or use the client's mark, set by hand |
| Five accent colours on one outfit | One signal colour, on one panel, visor or cord |
| Plastic-smooth AI fabric | "Fabric texture, water beading, visible weave, creases at the elbow" |
| Each cast member styled differently | One wardrobe system: shared palette, materials and silhouette rules per faction |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Fashion editorial photograph, {FIGURE: role}, face hidden by {CONCEALMENT: a hood and moulded visor | a knitted balaclava | back turned}, wearing {GARMENT: construction and materials}, {GEAR}, one {SIGNAL_COLOUR} {SIGNAL_PART}, {SETTING: seamless greige studio sweep | snowy ridge at blue hour}, {POSE}, soft key light at 45 degrees, medium format, 85mm, crisp fabric texture, water beading, muted mineral palette, no logos --ar 4:5 --style raw --s 75 --no logo, text, face visible, neon --sref {SREF_CODE} --sw {100-250}
```

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a fashion-editorial photograph of {FIGURE}. Their face is hidden: {CONCEALMENT}. They wear {GARMENT}, with {GEAR}. The colours are muted greys, chalk and charcoal; only {SIGNAL_PART} is {SIGNAL_COLOUR} ({SIGNAL_HEX}). They stand {POSE} on {SETTING}. Light it softly from one side like a magazine shoot. Show real fabric: weave, seams, creases, water beading. No logos or writing on the clothes.
```

Series line: attach the approved hero and say "Same wardrobe system, same light and lens. Change only {ONE_VARIABLE: the figure's pose | the colourway to mustard | the setting to a rust ridge}." For one recurring character, lock identity with Higgsfield's character tools and keep the costume list fixed.

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 5-second, 4:5 image-to-video clip from the attached still, fashion-editorial photographic realism. Preserve the figure, the garment construction, the hidden face, the colourway and the light exactly; the face is never revealed. The figure stays centre frame. At 0-2 seconds hold; wind lifts the hood edge. At 2-4 seconds the figure turns 30 degrees to profile; rain beads and runs off the shoulder panel. At 4-5 seconds a slow 3 percent push-in on the {SIGNAL_PART}, then hold. Sound: wind, rain on nylon, one zip pull. No text, no logos, no face reveal.
```

### UI or web section (structured brief)

```text
Build statement: a product detail section for {GARMENT} in a techwear label's site, {STACK}.
Tokens: Ground "Charcoal" #2B2B2D, Surface "Chalk" #EDEDEB, Text "Chalk" #EDEDEB, Secondary rgba(237,237,235,0.6), Signal "{SIGNAL_NAME}" {SIGNAL_HEX} (label chips and add-to-bag only); spec cards filled with soft shadow, no outline strokes, radius 14px; 1px grid lines at 48px on the ground at 6 percent.
Type: wordmark GT Sectra 500 at clamp(48px, 7vw, 120px); product name Monument Extended 400 at clamp(18px, 1.8vw, 26px) uppercase; spec IBM Plex Mono 11px uppercase tracking 0.12em.
Layout: 12 columns, 24px gap; image 7 columns in a circular portal mask over terrain; spec column 5 with 4 cards.
Copy: name "{NAME}"; label chip "CODE {CODE}"; spec cards with real values ("3L shell, 20k/20k", "{WEIGHT} g", "Taped seams", "{ORIGIN}"); one line of the campaign thesis ("{THESIS}").
Device (one): spec text runs on a circular SVG path around the portal, rotating 360 degrees in 60s.
Accessibility: spec values repeated as a plain list for screen readers (the path text is aria-hidden), reduced motion stops the rotation, AA contrast on secondary text, focus ring 2px in the signal colour.
Performance: portal image AVIF under 200KB, srcset to 2x, LCP under 2.5s, CLS under 0.05.
```

### 3D / Three.js scene note

For a live garment: a scanned or Meshy or Tripo mesh retopologised in Blender MCP, a cloth material with a weave normal map and sheen, a clear visor with transmission, on a turntable the user can drag 360 degrees, studio HDRI. Build with `threejs-loaders`, `threejs-materials`, `threejs-textures`, `threejs-interaction`; a circular mask over terrain can be a shader plane (`threejs-shaders`). Check `threeui-catalog` for product-viewer controls.

## Gate notes

`quality-gate` checks this style hardest on: face hidden, construction legible, one signal colour, fabric texture present, no third-party marks, and one wardrobe system across the series. On an author world the Fidelity Gate runs first (costume from canon). `editorial-design` covers the page; `high-end-visual-design` the chrome.
