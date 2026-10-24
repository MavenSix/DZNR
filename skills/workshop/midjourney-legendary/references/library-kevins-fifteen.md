# The library: Kevin's fifteen

Five prompts per style: a hero still, a series variant (one variable changed), the Edit Model instruction
that holds the series, a Midjourney video beat, and a filled example grounded in the research. Cues, hex
and anti-patterns live in the style's `style-library` entry; this file is its V8.2 prompt set.

Slots are in braces. `{SREF}` is `--sref <code> --sw <weight>` from the pack, or nothing. `{P}` is
`--p 94b2bfcd-291e-4745-8ac6-a07a7c643e0b` (Kevin's profile) on DZNR's own work and QKI, the author's own `{profile}` from the approved
pack on an author world, or nothing. `{SEED}` is the locked hero's seed. On an author world every slot comes
from the approved pack and canon; on DZNR's own work, from `kevin-taste`. Every video beat starts from the
approved still, in HD where the plan allows.

---

## Claymorphism

**Entry:** `style-library/references/claymorphism.md`. **Recipe:** editorial restraint, `--raw --s 100`.
**Sref:** none of Kevin's characterised codes is a soft clay look; `{SREF}` takes a pack's own code.

### Hero still

```text
A soft clay render of {SUBJECT} as the hero, {SECONDARY_OBJECTS} resting on two depth planes behind it, matte clay forms with rounded inflated mass and gentle subsurface glow, milky translucent resin details on {RESIN_PART}, a palette of {CLAY_1} and {CLAY_2} on an {GROUND_COLOUR} ground with one {SIGNAL_COLOUR} accent on {SIGNAL_PART}, large soft area light from the top left with a warm bounce from below, ambient occlusion in every crease, a soft contact shadow, the subject in the right two-fifths and the left half empty for type --ar 4:5 --raw --s 100 --v 8.2 --no gloss, outline, text, neon, chrome {SREF} {P}
```

### Series variant

One variable: the subject. Same ground, light, palette roles and framing.

```text
A soft clay render of {NEXT_SUBJECT} as the hero, in the same set, the same matte clay with gentle subsurface glow, the same {CLAY_1} and {CLAY_2} on {GROUND_COLOUR} with one {SIGNAL_COLOUR} accent on {SIGNAL_PART}, the same large soft light from the top left and warm bounce from below, soft contact shadow, the subject in the right two-fifths and the left half empty --ar 4:5 --raw --s 100 --v 8.2 --seed {SEED} --no gloss, outline, text, neon, chrome {SREF} {P}
```

### Edit Model instruction

References: 1, the locked hero; 2, a photo of the next subject (shape only).

```text
Keep the clay material, the subsurface glow, the palette, the soft top-left light, the contact shadow and the framing of the first image exactly. Replace the hero with the object in the second image, rebuilt as soft matte clay with rounded mass. Change nothing else. --raw --v 8.2
```

### Video beat

```text
The clay hero settles with a slow soft squash and recovers, the small objects behind it bob once on their planes, locked-off camera, the light does not change --motion low --raw --loop --bs 1
```

### Filled example

Grounded in @pxdx.baddies's ramen world (one of the seven bentos: a clay ramen bowl in sage green and dusty pink).

```text
A soft clay render of a bowl of ramen as the hero, a pair of chopsticks and a folded napkin resting on two depth planes behind it, matte clay forms with rounded inflated mass and gentle subsurface glow, a milky translucent resin soft-boiled egg, a palette of sage and dusty pink on an oat ground with one broth-amber accent in the broth, large soft area light from the top left with a warm bounce from below, ambient occlusion in every crease, a soft contact shadow, the bowl in the right two-fifths and the left half empty for type --ar 4:5 --raw --s 100 --v 8.2 --no gloss, outline, text, neon, chrome
```

---

## Cybercore

**Entry:** `style-library/references/cybercore.md`. **Recipe:** maximal density held legible,
`--s 250`, `--c 10`, no `--raw` unless the labels drift. **Sref:** none by default; `{SREF}` slot.

### Hero still

```text
A data visualisation still of {SYSTEM_SUBJECT}: {N} glowing point-cloud clusters in {ENTITY_COLOUR} with {SYSTEM_ACCENT} rim particles, each cluster one {ENTITY}, thin white connecting lines at low opacity that glow where they are dense, tiny amber monospace labels on the nodes with the words "{LABEL_1}" and "{LABEL_2}", a near-black void, a slow orbital three-quarter view with shallow depth of field, fine film grain, a strip of five small instrument panels along the bottom edge, one caption-safe band across the top --ar 16:9 --s 250 --c 10 --v 8.2 --no purple gradient, lens flare, lorem text {SREF} {P}
```

### Series variant

One variable: the state of the system (calm, busy, the clash).

```text
The same data visualisation of {SYSTEM_SUBJECT} with the same {N} clusters in {ENTITY_COLOUR} and {SYSTEM_ACCENT} rim particles, now {STATE: two clusters pulled together, the lines between them thick and bright, one node flashing clash red}, the same amber monospace labels, the same near-black void and orbital three-quarter view, the same instrument strip along the bottom --ar 16:9 --s 250 --c 0 --v 8.2 --seed {SEED} --no purple gradient, lens flare, lorem text {SREF} {P}
```

### Edit Model instruction

References: 1, the locked hero.

```text
Keep every cluster, colour, label, the void and the camera of this image. Make the two clusters on the left pull toward each other, thicken the lines between them, and turn the node where they meet clash red. Change nothing else. --v 8.2
```

### Video beat

```text
The camera orbits slowly a few degrees to the right, the point clouds breathe, light runs along the connecting lines toward the red node, the labels stay sharp and still --motion low --raw --bs 1
```

### Filled example

Grounded in @atsmatrix's blast radius and @jtansill's Brain Monitor, with the lesson attached: the idea must be labelled in the frame.

```text
A data visualisation still of five AI agents sharing one login: five glowing point-cloud clusters in coral with cyan rim particles, each cluster one agent, thousands of thin white connecting lines at low opacity that glow where they are dense, tiny amber monospace labels on the nodes with the words "inbox triage" and "invoice run", a near-black void, a slow orbital three-quarter view with shallow depth of field, fine film grain, a strip of five small instrument panels along the bottom edge, one caption-safe band across the top --ar 16:9 --s 250 --c 10 --v 8.2 --no purple gradient, lens flare, lorem text
```

---

## Neo-Brutalism

**Entry:** `style-library/references/neo-brutalism.md`. **Recipe:** editorial restraint at high contrast,
`--raw --s 75`. **Sref:** none; `{SREF}` slot. The giant word is set in the type layer; the frame leaves
its space.

### Hero still

```text
A neo-brutalist poster plate for {SUBJECT}: a flat {SIGNAL_COLOUR} block aligned to a visible grid of black rules, a black and white high-contrast photograph of {IMAGE_SUBJECT} with horizontal motion blur cut into a hard rectangle, halftone dots and photocopy grain, a newsprint off-white ground, a hard black offset shadow under one block, a cut corner on the photograph, the right half left empty for a giant heavy grotesk word set later --ar 4:5 --raw --s 75 --v 8.2 --no gradient, glass, glow, 3d, text {SREF} {P}
```

### Series variant

One variable: the photograph's subject. Grid, block and ground fixed.

```text
The same neo-brutalist poster plate: the same flat {SIGNAL_COLOUR} block on the same visible grid of black rules, now a black and white high-contrast photograph of {NEXT_IMAGE_SUBJECT} with horizontal motion blur in the same hard rectangle, the same halftone and photocopy grain on newsprint off-white, the same hard offset shadow and cut corner, the right half empty --ar 4:5 --raw --s 75 --v 8.2 --seed {SEED} --no gradient, glass, glow, 3d, text {SREF} {P}
```

### Edit Model instruction

References: 1, the locked plate; 2, the new photograph.

```text
Keep the grid, the {SIGNAL_COLOUR} block, the newsprint ground, the halftone, the offset shadow and the empty right half of the first image. Put the second image into the photograph rectangle as a black and white high-contrast print with horizontal motion blur. Change nothing else. --raw --v 8.2
```

### Video beat

```text
The halftone photograph inside its rectangle slides a short way to the left in one hard step and stops, the block and the grid do not move, photocopy grain flickers, locked camera --motion low --raw --bs 1
```

### Filled example

Grounded in @pxdx.baddies's SASSY music bento (Swiss red and black poster type over a mono motion-blur photograph).

```text
A neo-brutalist poster plate for a small music label: a flat poster-red block aligned to a visible grid of black rules, a black and white high-contrast photograph of a drummer mid-strike with horizontal motion blur cut into a hard rectangle, halftone dots and photocopy grain, a newsprint off-white ground, a hard black offset shadow under the red block, a cut corner on the photograph, the right half left empty for a giant heavy grotesk word set later --ar 4:5 --raw --s 75 --v 8.2 --no gradient, glass, glow, 3d, text
```

---

## Scrapbook

**Entry:** `style-library/references/scrapbook.md`. **Recipe:** anti-sheen realism, `--raw --s 50`.
**Sref:** none; `{SREF}` slot. Handwriting, arrows and circled labels are added by hand afterwards.

### Hero still

```text
An overhead photograph of a design scrapbook board on kraft paper: {N} printed frames of {WORK_SUBJECT} at different sizes, each slightly rotated, held with torn masking tape and one paper clip, one large hero frame among them, contact-sheet borders on the prints, pencil grid marks on the kraft, soft window daylight from above, small shadows under lifted paper edges, open kraft in the gutters left clear for annotation, a flat neutral grade --ar 4:5 --raw --s 50 --v 8.2 --no text, letters, stickers, vignette {SREF} {P}
```

### Series variant

One variable: the work pinned to the board. Board, tape and light fixed.

```text
The same overhead photograph of the same kraft-paper scrapbook board, now {N} printed frames of {NEXT_WORK_SUBJECT} at different sizes, each slightly rotated, the same torn masking tape and paper clip, one large hero frame, contact-sheet borders, pencil grid marks, the same soft window daylight and small shadows under lifted edges, the gutters clear --ar 4:5 --raw --s 50 --v 8.2 --seed {SEED} --no text, letters, stickers, vignette {SREF} {P}
```

### Edit Model instruction

References: 1, the locked board; 2 to 4, the frames to pin.

```text
Keep the kraft board, the tape, the paper clip, the pencil grid, the daylight and the clear gutters of the first image. Replace the printed frames with the images in references 2, 3 and 4, printed with contact-sheet borders and slightly rotated, the second image as the large hero frame. Change nothing else. --raw --v 8.2
```

### Video beat

```text
A slow overhead push-in toward the hero frame, one taped corner lifts slightly in a breath of air and settles, daylight steady, nothing else moves --motion low --raw --bs 1
```

### Filled example

Grounded in @kreevslab's annotated workflow carousel (frames with hand-drawn arrows and circled labels as the human layer).

```text
An overhead photograph of a design scrapbook board on kraft paper: seven printed frames of one desert character in different shots and ratios, each slightly rotated, held with torn masking tape and one paper clip, one large hero frame of the full-body shot among them, contact-sheet borders on the prints, pencil grid marks on the kraft, soft window daylight from above, small shadows under lifted paper edges, open kraft in the gutters left clear for annotation, a flat neutral grade --ar 4:5 --raw --s 50 --v 8.2 --no text, letters, stickers, vignette
```

---

## Surrealism

**Entry:** `style-library/references/surrealism.md`. **Recipe:** editorial restraint with conviction,
`--raw --s 100`. **Sref:** none by default; `{SREF}` slot.

### Hero still

```text
A surreal campaign photograph arguing {THESIS}: {FIGURE} with the face hidden, standing at the edge of a perfect circular portal cut into {TERRAIN_A}, and through the circle {TERRAIN_B} lit by the same sun at the same angle, {MATERIAL_DETAILS}, the figure small against a vast landscape, natural {LIGHT_TIME} light with a warm and cool split, medium format, crisp fabric texture, a muted earth palette of {EARTH_HUES} with one {ACCENT_COLOUR} element, the top third of sky empty --ar 4:5 --raw --s 100 --v 8.2 --no melting, floating eyes, extra limbs, text {SREF} {P}
```

### Series variant

One variable: the terrain seen through the portal.

```text
The same surreal campaign photograph: the same hidden-face figure at the same circular portal cut into {TERRAIN_A}, but through the circle now {NEXT_TERRAIN_B} under the same sun angle, the same warm and cool split, the same muted earth palette and one {ACCENT_COLOUR} element, the figure small, the sky empty --ar 4:5 --raw --s 100 --v 8.2 --seed {SEED} --no melting, floating eyes, extra limbs, text {SREF} {P}
```

### Edit Model instruction

References: 1, the locked hero; 2, the new terrain.

```text
Keep the figure, the costume, the portal's edge, the foreground terrain, the light and the palette of the first image. Fill the inside of the circle with the landscape in the second image, relit to match the same sun direction. Change nothing else. --raw --v 8.2
```

### Video beat

```text
Wind moves the figure's hood and a thin drift of sand crosses the portal's edge, through the circle clouds move slowly, the camera pushes in a few percent, nothing melts or morphs --motion low --raw --bs 1
```

### Filled example

Grounded in @ovyonlabs's ASEMIC thesis, "the body as terrain" (study of the method, credited; DZNR's own work writes its own thesis).

