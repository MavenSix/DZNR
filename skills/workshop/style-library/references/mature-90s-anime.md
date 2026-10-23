# Mature 90s Anime

**In one line:** grounded, adult cel animation in the late-80s and 90s cyberpunk lineage: body meets machine, cables and ports, dense hand-drawn line, muted colour with selective neon, and nothing cute.

**Family:** found in the research.
**Exemplified by:** Kevin's Cosmos Anime board (five saves: an Ex Machina poster with a mesh body and scattered mono labels, a manga-line hacker among tangled 90s hardware, a pencil cyborg wired into a ceiling panel, a desaturated cyborg wired to a desk, a teal-lit pilot's armoured glove). The lineage it points to is Ghost in the Shell, Akira and Patlabor; describe their qualities, never copy their frames or characters.

## Use it when / not when

- **Use when:** an author's world is manga-adjacent, cyberpunk or near-future and the pack chooses a drawn medium; DZNR character art needs a mature illustrated register; a story's theme is the body augmented, monitored or networked.
- **Not when:** the audience is young children, the brief wants modern moe, chibi or glossy mobile-game anime, or the pack is photographic. On an author world it is an option for a drawn pack, never imposed; on a QKI pack, `qki-style-authority` governs linework and this entry does not apply.

## Signature cues

- **Composition:** cinematic cel layouts: low or high angles, deep foreground objects (a cable bundle, a keyboard edge) framing the figure, heavy negative space in shadow, 2.39:1 or 16:9 for scenes, 2:3 for posters. Figures at three-quarter or from behind; faces partly lit. Technical detail concentrated where body joins machine.
- **Palette (muted, cool, one neon per frame):**

| Role | Name | Hex |
|---|---|---|
| Ground | Lilac-grey | #8E8A9C |
| Shadow | Graphite | #2A2930 |
| Midtone | Desaturated teal | #4F7C82 |
| Skin and highlight | Bone | #E6DED3 |
| Signal | Monitor cyan | #39D5E0 |
| Signal (alt) | Warning magenta | #E2367A |

- **Materials:** drawn, not rendered: ink line of varied weight (heavy contour, fine interior detail), flat cel fills with one hard-edged shadow tone, airbrushed glow only on screens, painted backgrounds with more texture than the characters. Subject matter: synthetic skin seams, ports at the nape, ribbon cables, CRTs, keyboards, wiring looms, armoured gloves, visors.
- **Light:** motivated sources only: monitor glow, a ceiling strip, a window at night. Strong single-source shadows, rim light in the neon colour. Slight film-cel grain and gate weave.
- **Type pairing (suggestions):** a condensed industrial sans for titles (Eurostile Extended or Microgramma for the period, or DIN Condensed); OCR-B or IBM Plex Mono for scattered technical labels; a Japanese gothic face (Noto Sans JP) only when the world is Japanese.
- **Motion:** limited animation on twos (12 drawings per second), held poses with only hair, cables or smoke moving, sharp cuts on the beat, slow pans across painted backgrounds, a camera shake only on impact. Never smooth 60fps interpolation.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Moe faces, huge eyes, chibi proportions | "Mature 1990s cel animation, adult proportions, realistic anatomy, restrained expressions" |
| Glossy 3D-ish shading, soft gradients on skin | "Flat cel colour, one hard-edged shadow tone, ink contour" |
| Neon everywhere | One neon signal per frame from a motivated source; the rest muted lilac and teal |
| Video model smooths the line into a 3D look | Image-to-video from an upscaled still; "preserve ink linework and flat cel colour, animate on twos" |
| Copying a famous frame or character | Describe qualities and theme; invent the character from the author's canon |
| Clean, empty sci-fi rooms | Density of hardware: cables, CRTs, keyboards, wiring looms, labels |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Mature 1990s cyberpunk cel animation still, {CHARACTER: adult, role, look from canon}, {POSE_AND_ACTION}, {CONNECTION: wired to a desk by ribbon cables at the nape | an armoured glove plugged into a console}, {SETTING} dense with {HARDWARE}, varied-weight ink linework, flat cel colour with one hard shadow tone, painted background, muted lilac-grey and desaturated teal, one {SIGNAL_COLOUR} glow from {LIGHT_SOURCE}, film-cel grain --niji 6 --ar {16:9 | 2:3} --style raw --s 100 --no chibi, moe, 3d render, glossy --sref {SREF_CODE} --sw {100-250}
```

### Still: natural language (Nano Banana, Higgsfield)

```text
Draw a still in the style of adult 1990s hand-drawn cel animation (not modern anime, nothing cute). Show {CHARACTER} {POSE_AND_ACTION}. Their body connects to machines: {CONNECTION}. The room is {SETTING}, crowded with {HARDWARE}. Use ink outlines of varied weight, flat colour with one hard-edged shadow, and a painted background. Keep the colours muted lilac-grey and teal; the only bright colour is the {SIGNAL_COLOUR} glow from {LIGHT_SOURCE}. Add a faint film grain. No 3D shading, no soft gradients.
```

Series line: attach the approved character still and say "Same character design, same line weight and cel shading, same palette. Change only {ONE_VARIABLE: the camera angle | the room | the pose}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 6-second, 16:9 image-to-video clip from the attached upscaled still, 2D hand-drawn cel animation, limited animation on twos. Preserve the character design, the ink linework, the flat cel colour fields and the painted background exactly. The character stays screen-left facing right; keep that axis. At 0-2 seconds hold the pose; only the cables sway and the monitor flickers. At 2-4 seconds the character's eyes shift to the monitor and a fine line of text scrolls on it. At 4-6 seconds a slow pan right across the hardware to the monitor, then hold. Sound: CRT whine, fan hum, one keyboard clack, a low synth pad entering at 4 seconds. No smoothing, no 3D shading, no extra characters, no text overlays.
```

