# The library: the eight styles found in Kevin's references

The same five prompts per style as `library-kevins-fifteen.md`, with the same slot rules: `{SREF}` is
`--sref <code> --sw <weight>` or nothing, `{P}` is `--p 94b2bfcd-291e-4745-8ac6-a07a7c643e0b` (Kevin's profile) on DZNR's own work and QKI, the author's own
`{profile}` from the approved pack on an author world, or nothing, `{SEED}` is the
locked hero's seed. Three of these styles carry one of Kevin's characterised codes by default, and say
why; a pack can always override.

---

## Instrument-grade Product

**Entry:** `style-library/references/instrument-grade-product.md` (Kevin's centre of gravity). **Recipe:**
anti-sheen realism, `--raw --s 50`. **Sref:** none: the look is studio light and real material, which no
characterised code carries; `{SREF}` for a pack's own code.

### Hero still

```text
A product catalogue photograph of {OBJECT}, {ERA_ANCHOR}, {VIEW} on a seamless {GROUND_COLOUR} sweep, a body of {BODY_MATERIALS}, {CONTROLS: each control and what it sets}, printed legends with the words "{LEGEND_1}" and "{LEGEND_2}", one {SIGNAL_COLOUR} {SIGNAL_PART}, {WEAR_1} and {WEAR_2}, a large soft key light from the top left, a white bounce from the right, a soft contact shadow, medium format, 80mm, f/11, a neutral grade, fine film grain, the top third empty --ar 4:5 --raw --s 50 --v 8.2 --no glow, lens flare, neon, logo {SREF} {P}
```

### Series variant

One variable: the view (side profile, three-quarter, top-down flat-lay).

```text
The same product catalogue photograph of the same {OBJECT}, the same materials, controls, legends, {SIGNAL_COLOUR} {SIGNAL_PART} and wear, now as {NEXT_VIEW} on the same seamless {GROUND_COLOUR} sweep, the same soft top-left key, white bounce and contact shadow, medium format, 80mm, f/11, neutral grade, fine grain --ar 4:5 --raw --s 50 --v 8.2 --seed {SEED} --no glow, lens flare, neon, logo {SREF} {P}
```

### Edit Model instruction

References: 1, the locked hero; 2, the colourway swatch (optional).

```text
Keep this object exactly: its shape, every control and legend, its wear, the sweep, the light and the lens. Show it as {NEXT_VIEW}. If a second image is attached, change only the body colour to match it and keep the {SIGNAL_COLOUR} {SIGNAL_PART}. --raw --v 8.2
```

### Video beat

```text
The knob turns two detents and the counter on the display ticks forward two seconds, the light does not change, locked-off camera, a tiny push-in --motion low --raw --bs 1
```

### Filled example

Grounded in Kevin's Tech board (a black e-ink device with one knob and the counter "00:04:14", saved three times).

```text
A product catalogue photograph of a palm-sized black e-ink recorder with one large knob, as Teenage Engineering might have made it, a three-quarter view at eye height on a seamless pale grey sweep, a body of bead-blasted graphite aluminium with a matte e-ink display showing the counter "00:04:14", a knurled aluminium knob with a printed 0 to 10 scale that sets the input level, a small membrane key labelled "REC", one TE-orange ring around the knob's base, a scuffed lower edge and a faint graphite smudge by the key, a large soft key light from the top left, a white bounce from the right, a soft contact shadow, medium format, 80mm, f/11, a neutral grade, fine film grain, the top third empty --ar 4:5 --raw --s 50 --v 8.2 --no glow, lens flare, neon, logo
```

---

## Technical Poster

**Entry:** `style-library/references/technical-poster.md`. **Recipe:** editorial restraint,
`--raw --s 75`. **Sref:** none; `{SREF}` slot. The vertical title, spec blocks, callouts, seal and barcode
are the type layer, set by hand.

### Hero still

```text
A studio render of {SUBJECT} as a plate for a technical poster, {MATERIALS}, {DETAILS: three mechanical or material specifics}, entering the frame from the {EDGE} at a diagonal and cropped at {CROP_POINT}, a pale cool-grey seamless background, a soft overhead softbox, crisp detail, product-catalogue photography, 100mm, a large empty area on the {SIDE} for a vertical title, spec blocks and hairline callouts --ar 4:5 --raw --s 75 --v 8.2 --no text, letters, logo, watermark, glow {SREF} {P}
```

### Series variant

One variable: the livery (at most three hues on the grey).

```text
The same studio render of {SUBJECT} entering from the same {EDGE} at the same diagonal and crop, the same materials and mechanical details, now in {NEXT_LIVERY: at most three hues}, the same pale cool-grey seamless and soft overhead softbox, 100mm, the same empty area on the {SIDE} --ar 4:5 --raw --s 75 --v 8.2 --seed {SEED} --no text, letters, logo, watermark, glow {SREF} {P}
```

### Edit Model instruction

References: 1, the locked plate.

```text
Keep the subject's form, every joint, cable and fitting, the diagonal entry, the crop, the grey background and the light of this image. Change only the livery to {NEXT_LIVERY}. Leave the empty area empty. --raw --v 8.2
```

### Video beat

```text
The fingers of the hand close slowly one joint at a time and open again, servos and cables move with them, locked camera, the grey background stays clean --motion low --raw --bs 1
```

### Filled example

Grounded in @jasonscarecrowart's twenty mech hands (crimson and bone-white armour, red cabling, brass fittings on a pale cool grey).

```text
A studio render of a mecha robotic hand as a plate for a technical poster, crimson enamel and bone-white armour plates with chipped edges, exposed gunmetal servos, bundled red cabling and brass fittings on the knuckles, entering the frame from the top at a diagonal and cropped at the forearm, a pale cool-grey seamless background, a soft overhead softbox, crisp detail, product-catalogue photography, 100mm, a large empty area on the left for a vertical title, spec blocks and hairline callouts --ar 4:5 --raw --s 75 --v 8.2 --no text, letters, logo, watermark, glow
```

---

## Grounded Speculative Realism

**Entry:** `style-library/references/grounded-speculative-realism.md`. **Recipe:** anti-sheen realism,
`--raw --s 50`. **Sref:** none: none of the characterised codes is documentary daylight, and an sref here
would fight the archive look; `{SREF}` for a pack's own code.

### Hero still

```text
An archival {PHOTO_KIND} photograph of {SUBJECT}, {ERA_ANCHOR}, {VIEW} {SETTING}, a body of {BODY_MATERIALS_AND_COLOURS}, one {SIGNAL_COLOUR} {SIGNAL_PART}, {WEAR_1}, {WEAR_2} and {WEAR_3}, {SCALE_CUE} for scale, flat overcast daylight, medium format, 80mm, f/8, a neutral grade with slightly lifted blacks, fine film grain, documentary framing with the subject dead centre --ar 3:2 --raw --s 50 --v 8.2 --no glow, neon, lens flare, logo, text {SREF} {P}
```

### Series variant

One variable: the setting (apron, hangar, white sweep, field).

```text
The same archival photograph of the same {SUBJECT} with the same materials, {SIGNAL_COLOUR} {SIGNAL_PART} and wear, now {NEXT_SETTING}, the same {VIEW}, the same flat overcast daylight, medium format, 80mm, f/8, neutral grade with slightly lifted blacks, fine film grain --ar 3:2 --raw --s 50 --v 8.2 --seed {SEED} --no glow, neon, lens flare, logo, text {SREF} {P}
```

### Edit Model instruction

References: 1, the locked hero; 2, a photograph of the new location.

```text
Keep the machine of the first image exactly, with every panel, mark and scuff. Place it in the location of the second image under the same flat overcast daylight, with a matching contact shadow and the same lens. Change nothing on the machine. --raw --v 8.2
```

### Video beat

```text
A slow handheld walk past the machine, a little wind moves the grass and a loose strap, overcast light, the machine does not move or change --motion low --raw --bs 1
```

### Filled example

Grounded in @an_improbable_future (a battered PDA with a magenta terminal screen; "it could have existed").

```text
An archival press photograph of a portable data terminal, a 1999 handheld that never shipped, an overhead flat-lay on a seamless white sweep, a body of matte black and pale-blue ABS with a square monochrome screen showing magenta terminal text, a round direction pad and a rubber numeric keypad, one magenta line of text as the only colour, a peeling silver asset-tag label with a barcode, a gaffer-tape repair and black graphite smudges on the edges, a pencil beside it for scale, flat overcast daylight, medium format, 80mm, f/8, a neutral grade with slightly lifted blacks, fine film grain, documentary framing with the subject dead centre --ar 1:1 --raw --s 50 --v 8.2 --no glow, neon, lens flare, logo, text
```

---

## HUD as Instrument

**Entry:** `style-library/references/hud-instrument.md`. **Recipe:** editorial restraint,
`--raw --s 50`. **Sref:** none; `{SREF}` slot. Real readouts are built in code; the still is the concept
plate, with quoted words kept to short labels.

### Hero still

```text
A fictional user interface screen for {DEVICE_OR_CONTEXT}, monochrome white hairline instrument graphics on true black, one hero {HERO_INSTRUMENT}, a strip of {N} small instruments ({LIST}) along the bottom, tiny uppercase mono labels, bracketed section numbers, corner brackets framing the screen, one {SIGNAL_COLOUR} signal on {SIGNAL_ELEMENT}, every number measuring something, precise film-interface craft, a flat front-on view --ar 16:9 --raw --s 50 --v 8.2 --no gradient, purple glow, 3d, people {SREF} {P}
```

### Series variant

One variable: the state (idle, measuring, the alarm).

```text
The same fictional interface screen with the same hairline instruments, labels, brackets and layout, now in the {NEXT_STATE} state: {STATE_CHANGE: the hero gauge swept to its last third and one small instrument showing alarm red}, the same {SIGNAL_COLOUR} signal, flat front-on view --ar 16:9 --raw --s 50 --v 8.2 --seed {SEED} --no gradient, purple glow, 3d, people {SREF} {P}
```

### Edit Model instruction

References: 1, the locked screen.

```text
Keep every instrument, hairline, label position and bracket of this screen. Move the hero gauge's needle to {READING}, and turn {SMALL_INSTRUMENT} alarm red. Change nothing else. --raw --v 8.2
```

### Video beat

```text
The hero gauge's needle sweeps slowly to its new reading, the tick marks light one by one behind it, the small instruments update once, the screen does not move --motion low --raw --bs 1
```

### Filled example

Grounded in Kevin's Interface board (radial gauges, concentric rings with ticks, a 24-hour polar chart, white hairlines on black, one orange).

```text
A fictional user interface screen for an agent run monitor, monochrome white hairline instrument graphics on true black, one hero radial gauge with fine tick marks measuring spend against a budget, a strip of four small instruments along the bottom (a polar 24-hour activity chart, a step counter, a token meter, a status dial), tiny uppercase mono labels, bracketed section numbers, corner brackets framing the screen, one signal-orange needle on the hero gauge, every number measuring something, precise film-interface craft, a flat front-on view --ar 16:9 --raw --s 50 --v 8.2 --no gradient, purple glow, 3d, people
```

---

## Monumental Calm

**Entry:** `style-library/references/monumental-calm.md`. **Recipe:** anti-sheen realism, `--raw --s 75`,
`--ar 21:9`. **Sref:** Kevin's `1226151696` for the night and fog variant (darker nocturnal, high-contrast
silhouette, cool cast; best_for environment and mood): the silhouette and the cold are the code's; the
one warm light is written in the text. For a daylight plate, drop the code.

### Hero still

```text
A wide establishing photograph of {PLACE}, {ARCHITECTURE: masses and openings}, {MATERIALS}, {WEATHER}, one lone figure at the base for scale, {PERSPECTIVE} with a level camera, the horizon on the lower third, still water reflecting the mass, the only warm light {WARM_SOURCE} in {WARM_COLOUR}, atmospheric perspective, 24mm, a cinematic still, fine grain, the sky above the mass empty --ar 21:9 --raw --s 75 --v 8.2 --sref 1226151696 --sw 150 --no lens flare, god rays, crowds, text {P}
```

### Series variant

One variable: the weather (fog, rain, snow, blue hour).

```text
The same wide establishing photograph of {PLACE} with the same masses, materials, lone figure and level one-point camera, now in {NEXT_WEATHER}, the same still water, the same single warm light {WARM_SOURCE} in {WARM_COLOUR}, atmospheric perspective, 24mm, fine grain --ar 21:9 --raw --s 75 --v 8.2 --seed {SEED} --sref 1226151696 --sw 150 --no lens flare, god rays, crowds, text {P}
```

### Edit Model instruction

References: 1, the locked plate.

```text
Keep the architecture, the figure, the camera and the one warm window of this image. Change only the weather to {NEXT_WEATHER}: cold, quiet, the warm window the only warm light. --raw --v 8.2 --sref 1226151696 --sw 150
```

### Video beat

```text
Fog moves slowly across the face of the building, the still water ripples once, the figure takes one step and stops, the warm window steady, locked wide camera --motion low --raw --bs 1
```

### Filled example

Grounded in Kevin's Future Architecture board (a curved black wall carved into a sea cliff with one tiny figure; a glowing amber window in a rust monolith).

```text
A wide establishing photograph of a curved black basalt wall carved into a sea cliff, one tall narrow opening near its base, board-formed concrete and wet stone, night fog rolling in off the sea, one lone figure at the base for scale, symmetrical one-point perspective with a level camera, the horizon on the lower third, a still tidal pool reflecting the wall, the only warm light a single amber window high in the wall, atmospheric perspective, 24mm, a cinematic still, fine grain, the sky above the cliff empty --ar 21:9 --raw --s 75 --v 8.2 --sref 1226151696 --sw 150 --no lens flare, god rays, crowds, text
```

---

## Techwear Editorial

**Entry:** `style-library/references/techwear-editorial.md`. **Recipe:** editorial restraint,
`--raw --s 75`. **Sref:** Kevin's `1464381114` (moody cybernetic figures, atmospheric depth, desert and
neutral tone; best_for character): faceless engineered figures in mineral neutrals are this style's
subject and palette. The signal colour is written in the text.

