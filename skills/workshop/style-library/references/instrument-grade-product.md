# Instrument-grade Product

**In one line:** an object photographed or rendered as if it ships tomorrow: every knob, scale and label has a reason, one signal colour speaks, and the light is a product studio's.

**Family:** found in the research (Kevin's centre of gravity: his Tech, Sound, Vision and Unsorted Cosmos boards).
**Exemplified by:** @an_improbable_future (lost-product fiction on real brands, archive light), @vnarshia (the TP-7 site concept: one red on grey, macro masks), @skvortsov.design (white plastic and safety orange as a world), @jasonscarecrowart (20 colourways of one mech hand), the Teenage Engineering and Braun lineage Kevin saves.

## Use it when / not when

- **Use when:** the hero is a made thing (a device, a tool, a vehicle, a prop, a wearable), the brand sells precision or craft, a DZNR OS feature needs a physical metaphor (a dial for spend, a detent for a setting), or a story world needs believable artefacts.
- **Not when:** the subject is a feeling with no object, the audience needs warmth over exactness (a children's story, a grief memoir), or an author's pack declares a drawn or painterly medium. On an author world it is an option to offer, never a default.

## Signature cues

- **Composition:** one object, dead centre or on a strict third; orthographic side profile, three-quarter at eye height, or top-down knolling flat-lay; 40 to 60 percent negative space; series framing locked so ten frames read as one catalogue.
- **Palette (neutrals plus one signal, sampled from the object):**

| Role | Name | Hex |
|---|---|---|
| Ground | Seamless grey | #E3E6E8 |
| Body light | Rams white | #F2F2F0 |
| Body dark | Graphite | #2B2B2D |
| Metal | Bead-blast aluminium | #B9BCBF |
| Signal | TE orange | #FF5A1F |
| Signal (alt) | Record red | #E8322A |

- **Materials:** bead-blasted and anodised aluminium, matte ABS, translucent smoke polycarbonate showing the PCB, knurled knobs with visible detents, membrane keys, speaker mesh, printed legends and micro-type on the product, one peeling asset tag where wear is wanted.
- **Light:** large soft key from top-left, white bounce card right, soft contact shadow, no rim glow; or flat overcast archive daylight on concrete. f/8 to f/11 so the whole object is sharp.
- **Type pairing (suggestions):** Neue Haas Grotesk or Helvetica Neue for statements; JetBrains Mono, IBM Plex Mono or Berkeley Mono for spec labels and counters; a dot-matrix face (Doto, or a custom 5x7) for any on-device display.
- **Motion:** one tactile beat: a dial turns two detents and the OLED counter ticks; a part lifts on its assembly axis; a lid opens on a spring. Slow, held, mechanical. 2 to 3 second holds between beats.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Glow, bloom and lens flare on the product | Flat studio or overcast light; delete "cinematic lighting" from the prompt |
| Controls that do nothing (knobs with no legend, buttons with no function) | Write the control list into the prompt: what each knob sets, its scale, its legend |
| Five accent colours | One signal hex, on the one control that matters (record, power, the hero key) |
| Box-fresh plastic everywhere | Name two wear marks: a scuffed edge, a sun-faded label, a graphite smudge |
| Generic "futuristic device" | Anchor in heritage: "as Braun would have made it in 1968", "a 1999 Sony that never shipped" |
| Garbled brand type | Generate the object unlabelled, set the legends and wordmark by hand in the type layer |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Product catalogue photograph of {OBJECT}, {ERA_ANCHOR, e.g. "a 1987 Sony that never shipped"}, {VIEW: orthographic side profile | three-quarter at eye height | top-down flat-lay} on a seamless {GROUND_COLOUR} sweep, {BODY_MATERIALS}, {CONTROLS: each control and what it sets}, one {SIGNAL_COLOUR} {SIGNAL_PART}, {WEAR_1}, {WEAR_2}, large soft key light top-left, white bounce right, soft contact shadow, medium format, 80mm, f/11, neutral grade, fine film grain --ar {4:5 | 1:1} --raw --s 50 --no glow, lens flare, neon, text --sref {SREF_CODE} --sw {100-250}
```

For Midjourney V8.2, the full set for this style (hero still, series variant, Edit Model instruction for the series, video beat and a filled example) is in `midjourney-legendary` (`references/library-styles.md`, Instrument-grade Product), with the parameter recipes and Kevin's sref library.

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a product photograph of {OBJECT}. It is {ERA_ANCHOR}. Show it {VIEW} on a plain {GROUND_COLOUR} studio sweep. The body is {BODY_MATERIALS}. It has {CONTROLS}. Only one part is coloured: the {SIGNAL_PART} in {SIGNAL_COLOUR} ({SIGNAL_HEX}). It has been used: {WEAR_1} and {WEAR_2}. Light it like a product catalogue: one large soft light from the upper left, a white card filling from the right, a soft shadow under it, no glow. Everything is in focus. Leave the top third empty for type. Do not add any writing.
```

For a series on Nano Banana or Higgsfield: attach the approved hero as the reference and say "Same object, same materials, same light and lens. Change only {ONE_VARIABLE: colourway | angle | a part lifted on its axis}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 6-second, {16:9 | 9:16} image-to-video clip from the attached still, photographic product film. Preserve the object, its materials, its legends, the studio sweep and the light exactly. The object stays centred; the camera holds on a locked-off tripod. At 0-2 seconds nothing moves but a slow 2 percent push-in. At 2-4 seconds the {CONTROL} turns two detents and the {DISPLAY} ticks from {VALUE_A} to {VALUE_B}. At 4-6 seconds hold. Sound: a quiet room tone, two dry mechanical clicks on the detents, nothing else. No glow, no lens flare, no added text, no camera shake.
```

### UI or web section (structured brief)

```text
Build statement: one product section for {OBJECT}, light instrument style, {STACK}.
Tokens: Ground "Seamless" #E3E6E8, Surface "Rams" #F2F2F0, Ink "Graphite" #2B2B2D, Secondary ink rgba(43,43,45,0.64), Signal "{SIGNAL_NAME}" {SIGNAL_HEX} (one element only), radius 8px, cards separated by fill and a soft two-layer shadow, no outline strokes.
Type: display Neue Haas Grotesk 500 at clamp(40px, 6vw, 96px), tracking -0.03em, sentence case ending with a full stop; labels JetBrains Mono 11px uppercase, tracking 0.12em; counters in a dot-matrix face.
Layout: max width 1280px, 12 columns, 24px gap, section padding clamp(96px, 12vw, 160px).
Copy: headline "{HEADLINE, e.g. 'worth recording.'}"; label "{OBJECT_CODE} / {PART_COUNT} parts"; one 2-line sub.
Device (one): a macro crop revealed through a circle clip-path that grows from the corner, 600ms cubic-bezier(.7,0,.2,1), and a live counter in the device display.
Accessibility: AA contrast on every text pair, 2px focus ring in the signal colour, prefers-reduced-motion shows the final crop with no reveal.
Performance: hero image AVIF under 180KB, LCP under 2.5s, CLS under 0.05.
```

### 3D / Three.js scene note

One object, PBR materials (aluminium roughness 0.35 to 0.45, ABS 0.6, polycarbonate with transmission 0.9 and thickness), an HDRI studio environment with a softbox, a shadow-catcher plane for the contact shadow. A scroll-scrubbed exploded view keeps every part on its assembly axis with equal spacing (the grammar of the @jakymakey Replit output and @jenya.kruglova's cutaway codes). Model in Blender MCP or take a mesh from Meshy or Tripo; build with `threejs-materials`, `threejs-lighting`, `threejs-animation`, `threejs-interaction`; harden with `threejs-production-hardening`. Reduced motion: the assembled render, still.

## Gate notes

`quality-gate` checks this style hardest on: one signal colour only (count the hues), controls with a reason, wear present where the brief asks, legends set by hand (no model-made text), no glow. Pair with `high-end-visual-design` for the page chrome and `minimalist-ui` for surrounding layout; this entry owns the object.
