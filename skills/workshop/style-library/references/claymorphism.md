# Claymorphism

**In one line:** soft, inflated, matte-to-milky 3D forms with rounded mass and subsurface glow, set in a palette sampled from the subject, so a product or idea feels touchable and friendly without going cheap.

**Family:** Kevin's list.
**Exemplified by:** @pxdx.baddies (the Ramen slide of "Bento boxes in different UI styles": a 3D clay ramen bowl, cards in sage and dusty pink sampled from the broth), @skvortsov.design (the Optimind concept: milky translucent 3D service icons with subsurface glow, made in Cinema 4D and Redshift per his hashtags), @danielsnows (the "extroverted journey" hero: green velvet hills, pink spheres, a smiling sun).

## Use it when / not when

- **Use when:** the subject is a consumer service, food, onboarding, an empty state, a friendly icon set, a children's or playful story world, or a DZNR OS empty-state object that should lower anxiety.
- **Not when:** the brief is precision, money at risk, security, or a mature story; the work is for Kevin's own instrument-grade look (see `kevin-taste`: clay reads toy, not tool); or an author's pack declares photographic realism. On an author world it is an option to offer, never a default.

## Signature cues

- **Composition:** one hero clay object, centre or right third, 50 percent negative space; secondary objects at 30 to 50 percent of the hero's scale on two depth planes; cards sit beside the object, never on top of it.
- **Palette (pastel neutrals plus one saturated signal, sampled from the subject):**

| Role | Name | Hex |
|---|---|---|
| Ground | Oat | #F3EEE6 |
| Surface | Milk | #FBF8F3 |
| Clay 1 | Sage | #A8C3A0 |
| Clay 2 | Dusty pink | #E7B8B4 |
| Ink | Cocoa | #3A2F2A |
| Signal | Broth amber | #E89A3C |

- **Materials:** matte clay with a 0.6 to 0.8 roughness, milky translucent resin with subsurface scattering, soft velvet flocking on large forms, no hard metal, no gloss specular hotspot larger than 5 percent of the form.
- **Light:** one large area light from top-left at low intensity, a warm bounce from below, ambient occlusion in every crease, a soft contact shadow 20 to 30 percent opacity. No rim light.
- **Type pairing (suggestions):** a rounded geometric display (Nunito Black, Quicksand Bold, or Gabarito ExtraBold) for headlines; a neutral sans (Instrument Sans or Inter Tight) for body.
- **Motion:** one squash-and-stretch beat: an object drops 40px, squashes 8 percent, settles with a spring (stiffness 180, damping 14). Idle bob of 4px over 3s at most.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Plastic gloss that reads as cheap toy render | Raise roughness to 0.7, cap specular, name "matte clay" and "subsurface" in the prompt |
| Rainbow of pastels with no logic | Sample three clay colours from the subject (the broth, the noodle, the bowl) and one signal |
| Clay cards with 1px outline strokes | DZNR OS decision 218: separate cards with fill plus a soft two-layer shadow, never a stroke |
| Faces on every object | One character at most; objects stay objects |
| Inflated type that breaks legibility | Keep body text flat and neutral; clay is for objects, not paragraphs |
| Every element floating | Ground the hero with a contact shadow; float only secondary props |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Soft 3D clay render of {SUBJECT}, {SECONDARY_OBJECTS} on two depth planes, matte clay with gentle subsurface scattering, milky translucent resin details, palette {CLAY_1}, {CLAY_2} and {GROUND_COLOUR} with one {SIGNAL_COLOUR} accent on {SIGNAL_PART}, large soft area light top-left, warm bounce from below, ambient occlusion in creases, soft contact shadow, plain {GROUND_COLOUR} background, generous negative space on the left --ar {4:5 | 16:9} --style raw --s 100 --no gloss, outline, text, neon, chrome --sref {SREF_CODE} --sw {100-200}
```

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a soft 3D clay illustration of {SUBJECT}. Everything is matte, like modelling clay, with slightly milky edges where light passes through. Use only these colours: {CLAY_1} ({HEX_1}), {CLAY_2} ({HEX_2}), a {GROUND_COLOUR} background ({GROUND_HEX}), and one {SIGNAL_COLOUR} ({SIGNAL_HEX}) on the {SIGNAL_PART}. Add {SECONDARY_OBJECTS} smaller and further back. Light it with one big soft light from the upper left and a warm glow from below, soft shadows in every fold, a soft shadow on the ground. No shine, no outlines, no writing. Leave the left half empty for text.
```