### Hero still

```text
A fashion editorial photograph of {FIGURE: role}, the face hidden by {CONCEALMENT}, wearing {GARMENT: construction and materials}, {GEAR}, one {SIGNAL_COLOUR} {SIGNAL_PART}, on {SETTING}, {POSE}, a soft key light at 45 degrees, medium format, 85mm, crisp fabric texture with water beading, believable seams, panels and fastenings, a muted mineral palette of {NEUTRALS}, the figure on the right third and the left side quiet for type --ar 4:5 --raw --s 75 --v 8.2 --sref 1464381114 --sw 150 --no logo, text, face visible, neon {P}
```

### Series variant

One variable: the garment (the look in the collection).

```text
The same fashion editorial photograph on the same {SETTING} in the same soft 45-degree key light, now {FIGURE} wearing {NEXT_GARMENT}, the face still hidden by {CONCEALMENT}, one {SIGNAL_COLOUR} {SIGNAL_PART}, the same pose family, medium format, 85mm, crisp fabric texture, the same mineral palette, the figure on the right third --ar 4:5 --raw --s 75 --v 8.2 --seed {SEED} --sref 1464381114 --sw 150 --no logo, text, face visible, neon {P}
```

### Edit Model instruction

References: 1, the locked hero; 2, a flat-lay of the next garment.

