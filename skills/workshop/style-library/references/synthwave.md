# Synthwave

**In one line:** 1980s night-drive retro-futurism: chrome, neon and magenta-to-orange dusk over a dark horizon; at DZNR it is the restrained variant, one sodium or magenta signal on near-black, never the grid sunset.

**Family:** Kevin's list.
**Exemplified by:** No reference in the studied set exemplifies it; lineage: 1980s outrun and arcade cabinet art, Drive (2011) title design, Blade Runner (1982) night colour. The nearest studied cues are the sodium-amber street light and orange and blue speed streaks in Ledger Stax's fly-through (brand.ledger.com/ledger-stax) and the safety-orange radial speed blur in @designchapel's Wipeout fan trailer.

**Kevin's taste:** his taste read says retro-futurism without kitsch, and no synthwave sunsets. For DZNR's own work use the sober variant: near-black, one sodium or magenta signal, real night light, no wireframe grid and no striped sun. On an author world, offer the full classic variant only if the author's pack wants it (an 80s-set novel, an arcade story), as an option, never imposed.

## Use it when / not when

- **Use when:** a story world or music project is set in or quotes the 1980s, a night-drive or speed beat in a trailer, a racing or arcade game landing, a campaign that wants nocturnal momentum.
- **Not when:** the brief is daylight, calm, organic, or precision-first; the request is a shortcut to "looks cool" with no 80s reason; the work is for Kevin and the brief has not argued for it.

## Signature cues

- **Composition:** low camera close to a wet road or a horizon line on the lower third; one light source family (sodium street lamps or one neon sign); speed read through streaks, not through grids; a single chrome or lacquer object catching the light.
- **Palette (sober variant: near-black plus one signal):**

| Role | Name | Hex |
|---|---|---|
| Ground | Night | #07070C |
| Haze | Smog blue | #1C2233 |
| Wet road | Asphalt sheen | #2A2F3A |
| Signal | Sodium | #F28C28 |
| Signal (alt) | Magenta | #E0338E |
| Highlight | Chrome | #D7DCE2 |

  Classic variant (author worlds that ask for it): sunset gradient #FF2E88 to #FF9A3C, cyan grid #24E0FF, purple sky #3A1C71.

- **Materials:** wet asphalt reflections, glossy car lacquer, chrome trim, neon tube glass, rain on a windscreen, smoked plastic tail lights.
- **Light:** practical night light only: sodium lamps, one neon sign, tail lights; halation on highlights, slight anamorphic streak on the brightest source, film grain 4 to 6 percent.
- **Type pairing (suggestions):** a chrome-free wide display (Monument Extended, Druk Wide, or Eurostile Extended) set flat in the signal colour; a mono (JetBrains Mono) for credits; avoid chrome script logotypes in the sober variant.
- **Motion:** forward travel: a slow dolly down a wet road, light streaks passing, a camera low and steady; one beat when a sign flickers on or headlights sweep across.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Wireframe grid floor and striped sunset | Sober variant: a real wet road and practical night light |
| Purple-pink-cyan gradient everywhere | One signal (sodium or magenta) on near-black |
| Chrome script logo | Flat wide display in the signal colour, set by hand |
| Neon on every surface | One neon source; everything else lit by its reflection |
| Palm trees and DeLorean clichés | A specific object and place from the brief or the author's canon |
| No 80s reason in the brief | Ask for the reason; without one, choose `cybercore.md` or `monumental-calm.md` instead |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Cinematic night film still, {SUBJECT} on a wet empty road at {PLACE}, low camera near the asphalt, {SIGNAL_LIGHT e.g. sodium street lamps} as the only light family, deep reflections on the wet road, glossy {OBJECT_FINISH}, light haze, halation on highlights, slight anamorphic flare on the brightest lamp only, near-black sky, 35mm anamorphic, fine film grain --ar 2.39:1 --style raw --s 100 --no grid, sunset, palm trees, purple gradient, chrome text --sref {SREF_CODE} --sw {100-250}
```

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a night photograph of {SUBJECT} on a wet, empty road at {PLACE}. The camera is low, close to the road. The only light comes from {SIGNAL_LIGHT}, which is {SIGNAL_COLOUR} ({SIGNAL_HEX}); the wet road reflects it. The sky is almost black with a little haze. The {OBJECT} is glossy and catches the light. Add a soft glow around the brightest lights and fine film grain. No grid, no sunset, no palm trees, no writing.
```

For a series: attach the approved still and say "Same night, same single light colour, same lens and grain. Change only {ONE_VARIABLE: the location | the object | the camera height}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create an 8-second, 2.39:1 image-to-video clip from the attached still, cinematic photographic night footage. Preserve the subject, the road, the single light colour, the haze and the grain exactly. At 0-4 seconds the camera dollies slowly forward along the wet road, low and steady, lamp reflections sliding past. At 4-6 seconds a pair of headlights sweeps across from screen left to screen right. At 6-8 seconds the camera settles on {SUBJECT} as one {SIGNAL_COLOUR} sign flickers on and holds. Sound: tyres on wet asphalt in the distance, a low analogue synth pad, a soft electrical buzz as the sign lights. No grid, no sunset, no added text.
```

### UI or web section (structured brief)

```text
Build statement: one trailer-style hero section for {PROJECT}, sober night-drive style, {STACK}.
Tokens: Ground "Night" #07070C, Haze "Smog" #1C2233, Text #E9ECF1, Secondary rgba(233,236,241,0.6), Signal "{SODIUM or MAGENTA}" {SIGNAL_HEX} (title and one CTA only), radius 4px, cards separated by fill and a soft dark shadow, no outline strokes, a fixed film-grain overlay at 4 percent, pointer-events none.
Type: title Monument Extended 800 at clamp(48px, 9vw, 140px), tracking 0.02em, uppercase, flat signal colour; credits JetBrains Mono 11px uppercase tracking 0.24em.
Layout: full-bleed 2.39:1 video band, max content width 1280px, 12 columns, 24px gap, title on columns 1 to 8 over the lower third.
Copy: title "{TITLE}"; tagline "{ONE_LINE}"; credit line "{CREDITS}"; CTA "{CTA_LABEL}".
Device (one): the background loop is the 8-second night dolly, muted, with a sound-on toggle.
Accessibility: AA contrast on all text over the darkest video frame (add a 40 percent night scrim), a pause control for the video, prefers-reduced-motion shows the still, captions for any sound with meaning.
Performance: hero video H.265 and VP9 under 2.5MB with a poster AVIF under 120KB, LCP under 2.5s, CLS under 0.05.
```

### 3D / Three.js scene note

A road plane with MeshStandardMaterial at roughness 0.15 plus a normal map for wetness, sodium point lights in a row (`threejs-lighting`, use instanced light cards and a baked lightmap rather than many real lights), a camera dolly on scroll (`threejs-animation`), UnrealBloomPass at 0.5 and a grain pass (`threejs-postprocessing`). Vehicle from Blender MCP, Meshy or Tripo. No grid shader in the sober variant. Harden with `threejs-production-hardening`.

## Gate notes

`quality-gate` checks this style hardest on: a stated 80s reason in the brief, one light family, no grid or sunset in DZNR work, real wet-road reflections. Prefer `cybercore.md` for data-night and `monumental-calm.md` for a single warm light in a cold world when the 80s reason is missing; see `kevin-taste` for why the classic variant fails his bar.