For a series: attach the approved hero and say "Same clay material, same light, same palette. Change only {ONE_VARIABLE: the object | the angle | the secondary props}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 5-second, {1:1 | 9:16} image-to-video clip from the attached still, soft 3D clay animation. Preserve the clay material, palette, lighting and every object's shape exactly. The camera holds, locked off. At 0-1.5 seconds the {SUBJECT} drops into frame from above and squashes on landing, then springs back. At 1.5-3.5 seconds the {SECONDARY_OBJECTS} bob gently once. At 3.5-5 seconds everything settles and holds still. Sound: a soft muffled thud on landing, one small bright pop, quiet room tone. No gloss, no outlines, no added text, no camera movement.
```

### UI or web section (structured brief)

```text
Build statement: one onboarding or empty-state section for {PRODUCT}, soft clay style, {STACK}.
Tokens: Ground "Oat" #F3EEE6, Surface "Milk" #FBF8F3, Clay "Sage" #A8C3A0, Clay "Dusty pink" #E7B8B4, Ink "Cocoa" #3A2F2A, Secondary ink rgba(58,47,42,0.64), Signal "{SIGNAL_NAME}" {SIGNAL_HEX} (the one CTA only), radius 24px, cards separated by fill and a soft two-layer shadow (0 1px 2px rgba(58,47,42,0.06), 0 12px 32px rgba(58,47,42,0.08)), no outline strokes.
Type: display Gabarito 800 at clamp(36px, 5vw, 72px), tracking -0.02em; body Instrument Sans 400 at 17px / 1.55.
Layout: max width 1120px, 12 columns, 24px gap, hero object spans columns 7 to 12, copy columns 1 to 6, section padding clamp(80px, 10vw, 140px).
Copy: headline "{HEADLINE, e.g. 'Nothing here yet. Let's fix that.'}"; sub "{ONE_LINE}"; CTA "{CTA_LABEL}".
Device (one): the clay object drops in with a squash-and-stretch spring (stiffness 180, damping 14) once on first view.
Accessibility: AA contrast on every text pair (cocoa on oat passes), 2px focus ring in the signal colour, prefers-reduced-motion shows the settled object.
Performance: object as a pre-rendered AVIF under 150KB or a GLB under 400KB with Draco, LCP under 2.5s, CLS under 0.05.
```

### 3D / Three.js scene note

MeshPhysicalMaterial with roughness 0.7, sheen 0.3 for velvet forms, transmission 0.4 and thickness 1.2 for milky resin, an HDRI studio with a low-intensity softbox, a shadow-catcher plane for the contact shadow, and a single ambient-occlusion pass. Model in Blender MCP (subdivision surfaces, bevel everything) or take a starting mesh from Meshy or Tripo and smooth it. Build with `threejs-materials`, `threejs-lighting`, `threejs-postprocessing` (SSAO only, no bloom) and `threejs-animation` for the spring drop; harden with `threejs-production-hardening`. Reduced motion: the settled render.

## Gate notes

`quality-gate` checks this style hardest on: matte not glossy, three clay colours plus one signal (count them), no outline strokes on cards or pills (decision 218 in DZNR OS), contact shadow present, body text flat and legible. Pair with `delight` for the micro-interaction and `minimalist-ui` for the surrounding layout; this entry owns the objects.