```text
Keep the figure's build, the hidden face, the pose, the set, the light and the palette of the first image. Dress the figure in the garment of the second image, with its real seams and fastenings, in the same fabric finish. Moody, atmospheric, neutral desert tones. --raw --v 8.2 --sref 1464381114 --sw 150
```

### Video beat

```text
The figure turns slowly from three-quarter to profile, the hood shifts with the movement, fabric catches the key light, the face stays hidden, locked camera with a slight push-in --motion low --raw --bs 1
```

### Filled example

Grounded in Kevin's Gear board (white hooded tactical robes with armour panels, desert-nomad sci-fi; a white full-face helmet with an orange visor).

```text
A fashion editorial photograph of a desert courier, the face hidden by a white full-face helmet with a safety-orange visor, wearing a white hooded tactical robe over moulded armour panels with taped seams and webbing, a sling bag and wrapped forearms, one safety-orange visor as the only colour, on a seamless greige studio sweep with a dusting of sand, standing in three-quarter with one hand on the strap, a soft key light at 45 degrees, medium format, 85mm, crisp fabric texture with water beading, believable seams, panels and fastenings, a muted mineral palette of chalk, greige and basalt grey, the figure on the right third and the left side quiet for type --ar 4:5 --raw --s 75 --v 8.2 --sref 1464381114 --sw 150 --no logo, text, face visible, neon
```