```text
A surreal campaign photograph arguing that the body is terrain: a faceless figure in a hooded mustard technical suit standing at the edge of a perfect circular portal cut into a rust-orange mineral ridge, and through the circle a snowfield at blue hour lit by the same sun at the same angle, water beading on the shell fabric, a backpack with taped seams, the figure small against a vast landscape, a warm and cool split, medium format, crisp fabric texture, a muted palette of rust, basalt grey and chalk with one dusty mauve label, the top third of sky empty --ar 4:5 --raw --s 100 --v 8.2 --no melting, floating eyes, extra limbs, text
```

---

## Y2K Aesthetic

**Entry:** `style-library/references/y2k.md` (DZNR's sober translucent-tech variant). **Recipe:**
anti-sheen realism, `--raw --s 50`. **Sref:** none; `{SREF}` slot.

### Hero still

```text
A product catalogue photograph of {OBJECT}, a {YEAR} consumer device that never shipped, a translucent {SHELL_COLOUR} polycarbonate shell showing the green circuit board, a ribbon cable and the screws inside, frosted silicone grips, brushed chrome trim, one {SIGNAL_COLOUR} button, tiny printed legends with the words "{LEGEND}", {WEAR_CUE}, three-quarter view on a seamless white sweep, a soft key light and a backlight glowing through the shell, a soft contact shadow, medium format, 80mm, f/11, fine grain, the top third empty --ar 4:5 --raw --s 50 --v 8.2 --no bubbles, sparkles, chrome gradient text, neon {SREF} {P}
```

### Series variant

One variable: the shell colourway.

```text
The same product catalogue photograph of the same {OBJECT}, now in a translucent {NEXT_SHELL_COLOUR} polycarbonate shell, the same visible circuit board, ribbon cable and screws, the same frosted grips, chrome trim and one {SIGNAL_COLOUR} button, the same legends and wear, the same three-quarter view, white sweep, backlight through the shell and contact shadow --ar 4:5 --raw --s 50 --v 8.2 --seed {SEED} --no bubbles, sparkles, chrome gradient text, neon {SREF} {P}
```

### Edit Model instruction

References: 1, the locked hero.

```text
Keep the device, its internals, its legends, its wear, the view and the light of this image exactly. Change only the shell to translucent {NEXT_SHELL_COLOUR} polycarbonate, still showing the board through it. --raw --v 8.2
```

### Video beat

```text
The backlight behind the device slowly brightens so the circuit board glows through the shell, the {SIGNAL_COLOUR} button clicks down once and comes back up, locked-off camera --motion low --raw --bs 1
```

### Filled example

Grounded in Kevin's Tech board (a blue Watchman pocket TV, translucent tech) and @an_improbable_future's clear smoke-plastic handhelds.

```text
A product catalogue photograph of a pocket television, a 1999 consumer device that never shipped, a translucent frosted ice-blue polycarbonate shell showing the green circuit board, a ribbon cable and the screws inside, frosted silicone grips, brushed chrome trim, one orange power button, tiny printed legends with the words "CH" and "VOL", a scuffed corner and a sun-faded label on the back, three-quarter view on a seamless white sweep, a soft key light and a backlight glowing through the shell, a soft contact shadow, medium format, 80mm, f/11, fine grain, the top third empty --ar 4:5 --raw --s 50 --v 8.2 --no bubbles, sparkles, chrome gradient text, neon
```

---

## Pixel Art

**Entry:** `style-library/references/pixel-art.md`. **Recipe:** `--raw --s 100`; consider `--tile` only
for a pattern, and never upscale a tile. **Sref:** none; `{SREF}` slot.

### Hero still

```text
A pixel art scene of {SCENE_SUBJECT} at 320 by 180 logical resolution, a limited twelve-colour palette of {PALETTE_WORDS}, ordered dithering in the sky, crisp single-pixel edges with no anti-aliasing, {LIGHT_SOURCE} with rim pixels on the figures, one {SIGNAL_COLOUR} focal detail on {FOCAL_SPRITE}, a calm lo-fi mood, the lower band of the frame quiet for a caption --ar 16:9 --raw --s 100 --v 8.2 --no blur, smooth gradient, anti-aliasing, text {SREF} {P}
```

### Series variant

One variable: the time of day.

```text
The same pixel art scene of {SCENE_SUBJECT} at the same 320 by 180 resolution, the same twelve-colour palette and dithering, now at {NEXT_TIME}, {NEXT_LIGHT_SOURCE} with rim pixels, the same {SIGNAL_COLOUR} focal detail on {FOCAL_SPRITE}, crisp single-pixel edges, the lower band quiet --ar 16:9 --raw --s 100 --v 8.2 --seed {SEED} --no blur, smooth gradient, anti-aliasing, text {SREF} {P}
```

### Edit Model instruction

References: 1, the locked scene.

```text
Keep the pixel grid, the palette, every sprite and the composition of this image exactly. Change only the time to {NEXT_TIME}: relight the sky with ordered dithering and move the rim pixels to the new light. No anti-aliasing. --raw --v 8.2
```

### Video beat

```text
Rain falls in single-pixel streaks, the window light flickers once, the cat's tail moves in two frames, the camera does not move, the pixels stay hard-edged --motion low --raw --loop --bs 1
```

### Filled example

Grounded in @pxdx.baddies's lo-fi bento ("UPLOAD FILES", coral and lilac over a rainy anime-sunset room).

```text
A pixel art scene of a small bedroom studio on a rainy evening at 320 by 180 logical resolution, a desk with a laptop and a sleeping cat, a limited twelve-colour palette of ink indigo, dusk violet, lilac, coral and cream, ordered dithering in the sunset sky outside the window, crisp single-pixel edges with no anti-aliasing, the sunset with rim pixels on the cat and the desk, one record-red focal detail on the laptop's power light, a calm lo-fi mood, the lower band of the frame quiet for a caption --ar 16:9 --raw --s 100 --v 8.2 --no blur, smooth gradient, anti-aliasing, text
```

---

## Synthwave

**Entry:** `style-library/references/synthwave.md` (DZNR's sober variant: one sodium or magenta signal on
near-black, no grid sunset). **Recipe:** `--raw --s 100`, `--ar 21:9`. **Sref:** Kevin's `1226151696`
(darker nocturnal, high-contrast silhouette, cool cast): the night and the silhouette are the code's; the
single warm signal is written in the text, so the cool cast does not swallow it.

### Hero still

```text
A cinematic night film still of {SUBJECT} on a wet empty road at {PLACE}, the camera low near the asphalt, {SIGNAL_LIGHT} as the only light family, deep reflections on the wet road, a glossy {OBJECT_FINISH}, a light haze with halation on the highlights, a slight anamorphic flare on the brightest lamp only, a near-black sky, the silhouette of the subject hard against the haze, 35mm anamorphic, fine film grain, the upper third dark for a title --ar 21:9 --raw --s 100 --v 8.2 --sref 1226151696 --sw 200 --no grid, sunset, palm trees, purple gradient, chrome text {P}
```

### Series variant

One variable: the place along the road.

```text
The same cinematic night film still of {SUBJECT} on a wet empty road, now at {NEXT_PLACE}, the same low camera, the same {SIGNAL_LIGHT} as the only light family, the same deep reflections, haze and halation, the same hard silhouette, 35mm anamorphic, fine grain, the upper third dark --ar 21:9 --raw --s 100 --v 8.2 --seed {SEED} --sref 1226151696 --sw 200 --no grid, sunset, palm trees, purple gradient, chrome text {P}
```

### Edit Model instruction

References: 1, the locked still.

```text
Keep the subject, its silhouette, the wet road, the sodium light and the camera of this image. Move the scene to {NEXT_PLACE}: change only the buildings and lamps beside the road, lit by the same sodium light. A near-black night, cool shadows, one warm light family. --raw --v 8.2 --sref 1226151696 --sw 200
```

### Video beat

```text
The subject glides slowly forward out of frame left, the sodium lamps slide across its glossy surface, reflections ripple on the wet road, haze drifts, the camera stays low and still --motion low --raw --bs 1
```

### Filled example

Grounded in @designchapel's anti-gravity racer frames (used hardware in fog), moved to DZNR's sober night variant.

```text
A cinematic night film still of a scuffed anti-gravity racer with chipped paint and sponsor-free panels hovering over a wet empty runway at an old airfield, the camera low near the asphalt, sodium street lamps as the only light family, deep reflections on the wet concrete, a glossy enamel hull, a light haze with halation on the highlights, a slight anamorphic flare on the brightest lamp only, a near-black sky, the silhouette of the racer hard against the haze, 35mm anamorphic, fine film grain, the upper third dark for a title --ar 21:9 --raw --s 100 --v 8.2 --sref 1226151696 --sw 200 --no grid, sunset, palm trees, purple gradient, chrome text
```

---

## Glassmorphism

**Entry:** `style-library/references/glassmorphism.md`. **Recipe:** anti-sheen realism, `--raw --s 100`.
**Sref:** none; `{SREF}` slot.

### Hero still

```text
A studio product photograph of {HERO_OBJECT_OR_BACKDROP} behind two frosted acrylic panels, the panels blurring and slightly refracting the {BACKDROP_TEXTURE} behind them, a one-pixel bright inner edge on each panel, a faint thin-film iridescent fringe on one edge only, an {GROUND_COLOUR} field, one {SIGNAL_COLOUR} accent on {SIGNAL_PART}, soft area light from the top left, no glow and no neon, 85mm, f/5.6, the right third clear for type --ar 16:9 --raw --s 100 --v 8.2 --no bloom, lens flare, text {SREF} {P}
```

### Series variant

One variable: the backdrop behind the glass.

```text
The same studio product photograph with the same two frosted acrylic panels, now blurring and refracting {NEXT_BACKDROP_TEXTURE} behind them, the same bright inner edges and the one iridescent fringe, the same {GROUND_COLOUR} field and {SIGNAL_COLOUR} accent, the same soft top-left light, 85mm, f/5.6, the right third clear --ar 16:9 --raw --s 100 --v 8.2 --seed {SEED} --no bloom, lens flare, text {SREF} {P}
```

### Edit Model instruction

References: 1, the locked hero; 2, the new backdrop.

```text
Keep both glass panels, their edges, their positions, the light and the camera of the first image. Replace what lies behind the glass with the texture in the second image, blurred and slightly refracted through the frosted acrylic. No glow. --raw --v 8.2
```

### Video beat

```text
The camera slides slowly to the right so the backdrop shifts behind the frosted panels and the refraction bends with it, the inner edges catch the light once, no glow --motion low --raw --bs 1
```

### Filled example

Grounded in @pxdx.baddies's SAFE-CORE bento (frosted glass over a quilted grey satin pillow with gold studs).

```text
A studio product photograph of a quilted grey satin pillow with gold studs behind two frosted acrylic panels, the panels blurring and slightly refracting the satin quilting behind them, a one-pixel bright inner edge on each panel, a faint thin-film iridescent fringe on one edge only, an obsidian field, one acid-lime accent on a small status light, soft area light from the top left, no glow and no neon, 85mm, f/5.6, the right third clear for type --ar 16:9 --raw --s 100 --v 8.2 --no bloom, lens flare, text
```

---

## Neumorphism

**Entry:** `style-library/references/neumorphism.md` (a few moulded controls, never a whole interface).
**Recipe:** anti-sheen realism, `--raw --s 50`. **Sref:** none; `{SREF}` slot.

### Hero still

```text
A top-down product photograph of {DEVICE_OR_PANEL}, a single moulded {SURFACE_COLOUR} matte ABS surface with {CONTROLS: each control and what it sets} raised from the same material, one control pressed in, soft light from the upper left making paired soft highlights and shadows, one {SIGNAL_COLOUR} {SIGNAL_PART}, printed legends in tiny grey sans with the words "{LEGEND}", a faint fingerprint on the pressed control, studio, 100mm, f/8 --ar 4:5 --raw --s 50 --v 8.2 --no glossy, chrome, neon {SREF} {P}
```

### Series variant

One variable: which control is pressed.

```text
The same top-down product photograph of the same moulded {SURFACE_COLOUR} matte ABS panel with the same raised controls and printed legends, now {NEXT_CONTROL} pressed in and the others raised, the same soft upper-left light and paired shadows, the same {SIGNAL_COLOUR} {SIGNAL_PART}, studio, 100mm, f/8 --ar 4:5 --raw --s 50 --v 8.2 --seed {SEED} --no glossy, chrome, neon {SREF} {P}
```

### Edit Model instruction

References: 1, the locked hero.

```text
Keep the panel, its material, every control, the legends and the light of this image. Raise the control that is pressed and press {NEXT_CONTROL} in instead, with the shadows changed to match. Change nothing else. --raw --v 8.2
```

### Video beat

```text
A fingertip enters from the bottom edge, presses the {SIGNAL_COLOUR} control down into the surface and lifts away, the control springs back, locked top-down camera --motion low --raw --bs 1
```

### Filled example

Grounded in Kevin's Interface and Sound boards (a voice recorder with a red concentric record button) and @vnarshia's one-red restraint.

```text
A top-down product photograph of a pocket voice recorder's control face, a single moulded bone matte ABS surface with a large round record button, a stop key, a level dial with a 0 to 10 scale and a hold slider raised from the same material, the stop key pressed in, soft light from the upper left making paired soft highlights and shadows, one record-red ring around the record button, printed legends in tiny grey sans with the words "REC" and "HOLD", a faint fingerprint on the stop key, studio, 100mm, f/8 --ar 4:5 --raw --s 50 --v 8.2 --no glossy, chrome, neon
```

---

## Bento Grid

**Entry:** `style-library/references/bento-grid.md`. **Recipe:** editorial restraint, `--raw --s 100`.
**Sref:** none; `{SREF}` slot. Tile type and numbers are set in the UI, not by the model.

### Hero still

```text
An interface design shot of a bento grid of {TILE_COUNT} rounded tiles on a {GROUND_COLOUR} field, one large hero tile holding {HERO_IMAGE}, smaller tiles each holding one idea ({TILE_CONTENTS}), every tile colour sampled from the hero image, 24 pixel radii, even 16 pixel gaps, soft two-layer shadows and no outline strokes, one {SIGNAL_COLOUR} accent on the primary button, a flat front-on view, crisp, tile labels left blank for the UI --ar 16:10 --raw --s 100 --v 8.2 --no clutter, gradients, emoji, text {SREF} {P}
```

### Series variant

One variable: the world (the hero image and its sampled colours). The skeleton never moves.

```text
The same interface design shot of the same bento grid of {TILE_COUNT} rounded tiles in the same layout, now with {NEXT_HERO_IMAGE} in the large hero tile and every tile colour sampled from it, the same 24 pixel radii, 16 pixel gaps and soft two-layer shadows, one {NEXT_SIGNAL_COLOUR} accent on the primary button, flat front-on view, tile labels blank --ar 16:10 --raw --s 100 --v 8.2 --seed {SEED} --no clutter, gradients, emoji, text {SREF} {P}
```

### Edit Model instruction

References: 1, the locked grid; 2, the new world's hero image.

```text
Keep the grid of the first image exactly: the number of tiles, their sizes, radii, gaps, shadows and positions. Put the second image in the large hero tile and recolour every other tile with colours sampled from it. Change nothing else. --raw --v 8.2
```

### Video beat

```text
The hero tile's image drifts slowly inside its frame, the small tiles stay still, one tile lifts a few pixels on a soft shadow and settles, locked front-on camera --motion low --raw --loop --bs 1
```

### Filled example

Grounded in @pxdx.baddies's BUSHI loadout (greige and charcoal, no saturation, a sun-disc gradient behind the katana).

```text
An interface design shot of a bento grid of six rounded tiles on a greige field, one large hero tile holding a full-body techwear samurai in a black lacquered helmet with a crescent crest on a warm greige studio sweep, smaller tiles each holding one idea: a black-and-white mountain mission card, a katana on a peach-to-tan sun disc, a desert landing craft, a stat bar panel, two pill buttons, every tile colour sampled from the hero image in greige, charcoal and off-white, 24 pixel radii, even 16 pixel gaps, soft two-layer shadows and no outline strokes, one sun-disc peach accent on the primary button, a flat front-on view, crisp, tile labels left blank for the UI --ar 16:10 --raw --s 100 --v 8.2 --no clutter, gradients, emoji, text
```

---

## Editorial Design

**Entry:** `style-library/references/editorial-design.md`. **Recipe:** editorial restraint,
`--raw --s 75`. **Sref:** none by default; `{SREF}` slot.

### Hero still

```text
A campaign photograph for {SUBJECT}: {THESIS_IMAGE}, {LIGHT}, the subject in the lower third and a large empty area of {EMPTY_AREA} above for a headline, a muted palette of {NEUTRALS} with one {SIGNAL_COLOUR} element on {SIGNAL_PART}, medium format, natural light, crisp fabric texture, fine grain, the crop deliberate and the horizon level --ar 4:5 --raw --s 75 --v 8.2 --no text, logo {SREF} {P}
```

### Series variant

One variable: the crop (wide, medium, the detail).

```text
The same campaign photograph for {SUBJECT}, the same {THESIS_IMAGE} in the same light and palette with the one {SIGNAL_COLOUR} element, now cropped as {NEXT_CROP: a tight detail of the fabric and the signal element}, medium format, natural light, crisp fabric texture, fine grain, one quiet area left for a caption --ar 4:5 --raw --s 75 --v 8.2 --seed {SEED} --no text, logo {SREF} {P}
```

### Edit Model instruction

References: 1, the locked hero.

```text
Keep the subject, the costume, the light, the palette and the grain of this image. Show it as {NEXT_CROP}, keeping one quiet area free for type. --raw --v 8.2 --ar {RATIO}
```

### Video beat

```text
Wind moves the fabric and the subject turns their head a little away from camera, the light stays, a very slow push-in, the empty sky stays empty --motion low --raw --bs 1
```

### Filled example

Grounded in @ovyonlabs's ASEMIC campaign frame (a faceless figure in a dusty-pink technical suit on a snowy ridge at blue hour with a burning orange horizon).

```text
A campaign photograph for a technical apparel label: a faceless figure in a hooded dusty-pink waterproof suit and cap with a backpack, seen from behind at three-quarter, standing on a snowy ridge, blue hour with a burning orange horizon, the figure in the lower third and a large empty area of pale sky above for a headline, a muted palette of snow blue, basalt and chalk with one dusty mauve element on the pack strap, medium format, natural light, crisp fabric texture, fine grain, the crop deliberate and the horizon level --ar 4:5 --raw --s 75 --v 8.2 --no text, logo
```

---

## Swiss Design

**Entry:** `style-library/references/swiss-design.md`. **Recipe:** editorial restraint,
`--raw --s 50`. **Sref:** none; `{SREF}` slot.

### Hero still

```text
A Swiss International Style poster photograph composition: {HERO_OBJECT} photographed on a {GROUND_COLOUR} seamless, cropped by a perfect circle mask at the top right so the object becomes a geometric shape, a large empty white field filling the left half for typography, flat even light with no shadow, one {SIGNAL_COLOUR} element on {SIGNAL_PART}, strict geometric balance on an objective grid --ar 2:3 --raw --s 50 --v 8.2 --no gradient, glow, texture, text {SREF} {P}
```

### Series variant

One variable: the mask (circle, quarter circle, half circle).

```text
The same Swiss International Style poster photograph composition of {HERO_OBJECT} on the same {GROUND_COLOUR} seamless, now cropped by a {NEXT_MASK: quarter-circle mask from the bottom left corner}, the same empty white field for typography, flat even light, the same {SIGNAL_COLOUR} element, strict geometric balance --ar 2:3 --raw --s 50 --v 8.2 --seed {SEED} --no gradient, glow, texture, text {SREF} {P}
```

### Edit Model instruction

References: 1, the locked hero.

```text
Keep the object, the ground, the flat light and the empty white field of this image. Crop the object with a {NEXT_MASK} instead of the circle, at macro scale, so it reads as a geometric shape. Change nothing else. --raw --v 8.2
```

### Video beat

```text
The circle mask slowly widens and the object rotates a few degrees inside it, the dial on the object turns once, flat light, locked camera, the white field stays empty --motion low --raw --bs 1
```

### Filled example

Grounded in @vnarshia's TP-7 concept (grey to white, one record red, circle and quarter-circle masks at extreme macro).

```text
A Swiss International Style poster photograph composition: a matte graphite pocket field recorder photographed on a pale grey seamless, cropped by a perfect circle mask at the top right at extreme macro so its dial and speaker grille become geometric shapes, a large empty white field filling the left half for typography, flat even light with no shadow, one record-red element on the record button, strict geometric balance on an objective grid --ar 2:3 --raw --s 50 --v 8.2 --no gradient, glow, texture, text
```

---

## Minimalism

**Entry:** `style-library/references/minimalism.md`. **Recipe:** anti-sheen realism, `--raw --s 50`.
**Sref:** none; `{SREF}` slot.

### Hero still

```text
{SUBJECT} set into {SETTING}, {MATERIAL}, small in the frame with vast empty space around it, {LIGHT}, one {SIGNAL_COLOUR} light source on {SIGNAL_PART}, architectural photography, 35mm, f/8, calm and restrained, everything that remains load-bearing, the upper half empty --ar 16:9 --raw --s 50 --v 8.2 --no clutter, props, text, glow {SREF} {P}
```

### Series variant

One variable: the hour of light.

```text
The same {SUBJECT} set into the same {SETTING} with the same {MATERIAL}, small in the same vast empty frame, now at {NEXT_HOUR} with {NEXT_LIGHT}, the same one {SIGNAL_COLOUR} light source, architectural photography, 35mm, f/8, calm, the upper half empty --ar 16:9 --raw --s 50 --v 8.2 --seed {SEED} --no clutter, props, text, glow {SREF} {P}
```

### Edit Model instruction

References: 1, the locked hero.

```text
Keep the subject, the wall, the materials and the framing of this image. Change only the light to {NEXT_HOUR}: move the sun and the window shadows to match. Nothing is added. --raw --v 8.2
```

### Video beat

```text
Window shadows drift slowly across the wall, the one light on the device pulses once and settles, nothing else moves, locked camera --motion low --raw --loop --bs 1
```

### Filled example

Grounded in @juliendesigncraft's notch utility film (a laptop set flush in a warm terrazzo wall under raking afternoon sun).

```text
A thin laptop screen mounted flush in a warm stone terrazzo wall of greige mosaic above a pale timber floor, the screen dark graphite glass with one small capsule control at the top, small in the frame with vast empty wall around it, raking late-afternoon sunlight with soft window-shadow gradients across the stone, one amber light on the capsule, architectural photography, 35mm, f/8, calm and restrained, the upper half empty --ar 16:9 --raw --s 50 --v 8.2 --no clutter, props, text, glow
```

---

## Maximalism

**Entry:** `style-library/references/maximalism.md` (abundance with a spine). **Recipe:** maximal density,
`--s 400`, `--c 15`. **Sref:** none; `{SREF}` slot. The giant word is set by hand behind the object.

### Hero still

```text
A high-end advertising photograph of {HERO_OBJECT} exploding into frame at a diagonal, {MACRO_DETAIL} frozen mid-air around it, a saturated {GROUND_COLOUR} background, a large blank band behind the object where a giant word will be set later, hard key light with crisp shadows, print grain, only {HUE_1}, {HUE_2} and {HUE_3} in the frame, 50mm, every splash and crumb sharp --ar 4:5 --s 400 --c 15 --v 8.2 --no extra colours, watermark, text {SREF} {P}
```

### Series variant

One variable: the flavour (object and its three hues), the diagonal and light fixed.

```text
The same high-end advertising photograph: now {NEXT_HERO_OBJECT} exploding into frame at the same diagonal, {NEXT_MACRO_DETAIL} frozen mid-air, a saturated {NEXT_GROUND_COLOUR} background, the same blank band for a giant word, the same hard key light and print grain, only {NEXT_HUES} in the frame, 50mm --ar 4:5 --s 400 --c 0 --v 8.2 --seed {SEED} --no extra colours, watermark, text {SREF} {P}
```

### Edit Model instruction

References: 1, the locked hero; 2, the next flavour's ingredients.

```text
Keep the diagonal, the camera, the hard light, the grain and the blank band of the first image. Swap the hero and the flying pieces for the ingredients in the second image and recolour the background to {NEXT_GROUND_COLOUR}. Three hues only. --v 8.2
```

### Video beat

```text
The splash rises in slow motion and curls back down, crumbs tumble past the lens, the glass turns a few degrees, hard light, locked camera --motion high --bs 1
```

### Filled example

Grounded in @danielsnows's "Strawlicious" milkshake frame (a splash with huge cream serif type set behind the glass).

```text
A high-end advertising photograph of a strawberry milkshake in a tall glass exploding into frame at a diagonal, a crown of pink milk splash, halved strawberries and a striped straw frozen mid-air around it, a saturated strawberry-pink background, a large blank band behind the glass where a giant word will be set later, hard key light with crisp shadows, print grain, only strawberry pink, cream and leaf green in the frame, 50mm, every droplet sharp --ar 4:5 --s 400 --c 15 --v 8.2 --no extra colours, watermark, text
```
