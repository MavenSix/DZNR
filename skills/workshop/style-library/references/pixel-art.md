# Pixel Art

**In one line:** images and interfaces built on a visible pixel grid with a limited palette, where every pixel is placed or quantised on purpose: lo-fi warmth, dot-matrix precision, or game-world nostalgia.

**Family:** Kevin's list.
**Exemplified by:** @pxdx.baddies (the lo-fi "UPLOAD FILES" slide of "Bento boxes in different UI styles": coral and lilac pixel cards over a rainy anime-sunset room, a pixel font), Nothing-style dot-matrix widgets and a "549 kHz" radio display saved on Kevin's Interface and Tech Cosmos boards (no creator handle recorded for those saves). @vnarshia's TP-7 concept uses an OLED pixel counter ("MEMO 00:11:76") as its one live detail.

## Use it when / not when

- **Use when:** a game or game-adjacent world, an on-device display (OLED, LCD, dot-matrix) inside an instrument-grade product, a lo-fi music or study brand, a playful upload or loading state, a Pulse OS story told as a retro game.
- **Not when:** the brief needs photographic credibility, fine typographic reading at length, or a luxury register. On an author world it is an option to offer, never a default.

## Signature cues

- **Composition:** a fixed logical resolution (320x180 or 256x144 for scenes, a 5x7 or 8x8 cell for type) scaled by whole integers only; one focal sprite; dithered gradients rather than smooth ones; a framing device (a window, a screen bezel) for lo-fi scenes.
- **Palette (limited, 8 to 16 colours, one signal):**

| Role | Name | Hex |
|---|---|---|
| Night | Ink indigo | #1B1A2E |
| Mid | Dusk violet | #4A3F6B |
| Light | Lilac | #B8A6D9 |
| Warm | Coral | #F27A6B |
| Highlight | Cream | #FFF1D6 |
| Display | Phosphor on black | #E8E8E8 on #000000 |
| Signal | Record red | #E8322A |

- **Materials:** pixels themselves; ordered (Bayer) dithering, a CRT scanline at 15 percent at most, LCD sub-pixel grid for device displays, rain as 1px diagonal streaks.
- **Light:** painted, not rendered: two to three light levels per sprite, rim pixels on the side facing the light source, no anti-aliasing.
- **Type pairing (suggestions):** Silkscreen, Press Start 2P or Pixelify Sans for display at integer sizes (8, 16, 24, 32px); Departure Mono or Doto for dot-matrix numerals; a clean sans (Inter Tight) for any body copy that must be read at length.
- **Motion:** stepped, at 8 to 12 frames per second; idle loops of 2 to 6 frames; counters that tick digit by digit; no tweened smoothing.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Fake pixel art with mixed pixel sizes | One logical resolution, integer scaling only, image-rendering: pixelated |
| Smooth gradients and anti-aliased edges | Ordered dithering, no anti-aliasing |
| Palette of 60 colours from a model | Quantise to the 8 to 16 colour palette after generation |
| Pixel fonts for paragraphs | Pixel type for labels and numerals; body in a clean sans |
| Tweened motion at 60fps | Stepped animation at 8 to 12fps |
| Scanlines, chromatic aberration and noise stacked | One degradation effect, at 15 percent at most |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Pixel art scene, {SCENE_SUBJECT}, 320x180 logical resolution, limited 12 colour palette of {PALETTE_WORDS e.g. ink indigo, dusk violet, lilac, coral, cream}, ordered dithering in the sky, crisp single-pixel edges, no anti-aliasing, {LIGHT_SOURCE} with rim pixels, one {SIGNAL_COLOUR} focal detail on {FOCAL_SPRITE}, lo-fi calm mood --ar 16:9 --style raw --s 100 --no blur, smooth gradient, anti-aliasing, text --sref {SREF_CODE} --sw {100-200}
```

After generation, downscale to the logical resolution, quantise to the palette, and upscale by an integer with nearest-neighbour.

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a pixel art picture of {SCENE_SUBJECT}. Use big, clear square pixels, all the same size, with no smoothing at the edges. Use only about twelve colours: {PALETTE_WITH_HEX}. Make the sky with a checkerboard dither, not a smooth gradient. The light comes from {LIGHT_SOURCE}. One small thing is {SIGNAL_COLOUR} ({SIGNAL_HEX}): the {FOCAL_SPRITE}. No writing, no blur.
```

For a series: attach the approved scene and say "Same pixel size, same palette, same dithering and light. Change only {ONE_VARIABLE: the room | the time of day | the focal sprite}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 4-second, 16:9 image-to-video clip from the attached still, 2D pixel art animation at 8 frames per second, stepped, no in-between smoothing. Preserve the pixel grid, the palette and every sprite exactly; no new colours. The camera is fixed. At 0-2 seconds rain falls as single-pixel diagonal streaks and the {LIGHT_SOURCE} flickers once. At 2-3 seconds the {FOCAL_SPRITE} plays a 4-frame idle loop. At 3-4 seconds a {SIGNAL_COLOUR} light on the {FOCAL_SPRITE} blinks on and holds. Sound: soft rain, a quiet lo-fi chord, one 8-bit blip when the light comes on. No blur, no anti-aliasing, no added text.
```

Check every frame for new colours or smoothing; quantise again if the model drifted.

### UI or web section (structured brief)

```text
Build statement: one upload or loading section for {PRODUCT}, lo-fi pixel style, {STACK}.
Tokens: Ground "Ink indigo" #1B1A2E, Surface "Dusk" #4A3F6B, Card "Lilac" #B8A6D9, Warm "Coral" #F27A6B, Text "Cream" #FFF1D6, Signal "Record" #E8322A (error state only), radius 0, cards with a 2px stepped pixel corner (clip-path polygon), separated by fill, no outline strokes, image-rendering: pixelated on all art.
Type: display Silkscreen at 32px or 48px (integer sizes only); labels Departure Mono 16px; body Inter Tight 16px / 1.6 for any sentence over eight words.
Layout: max width 960px, 8-column grid on an 8px base unit, 16px gap, backdrop scene as a 320x180 PNG scaled 4x.
Copy: label "UPLOAD FILES"; sub "{ONE_LINE}"; progress "{N} / {TOTAL}"; done "{DONE_LINE, e.g. 'Saved. Nothing lost.'}".
Device (one): a 12-cell segmented progress bar that fills cell by cell at 10fps steps, with a dot-matrix counter.
Accessibility: progress exposed as role="progressbar" with aria-valuenow, AA contrast (cream on indigo passes), focus ring 2px cream stepped, prefers-reduced-motion jumps the bar without stepping.
Performance: scene PNG under 60KB, pixel font subset under 20KB, LCP under 2.0s, CLS under 0.05.
```

### 3D / Three.js scene note

For a pixel world in the browser: render the scene to a low-resolution render target (320x180) with NearestFilter and upscale to the canvas, or use an orthographic camera with sprite sheets (`threejs-textures` for NearestFilter, `threejs-postprocessing` for a palette-quantise and Bayer-dither pass written with `threejs-shaders`). Keep animation stepped (`threejs-animation`, update at 10fps). Voxel variants model in Blender MCP. Check `threeui-catalog` for HUD pieces first.

## Gate notes

`quality-gate` checks this style hardest on: one pixel size (zoom 400 percent and look), palette count after quantising, no anti-aliasing, stepped motion, pixel type kept to labels. Pair with `instrument-grade-product.md` when the pixels live on a device display, and `fixing-accessibility` for reading load.