---

## Mature 90s Anime

**Entry:** `style-library/references/mature-90s-anime.md` (body meets machine, never cute). **Recipe:**
`--s 100`, `--c 0`. **Sref:** two lines. The V8.2 line carries Kevin's `3730410722` (inky graphic-novel
character work, dramatic rim light, limited moody palette; best_for character and key_art), which suits
adult drawn character frames; the palette is written in the text. The Niji 7 line carries no sref, since
the docs do not confirm `--sref` on Niji 7.

### Hero still

```text
A mature 1990s cyberpunk cel animation still of {CHARACTER: adult, role, look}, {POSE_AND_ACTION}, {CONNECTION: wired to a desk by ribbon cables at the nape}, {SETTING} dense with {HARDWARE}, varied-weight ink linework, flat cel colour with one hard shadow tone, a painted background, muted lilac-grey and desaturated teal, one {SIGNAL_COLOUR} glow from {LIGHT_SOURCE} as a rim light, film-cel grain, adult proportions --ar 16:9 --s 100 --v 8.2 --sref 3730410722 --sw 200 --no chibi, moe, 3d render, glossy {P}
```

Niji 7 line, no sref:

```text
A mature 1990s cyberpunk cel animation still of {CHARACTER: adult, role, look}, {POSE_AND_ACTION}, {CONNECTION}, {SETTING} dense with {HARDWARE}, varied-weight ink linework, flat cel colour with one hard shadow tone, a painted background, muted lilac-grey and desaturated teal, one {SIGNAL_COLOUR} glow from {LIGHT_SOURCE}, film-cel grain, adult proportions --ar 16:9 --s 100 --niji 7 --no chibi, moe, 3d render, glossy
```

