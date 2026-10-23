# Surrealism

**In one line:** one impossible relationship, staged with total photographic or painterly conviction, so the image argues a metaphor instead of showing a scene.

**Family:** Kevin's list.
**Exemplified by:** @ovyonlabs (the ASEMIC branding and art direction for @asemic.system: "The body as terrain." Faceless figures in technical suits composited into circular landscape portals, a jacket flying through a circle over terrain).

## Use it when / not when

- **Use when:** the brief has a metaphor worth making literal (a body as terrain, a city in a teacup, a door that remembers), a campaign key visual, a chapter opener in a story world whose prose is dreamlike, an album or book cover.
- **Not when:** the reader must understand a product's function, the metaphor is weak or generic ("melting clocks"), or the author's pack declares documentary realism. On an author world it is an option to offer, never a default.

## Signature cues

- **Composition:** one surreal device (a circle portal, a scale inversion, a material swap) repeated across the series as a system; the rest of the frame obeys normal physics; horizon on a third; a small human figure for scale.
- **Palette (sampled from the real terrain, one soft brand accent):**

| Role | Name | Hex |
|---|---|---|
| Earth | Rust ridge | #C8661E |
| Stone | Basalt | #5E5A57 |
| Light ground | Chalk | #ECE8E1 |
| Cold | Glacier teal | #5E8C8F |
| Accent | Dusty mauve | #D8A9B7 |
| UI ground | Black | #0B0B0B |

- **Materials:** real ones, rendered truthfully: aerial sand and mineral ridges, snow, technical fabric with water beading, crinkled metallic film. Surrealism fails when the materials go plastic.
- **Light:** natural and consistent across both halves of the impossible join (same sun angle, same colour temperature), a warm-cool split (sunset orange against snow blue) at most.
- **Type pairing (suggestions):** a characterful high-contrast serif wordmark (GT Super, Ogg, or Editorial New); a mono (JetBrains Mono, Berkeley Mono) set small on circular paths for spec or coordinates, as ASEMIC does.
- **Motion:** slow and inevitable: a portal that widens over 6 seconds, a figure that walks from one world into the other, a camera push through the device. Never fast.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Random dream soup (floating eyes, melting clocks, many oddities) | One impossible relationship per frame, stated in a one-line thesis |
| Two halves lit differently, so it reads as a bad composite | Match sun angle, colour temperature and grain across the join |
| Plastic, smooth AI materials | Name real materials and real wear: water beads, fabric grain, aerial scale cues |
| Metaphor that needs a caption to decode | Choose a metaphor the brief already speaks (garment and terrain for outdoor apparel) |
| A different surreal device every frame | Pick one device (the circle) and repeat it as the series system |
| Faces doing the emotional work | Hide or turn faces; let the device and the material carry it |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Surreal campaign photograph, {THESIS, e.g. "the body as terrain"}: {FIGURE} with face hidden, standing at the edge of a perfect circular portal cut into {TERRAIN_A}, through the circle {TERRAIN_B} at the same sun angle, {MATERIAL_DETAILS}, small human scale against vast landscape, natural {LIGHT_TIME} light, warm-cool split, shot on medium format, crisp fabric texture, muted earth palette with one {ACCENT_COLOUR} accent --ar {4:5 | 16:9} --style raw --s 100 --no melting, floating eyes, extra limbs, text --sref {SREF_CODE} --sw {100-250}
```

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a photograph that shows one impossible thing: {IMPOSSIBLE_RELATIONSHIP}. Everything else in the picture is real and ordinary. The setting is {TERRAIN_A}; through the {DEVICE} you see {TERRAIN_B}. Both sides have the same sunlight from {SUN_DIRECTION} and the same colour of light. The person is {FIGURE}, with their face hidden by {HOOD_OR_ANGLE}. Use earth colours from the land and one soft {ACCENT_COLOUR} ({ACCENT_HEX}) on {ACCENT_PART}. Show real texture: {MATERIAL_DETAILS}. No writing.
```

For a series: attach the approved hero and say "Same device, same light logic, same palette and lens. Change only {ONE_VARIABLE: the terrain | the figure's suit colour | the scale of the device}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create an 8-second, {16:9 | 4:5} image-to-video clip from the attached still, photographic. Preserve the figure, the suit, the circular portal, both landscapes and the light exactly; keep the figure's face hidden. At 0-3 seconds the camera holds, wind moves the fabric and fine sand drifts across the ground. At 3-6 seconds the camera makes one slow push toward the portal. At 6-8 seconds the figure takes one step through the circle into {TERRAIN_B} and the camera stops on the threshold. Sound: wind over open ground, fabric rustle, a low tonal swell as the figure crosses. No morphing, no added text, no extra figures.
```

### UI or web section (structured brief)

```text
Build statement: one campaign chapter for {BRAND}, surreal terrain art direction, {STACK}.
Tokens: UI ground "Black" #0B0B0B, Text "Chalk" #ECE8E1, Secondary rgba(236,232,225,0.62), Earth "Rust" #C8661E, Cold "Glacier" #5E8C8F, Accent "Mauve" #D8A9B7 (label chips and one highlight bar only), radius 999px for chips, 0 for images, a 48px background grid at 6 percent chalk, cards separated by fill, no outline strokes.
Type: wordmark Ogg or Editorial New at clamp(56px, 10vw, 160px); body Inter Tight 16px / 1.6; spec text JetBrains Mono 10px uppercase tracking 0.2em set on a circular SVG textPath around the portal.
Layout: max width 1440px, 12 columns, 24px gap; the portal image centred spanning 8 columns, wordmark overlapping its lower edge, two spec chips on columns 1 to 3.
Copy: thesis "{THESIS}"; chip labels "CODE {NUMBER}", "{COORDINATES}"; spec ring "{FABRIC_COMPOSITION} / {WEIGHT} / {PROPERTY}".
Device (one): the circular mask widens from 40 percent to 100 percent of the viewport on scroll (clip-path circle, scrubbed).
Accessibility: AA contrast on all text, the ring text duplicated as a plain list for screen readers, prefers-reduced-motion shows the full image unmasked.
Performance: portal image AVIF under 250KB with a 20px blurred placeholder, LCP under 2.5s, CLS under 0.05.
```

### 3D / Three.js scene note

Two scenes joined by a portal: render scene B to a render target and show it on a circle in scene A (`threejs-shaders` for the stencil or a circular mask), match the directional light angle in both (`threejs-lighting`), add drifting sand as points (`threejs-geometry`), and push the camera through on scroll (`threejs-animation`, `threejs-interaction`). Terrain from Blender MCP with real displacement maps (`threejs-textures`). Reduced motion: the composed still.

## Gate notes

`quality-gate` checks this style hardest on legibility of meaning (the thesis readable in one look), matched light across the join, one device across the series, real materials. Pair with `high-end-visual-design` for the page and `critique` to test whether the metaphor lands with someone who has not read the brief.
