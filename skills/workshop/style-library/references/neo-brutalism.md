# Neo-Brutalism

**In one line:** loud, honest structure: heavy grotesk type at extreme scale contrast, flat saturated blocks, visible frames and cut corners, so the layout itself becomes the brand voice.

**Family:** Kevin's list.
**Exemplified by:** @pxdx.baddies (the SASSY music slide of "Bento boxes in different UI styles": Swiss red and black poster type over a motion-blur backdrop), @vnarshia (the Work Louder x Figma Creator Micro concept: thin 300-weight caps against heavy 800-weight caps, a grey highlight block behind one word, inline glyph punctuation), Ledger Stax at brand.ledger.com/ledger-stax (chamfered cut-corner HUD frames), the Kasane template on aura.build (outlined display words such as "YOUR" in "LEAVE / YOUR / MARK.").

For raw mechanical interfaces, Swiss industrial print or terminal telemetry, `industrial-brutalist-ui` already owns the build rules; this entry adds the image, motion and prompt side and the louder poster register.

## Use it when / not when

- **Use when:** a music, fashion, culture or developer brand needs attitude; a campaign needs to be read from across a room; a portfolio wants its type to do the work; an in-world interface wants chamfered frames.
- **Not when:** the content is long-form reading, the audience is anxious (health, money), or the brief is quiet luxury. On an author world it is an option to offer, never a default.

## Signature cues

- **Composition:** a visible grid of 12 columns with 0 to 16px gaps; one word set at 200 to 320px that bleeds off an edge; blocks of flat colour aligned hard to the grid; one rotated or offset element at most; chamfered (cut-corner) frames at 12px for HUD variants.
- **Palette (paper, ink, one or two flat signals):**

| Role | Name | Hex |
|---|---|---|
| Ground | Newsprint | #F2EFE8 |
| Ink | Black | #0B0B0B |
| Signal 1 | Poster red | #E5261F |
| Signal 2 (optional) | Neon lime | #E4FF1A |
| Block | Cobalt | #4B5BF0 |
| Highlight bar | Concrete grey | #CFCFCF |

