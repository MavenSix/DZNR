# Ink and Cel Illustration

**In one line:** illustration that keeps its grit in motion: heavy ink line, flat cel fills, hard shadow shapes, print grain and graphic effects, animated on twos from an upscaled still so the video model never smooths it into generic 3D.

**Family:** found in the research.
**Exemplified by:** @bywaviboy (an animated short and its breakdown: build the whole world first, environments, poses and action shots, and upscale everything before motion; he names the failure as most AI video that "kills the grit, washes out the texture"). His piece borrows a famous living illustrator's look; DZNR takes the method and the qualities, never the borrowed style.

## Use it when / not when

- **Use when:** an author's pack declares a drawn medium and the world must move; a campaign or Pulse scene wants graphic punch; a comic, graphic novel or zine becomes motion; a short needs character sheets, environments and action beats built as one world.
- **Not when:** the pack is photographic or 3D-real, or the brief asks to imitate a named living artist or a franchise's look (decline that for client and author work and describe the qualities instead). On a QKI pack, `qki-style-authority` holds the linework law and wins over this entry; on an author world with a drawn pack, this entry serves the Fidelity Gate's medium-fidelity check.

## Signature cues

- **Composition:** graphic staging: strong silhouettes, characters cropped by frame edges, foreground objects in solid black, flat backgrounds or simplified environments; 9:16 or 16:9; boards shown as a collage grid when presenting.
- **Palette (saturated on near-black, a limited set per world):**

| Role | Name | Hex |
|---|---|---|
| Ground | Near-black | #151416 |
| Line | Ink | #0B0B0B |
| Paper | Newsprint | #EAE3D2 |
| Fill 1 | Acid green | #7BC043 |
| Fill 2 | Brick orange | #D9532B |
| Fill 3 | Mustard | #D9A332 |

Treat these as an example set: on an author world, the pack's palette replaces them. Keep any world to five fills or fewer.

- **Materials:** drawn: black ink contour with tapered weight, flat cel colour, one hard-edged shadow shape per form, smoke and fire drawn as white or flat graphic shapes, halftone or riso grain at 4 to 6 percent, slight misregistration on colour plates.
- **Light:** graphic, not physical: shadow shapes placed for design, a single rim of flat colour, no soft gradients, no bloom.
- **Type pairing (suggestions):** a heavy grotesk or condensed display for kinetic caption words (Druk Heavy, Anton, Obviously Compressed), slammed white on frame; a hand-lettered face or a custom one for titles; a typewriter or mono for credits (Courier Prime, Space Mono).
- **Motion:** on twos (12 drawings per second) or threes for weight; holds on key poses; smears and multiples on fast action; hard cuts on the beat; camera moves are pans and push-ins on the flat plane. Never 60fps interpolation, never a floating 3D camera.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| The video model smooths line and texture into soft 3D (the "kills the grit" failure) | Image-to-video from the upscaled still; "preserve ink linework, flat colour fields and print grain, animate on twos, no smoothing" |
| Animating from a low-resolution still | Upscale first: Higgsfield's upscale tools, or Topaz via RunningHub |
| Imitating a named living artist or a franchise | Describe line weight, fill, palette and attitude in your own words |
| Shots made one at a time with drifting designs | Build the world first: character sheets, environments, poses; every shot references them |
| Soft VFX smoke and glow | Smoke, fire and energy as flat graphic shapes in a palette colour |
| Too many colours | Five fills or fewer per world, on near-black or newsprint |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Comic illustration, {CHARACTER: design from the character sheet}, {ACTION} in {SETTING}, heavy black ink linework with tapered weight, flat cel colour, one hard-edged shadow shape per form, {PALETTE: up to five fills} on near-black, {EFFECT: smoke | sparks} drawn as flat white graphic shapes, riso print grain, slight colour misregistration --niji 6 --ar {9:16 | 16:9} --style raw --s 100 --no 3d render, soft shading, gradient, glow --sref {SREF_CODE} --sw {150-300}
```

Build the world pass first with the same suffix: a character sheet (front, side, back, three expressions), three environments, and six action poses.

### Still: natural language (Nano Banana, Higgsfield)

```text
Draw a comic-book illustration of {CHARACTER} {ACTION} in {SETTING}. Use thick black ink outlines that taper, flat areas of colour with one hard-edged shadow on each shape, and no soft shading or gradients. Colours: only {PALETTE} on a near-black background. Draw the {EFFECT} as flat white shapes, not realistic VFX. Add a fine printed-paper grain. Match the attached character sheet exactly.
```

Series line: attach the character sheet and the approved still and say "Same character design, same line weight, same palette and grain. Change only the shot to {NEXT_BEAT}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 5-second, 9:16 image-to-video clip from the attached upscaled illustration, 2D hand-drawn comic animation, 12fps on twos. Preserve the ink linework, the flat colour fields, the hard shadow shapes and the print grain exactly; hold linework and flat colour, no smoothing, no 3D shading. The character stays screen-right facing left. At 0-2 seconds hold the key pose; the smoke shape curls on twos. At 2-4 seconds {ACTION_BEAT: he flicks a card across the table} with a smear frame. At 4-5 seconds slow push-in on his face, then hold. Sound: room murmur, the card's snap at 3 seconds, a bass note on the hold. No camera orbit, no added characters, no text.
```

Animate with Kling, Seedance or Wan via Runway. Captions and kinetic words are set in the edit, not by the model.

### UI or web section (structured brief)

```text
Build statement: a character select section for an illustrated world, {STACK}.
Tokens: Ground "Near-black" #151416, Paper "Newsprint" #EAE3D2, Ink #0B0B0B, Fills "{FILL_1_NAME}" {FILL_1_HEX}, "{FILL_2_NAME}" {FILL_2_HEX}, Signal "{SIGNAL_NAME}" {SIGNAL_HEX} (selected state only); cards are flat newsprint fills with a 6px hard offset shadow in ink, no outline strokes, radius 0.
Type: names Druk Heavy at clamp(48px, 8vw, 140px) uppercase line-height 0.88; captions Space Mono 12px; body 16px line-height 1.5.
Layout: 12 columns, 16px gap, 3 character cards of 4 columns each, section padding clamp(72px, 9vw, 128px); riso grain overlay fixed, pointer-events none, 5 percent.
Copy: section "CHOOSE YOUR {ROLE}"; per card a name, an epithet of 6 words or fewer, two stats with real values; CTA "{CTA}".
Device (one): on hover or focus, the card's still swaps to a 1-second on-twos loop (sprite sheet, steps(12)).
Accessibility: cards are buttons with names as labels, focus shows the same loop, reduced motion keeps the still, AA contrast on mono captions.
Performance: sprite sheets WebP under 300KB each, loaded on first hover, LCP under 2.5s, CLS under 0.05.
```

### 3D / Three.js scene note

Only if the world must run live: toon shading with flat ramps, an ink outline pass (inverted hull or edge detection), a halftone or grain pass, and stepped animation at 12fps. Build with `threejs-shaders`, `threejs-postprocessing`, `threejs-animation`, `threejs-textures`. Usually the better answer is 2D: sprite sheets and layered flat planes with parallax.

## Gate notes

`quality-gate` checks this style hardest on: medium fidelity in motion (line, fills and grain survive frame by frame), upscale before animate recorded, world built before shots, five fills or fewer, no imitation of a named artist. On an author world the Fidelity Gate runs first; on QKI the Prime Gate. Sibling: `mature-90s-anime`.