Upscale the still first (Higgsfield's upscale tools, or Topaz via RunningHub), then animate with Kling, Seedance or Wan via Runway.

### UI or web section (structured brief)

```text
Build statement: a character dossier section for {CHARACTER} in a cel-anime world, {STACK}.
Tokens: Ground "Graphite" #2A2930, Surface "Lilac" #8E8A9C at 18 percent, Text "Bone" #E6DED3, Secondary rgba(230,222,211,0.62), Signal "Monitor cyan" #39D5E0 (status line and focus only), cards filled with soft shadow, no outline strokes.
Type: name Eurostile Extended 700 at clamp(36px, 5vw, 80px) uppercase tracking 0.04em; labels OCR-B 11px uppercase tracking 0.14em; body Inter Tight 16px line-height 1.55.
Layout: 12 columns, 24px gap, art spans 7 columns left, dossier 5 columns right, section padding clamp(80px, 10vw, 140px).
Copy: name "{NAME}"; epithet "{EPITHET}"; 4 dossier lines from canon ({AGE}, {AUGMENTS}, {AFFILIATION}, {LAST_SEEN}); a pull quote of 12 words or fewer from the author's text.
Device (one): the still loops a 2-second on-twos animation (hair and cables only) as a sprite sheet, 12fps.
Accessibility: art has alt text from canon, dossier is a description list, reduced motion shows the still, AA contrast on secondary text.
Performance: sprite sheet WebP under 400KB, lazy-loaded, LCP under 2.5s, CLS under 0.05.
```

### 3D / Three.js scene note

If the world runs live, keep it drawn: toon shading with a 2-step ramp and an inverted-hull or edge-detection ink outline (`threejs-shaders`, `threejs-postprocessing`), stepped animation sampled at 12fps (`threejs-animation`), painted textures on flat cards for backgrounds (`threejs-textures`). Never PBR on characters in this style.

## Gate notes

`quality-gate` checks this style hardest on: medium fidelity in motion (line and cel colour survive, on twos), adult proportions, one neon per frame, hardware density. On an author world the Fidelity Gate runs first (the drawn medium and the canon look); on QKI the Prime Gate governs. Sibling: `ink-cel-illustration` for the motion workflow.