- **Materials:** flat print, halftone dots, photocopy grain, stencil cuts, hard offset shadows (4px 4px 0 #0B0B0B) where depth is wanted, motion-blurred photography as the only soft element.
- **Light:** flat; photography high-contrast black and white or one-colour duotone.
- **Type pairing (suggestions):** a heavy grotesk (Neue Haas Grotesk Display Black, Druk Wide, or Archivo Black) at mixed weights in one lockup; a mono (JetBrains Mono or Space Mono) for meta labels; outline type via a 1.5px stroke on the display face only.
- **Motion:** hard cuts and snaps, not fades: blocks slide in 120 to 200ms with a steep ease (cubic-bezier(.9,0,.1,1)); one marquee line with a solid word plus an outlined word, as Kasane's "THE GODS ARE OFFLINE. THE GHOSTS ARE NOT."

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Brutalism as random mess | Keep a strict 12-column grid; break it once, on purpose |
| Thick black outlines on every card and pill | Outlines belong to type and frames; in DZNR OS product chrome cards use fill plus soft shadow (decision 218) |
| Five saturated colours fighting | Paper, ink, one signal, one optional second |
| Mixed weights with no hierarchy | Two weights only per lockup (300 and 800), the heavy one carries the key word |
| Soft gradients and glass | Flat fills, halftone, hard offset shadow |
| Unreadable contrast for effect | AA minimum on every text pair; drama comes from scale, not low contrast |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Neo-brutalist poster for {SUBJECT}, giant heavy grotesk word "{WORD}" bleeding off the right edge, mixed light and black weights, flat {SIGNAL_COLOUR} block aligned to a visible grid, black and white high-contrast photograph of {IMAGE_SUBJECT} with horizontal motion blur, halftone dots, photocopy grain, newsprint off-white ground, hard offset shadow on one block, Swiss poster composition --ar {4:5 | 2:3} --raw --s 75 --no gradient, glass, glow, 3D --sref {SREF_CODE} --sw {100-200}
```

For Midjourney V8.2, the full set for this style (hero still, series variant, Edit Model instruction for the series, video beat and a filled example) is in `midjourney-legendary` (`references/library-styles.md`, Neo-Brutalism), with the parameter recipes and Kevin's sref library.

Set the real words by hand in the type layer; use the generated poster as the backdrop and texture.

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a bold poster background for {SUBJECT}. Use an off-white newsprint paper colour ({GROUND_HEX}), black ({INK_HEX}), and one flat {SIGNAL_COLOUR} ({SIGNAL_HEX}). Put a black and white photograph of {IMAGE_SUBJECT} with strong sideways motion blur in the left half. Add a flat {SIGNAL_COLOUR} rectangle aligned to an invisible grid on the right, with a hard black shadow offset down and right. Add halftone dots and photocopy grain. No gradients, no glass, no glow. Leave the top 40 percent empty for very large type. Do not write any words.
```

For a series: attach the approved poster and say "Same grid, same paper, same grain, same signal colour. Change only {ONE_VARIABLE: the photograph | the block position | the second colour}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 5-second, {9:16 | 1:1} image-to-video clip from the attached poster, flat graphic motion design. Preserve the grid, paper texture, halftone, palette and photograph exactly. The camera is locked off. At 0-1 seconds the {SIGNAL_COLOUR} block snaps in from the right edge in a hard cut, no easing blur. At 1-3 seconds the photograph's motion blur streaks drift left, slowly. At 3-4 seconds the block jolts 8 pixels on the beat. At 4-5 seconds everything holds. Sound: one hard kick drum on each snap, a short tape-stop at the end. No fades, no glow, no added text.
```

### UI or web section (structured brief)

```text
Build statement: one hero section for {BRAND}, neo-brutalist poster style, {STACK}.
Tokens: Ground "Newsprint" #F2EFE8, Ink "Black" #0B0B0B, Signal "Poster red" #E5261F, Accent "Lime" #E4FF1A (cart dot only), Highlight "Concrete" #CFCFCF, radius 0, hard shadow 4px 4px 0 #0B0B0B on the primary block only; cards and pills inside product UI use fill, not strokes.
Type: display Archivo Black at clamp(72px, 16vw, 280px), tracking -0.04em, leading 0.85, mixed with Archivo 300 for the light words; outline words as -webkit-text-stroke 1.5px #0B0B0B with transparent fill; labels Space Mono 12px uppercase tracking 0.1em.
Layout: max width none (full bleed), 12 columns, 0 gap, visible 1px grid lines at 8 percent ink, section padding clamp(48px, 6vw, 96px).
Copy: lockup "{LIGHT_WORD} {HEAVY_WORD}" with a concrete highlight bar behind "{KEY_WORD}"; marquee "{SOLID_LINE}" + "{OUTLINED_LINE}"; CTA "{CTA_LABEL}".
Device (one): a marquee band in the signal colour, 40s loop, pauses on hover.
Accessibility: AA contrast on every pair (black on newsprint, black on red checked), outlined words never carry essential meaning alone, 2px black focus ring with 2px offset, prefers-reduced-motion stops the marquee.
Performance: one variable font file under 120KB, no images above the fold except one AVIF under 200KB, LCP under 2.5s, CLS under 0.05.
```

### 3D / Three.js scene note

Rarely 3D. When needed: flat-shaded MeshBasicMaterial blocks with no lighting, an orthographic camera, extruded type from a heavy grotesk (`threejs-geometry` TextGeometry), hard snap animation with stepped easing (`threejs-animation`), and a halftone pass (`threejs-postprocessing` or `threejs-shaders`). Chamfered HUD frames for a game-world variant are cheaper in CSS clip-path than in WebGL; check `threeui-catalog` first.

## Gate notes

`quality-gate` checks this style hardest on: grid present and broken once, two weights per lockup, palette count, AA contrast, no outline strokes on product cards (decision 218). Build rules for dashboards and blueprint layouts: `industrial-brutalist-ui`. For bolder claims, `bolder`; for type systems, `typeset`.