### Series variant

One variable: the shot (wide, medium, the close-up on the connection).

```text
The same mature 1990s cyberpunk cel animation world: the same {CHARACTER} in the same {SETTING}, now as {NEXT_SHOT: a close-up of the cables entering the nape}, the same varied-weight ink line, flat cel colour with one hard shadow, muted lilac-grey and teal, the same {SIGNAL_COLOUR} rim glow, film-cel grain --ar 16:9 --s 100 --v 8.2 --seed {SEED} --sref 3730410722 --sw 200 --no chibi, moe, 3d render, glossy {P}
```

### Edit Model instruction

References: 1, the locked hero; 2, the character sheet.

```text
Keep the character exactly as in the second image: face, hair, costume, cables. Keep the line weight, the flat cel colour, the palette and the grain of the first image. Show {NEXT_SHOT}. Inky graphic-novel line, dramatic rim light. --v 8.2 --sref 3730410722 --sw 200
```

### Video beat

```text
Light from the monitor flickers across her face, the cables at her nape sway slightly, her eyes move to the left and hold, the room stays still, locked camera --motion low --raw --bs 1
```

### Filled example

Grounded in Kevin's Anime board (a cyborg woman wired into a ceiling panel; a desaturated blue cyborg seen from behind, wired to a desk).

```text
A mature 1990s cyberpunk cel animation still of an adult woman systems technician with a short dark bob and a grey utility jacket, seen from behind at three-quarter, seated and wired to a cluttered desk by ribbon cables at the nape, a cramped server room dense with stacked monitors, tangled cables and a keyboard with worn keys, varied-weight ink linework, flat cel colour with one hard shadow tone, a painted background, muted lilac-grey and desaturated teal, one monitor-cyan glow from the main screen as a rim light, film-cel grain, adult proportions --ar 16:9 --s 100 --v 8.2 --sref 3730410722 --sw 200 --no chibi, moe, 3d render, glossy
```

---

## Ink and Cel Illustration

**Entry:** `style-library/references/ink-cel-illustration.md` (the grit kept in motion). **Recipe:**
`--s 100`, `--c 0`. **Sref:** Kevin's `3730410722` (inky graphic-novel character sheets, dramatic rim
light, limited moody palette; best_for character_sheet): the code's ink and limited palette are this
style's line and fills, and the character sheet is what the style builds first. The fills are written in
the text, five or fewer.

### Hero still

```text
A comic illustration of {CHARACTER: design from the character sheet}, {ACTION} in {SETTING}, heavy black ink linework with tapered weight, flat cel colour, one hard-edged shadow shape per form, a palette of {FILLS: up to five} on near-black, {EFFECT} drawn as flat white graphic shapes, riso print grain, slight colour misregistration, strong silhouette with the character cropped by the frame edge --ar 9:16 --s 100 --v 8.2 --sref 3730410722 --sw 250 --no 3d render, soft shading, gradient, glow {P}
```

World pass first, same suffix: a character sheet (front, side, back, three expressions), three environments and six action poses.

```text
A character sheet of {CHARACTER} on newsprint: front, side and back views and three expressions, heavy black ink linework with tapered weight, flat cel colour in {FILLS}, one hard shadow shape per form, riso print grain, evenly spaced on the sheet --ar 16:9 --s 100 --v 8.2 --sref 3730410722 --sw 250 --no 3d render, soft shading, gradient, glow, text {P}
```

### Series variant

One variable: the action beat.

```text
The same comic illustration world: the same {CHARACTER} in the same {SETTING}, now {NEXT_ACTION}, the same heavy tapered ink line, flat cel colour in the same {FILLS} on near-black, one hard shadow shape per form, {EFFECT} as flat white shapes, riso grain and misregistration --ar 9:16 --s 100 --v 8.2 --seed {SEED} --sref 3730410722 --sw 250 --no 3d render, soft shading, gradient, glow {P}
```

### Edit Model instruction

References: 1, the locked hero; 2, the character sheet; 3, the environment.

```text
Keep the character exactly as drawn in the second image and the place as drawn in the third. Keep the ink weight, flat fills, palette and riso grain of the first image. Show {NEXT_ACTION}. Inky graphic-novel line, dramatic rim light. --v 8.2 --sref 3730410722 --sw 250
```

### Video beat

```text
He exhales a ribbon of smoke drawn as a flat white shape, flicks a card across the table, the camera pushes in slowly on his face and holds, the ink line and flat colour stay crisp and unsmoothed --motion low --raw --bs 1
```

If Midjourney's video smooths the line, run the same beat in Kling or Wan via Runway with "animate on twos, hold the linework" (`wan-video-prompts`), from the same upscaled still.

### Filled example

Grounded in @bywaviboy's method (build the world first, upscale before motion, keep the ink); the character is DZNR's own, not his.

```text
A comic illustration of a lanky card dealer in a scuffed leather jacket with a long jaw and heavy-lidded eyes, flicking a card across a dive-bar table among bottles and an ashtray, heavy black ink linework with tapered weight, flat cel colour, one hard-edged shadow shape per form, a palette of acid green, brick orange and mustard on near-black, cigarette smoke drawn as flat white graphic shapes, riso print grain, slight colour misregistration, strong silhouette with the dealer cropped by the right frame edge --ar 9:16 --s 100 --v 8.2 --sref 3730410722 --sw 250 --no 3d render, soft shading, gradient, glow
```
