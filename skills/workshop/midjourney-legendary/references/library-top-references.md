# The library: the six reference families that scored highest

Of the 36 references studied on 2026-10-23 (`legendary-standard/references/evidence.md`), these six
families scored 5 on concept, craft and finish. Each is a method more than a look, so each gets the same
five prompts: hero still, series variant, Edit Model instruction, video beat, filled example. The slot
rules are those of `library-kevins-fifteen.md`.

| Family | Reference and score (concept / craft / finish / originality) | What the prompts carry |
|---|---|---|
| Lost-product fiction | @an_improbable_future, 5/5/5/5 (profile and grid); Kevin's Tech board, 5/5/5/4 | archive light, real wear, one signal colour; posts in pairs, a still and a motion of the same subject |
| One-metaphor campaign | @ovyonlabs ASEMIC, 5/5/5/5 | one thesis in every frame: the circle portal, the hidden face, terrain as body |
| Domain-material world | @skvortsov.design NLRTM, 5/5/5/4 | a set built from the subject's own industry materials, domain codes as texture |
| Art direction as a variable | @pxdx.baddies seven bentos, 5/5/5/4 | one skeleton, a backdrop per world, every colour sampled from it |
| Sound as ritual | Kevin's Sound board, 5/5/5/4 | reels, platters, faders and meters; Rams white and one warm accent |
| Explorable brand world | Ledger Stax brand site, 5/5/5/5 | a product as a landmark in a night city of districts |

---

## Lost-product fiction

**Recipe:** anti-sheen realism, `--raw --s 50`; the pair is a still plus a 5-second motion of the same
frame. **Sref:** none (documentary daylight); `{SREF}` slot.

### Hero still

```text
A field-test photograph of {OBJECT}, {ERA_ANCHOR}, in use or at rest {SETTING}, {BODY: materials and colours}, one {SIGNAL_COLOUR} {SIGNAL_PART}, {WEAR_1}, {WEAR_2}, {HUMAN_OR_SCALE_CUE}, flat overcast daylight, a documentary press photograph, medium format, 80mm, f/8, a neutral grade with slightly lifted blacks, fine film grain, centred framing that matches the rest of the feed --ar 4:5 --raw --s 50 --v 8.2 --no glow, lens flare, neon, logo, text {SREF} {P}
```

### Series variant

One variable: the object in the catalogue, with the framing locked so the feed reads as one collection.

```text
A field-test photograph of {NEXT_OBJECT}, {NEXT_ERA_ANCHOR}, in the same kind of setting, with the same centred framing, flat overcast daylight, documentary press look, medium format, 80mm, f/8, neutral grade with slightly lifted blacks and fine grain, one {NEXT_SIGNAL_COLOUR} {SIGNAL_PART}, two marks of real wear --ar 4:5 --raw --s 50 --v 8.2 --no glow, lens flare, neon, logo, text {SREF} {P}
```

### Edit Model instruction

References: 1, the locked still.

```text
Keep this object exactly, with its wear, and keep the overcast light and the lens. Show the same object {NEXT_SITUATION: being carried across the field by a technician in grey overalls, seen from behind}. Change nothing on the object. --raw --v 8.2
```

### Video beat

The motion half of the pair: the same frame, one small real movement.

```text
The rig's head pans slowly to the left and stops, grass moves in the wind around its feet, a technician in the background walks out of frame, overcast light, locked documentary camera --motion low --raw --bs 1
```

### Filled example

Grounded in @an_improbable_future (a robotic tripod rig in a field) and Kevin's Vision board (a cream-and-orange concept camera on tripod legs).

```text
A field-test photograph of a robotic tripod camera rig, a 1996 Japanese broadcast machine that never shipped, standing at rest in a cut cornfield, a body of cream ABS and gunmetal aluminium legs with a cine lens on a motorised head, one orange focus ring as the only colour, a peeling inventory sticker on one leg and mud on the feet, a technician in grey overalls ten metres behind for scale, flat overcast daylight, a documentary press photograph, medium format, 80mm, f/8, a neutral grade with slightly lifted blacks, fine film grain, centred framing --ar 4:5 --raw --s 50 --v 8.2 --no glow, lens flare, neon, logo, text
```

---

## One-metaphor campaign

**Recipe:** editorial restraint, `--raw --s 100`. **Sref:** Kevin's `1464381114` (moody cybernetic
figures, atmospheric depth, desert and neutral tone; best_for character and environment): a hidden-face
figure absorbed into mineral terrain is this family's frame. The accent is written in the text.

### Hero still

```text
A campaign photograph that argues {THESIS}: {FIGURE} with the face hidden by {CONCEALMENT}, wearing {GARMENT}, {RELATION_TO_TERRAIN}, {TERRAIN} in {EARTH_HUES}, a perfect circle as the recurring device ({CIRCLE_ROLE: a portal, a lens, a planet}), natural {LIGHT_TIME} light with a warm and cool split, medium format, crisp fabric texture, real scale cues in the landscape, one {ACCENT_COLOUR} element, generous quiet space for a serif wordmark and mono spec text --ar 4:5 --raw --s 100 --v 8.2 --sref 1464381114 --sw 150 --no face visible, logo, text {P}
```

### Series variant

One variable: the device's role (portal, lens, planet) across the campaign; the thesis does not change.

```text
The same campaign arguing {THESIS}: the same hidden-face figure in the same garment, now with the circle as {NEXT_CIRCLE_ROLE}, the same {TERRAIN} in {EARTH_HUES}, the same warm and cool split, medium format, crisp fabric texture, one {ACCENT_COLOUR} element, quiet space for type --ar 4:5 --raw --s 100 --v 8.2 --seed {SEED} --sref 1464381114 --sw 150 --no face visible, logo, text {P}
```

### Edit Model instruction

References: 1, the locked hero; 2, an aerial photograph of the next terrain.

```text
Keep the figure, the hidden face, the garment and the light of the first image. Set the figure into the terrain of the second image so the body and the land share one line, and frame them inside a perfect circle. Moody, atmospheric, neutral desert tones. --raw --v 8.2 --sref 1464381114 --sw 150
```

### Video beat

```text
Sand streams off the ridge in the wind and through the circle, the figure's hood ripples, the camera drifts slowly upward, the face stays hidden --motion low --raw --bs 1
```

### Filled example

Grounded in @ovyonlabs's ASEMIC ("the body as terrain": faces recede, the circle frames the figure against land). Studied for the method; a DZNR campaign writes its own thesis.

```text
A campaign photograph that argues the body is terrain: a figure with the face hidden by a deep hood and cap, wearing an oxblood technical suit with taped seams, lying along a rust-orange mineral ridge so the folds of the suit continue the folds of the rock, aerial view of grey sand and basalt, a perfect circle cut in the frame as a lens onto the ridge, natural late-afternoon light with a warm and cool split, medium format, crisp fabric texture, a tiny vehicle track below for scale, one dusty mauve label on the sleeve, generous quiet space for a serif wordmark and mono spec text --ar 4:5 --raw --s 100 --v 8.2 --sref 1464381114 --sw 150 --no face visible, logo, text
```

---

## Domain-material world

**Recipe:** anti-sheen realism with one warm bloom, `--raw --s 75`. **Sref:** none; `{SREF}` slot.

### Hero still

```text
A macro photograph of a stage built from {DOMAIN}'s own materials: {MATERIAL_1}, {MATERIAL_2} and {MATERIAL_3} in {BASE_COLOUR}, a few glossy slabs of {SIGNAL_COLOUR} as the domain's signal colour, a floating tablet over the set showing {SCREEN_CONTENT}, printed domain codes on the objects with the words "{CODE_1}" and "{CODE_2}", raking warm key light with a soft bloom under the device, shallow depth of field, a slow-dolly framing, the top left quiet --ar 16:9 --raw --s 75 --v 8.2 --no logo, lens flare, neon {SREF} {P}
```

### Series variant

One variable: the section on the floating screen and the object on the set.

```text
The same macro stage of {MATERIAL_1}, {MATERIAL_2} and {MATERIAL_3} in {BASE_COLOUR} with the same {SIGNAL_COLOUR} slabs, now the floating tablet showing {NEXT_SCREEN_CONTENT} and {NEXT_SET_OBJECT} standing on the set with the printed code "{CODE_3}", the same raking warm key and soft bloom, shallow depth of field --ar 16:9 --raw --s 75 --v 8.2 --seed {SEED} --no logo, lens flare, neon {SREF} {P}
```

### Edit Model instruction

References: 1, the locked stage; 2, the next screen design.

```text
Keep the set, every material, the slabs, the light and the camera of the first image. Put the second image on the floating tablet's screen, and replace the object on the set with {NEXT_SET_OBJECT} in the same materials. Change nothing else. --raw --v 8.2
```

### Video beat

```text
A slow dolly to the right across the ribbed set with a slight tilt, the tablet floats a few millimetres and settles, the warm bloom under it brightens once --motion low --raw --bs 1
```

### Filled example

Grounded in @skvortsov.design's NLRTM (a maritime logistics world: container ribbing, anti-slip plate, frosted acrylic, safety orange; "22 G1" as type).

```text
A macro photograph of a stage built from shipping's own materials: white corrugated container ribbing, an anti-slip dimple steel plate and frosted acrylic panels in white and light grey, a few glossy slabs of safety orange as the signal colour, a floating tablet over the set showing a white topographic relief map, three small stacked containers on the set with printed codes with the words "22 G1" and "HDG", raking warm key light with a soft bloom under the device, shallow depth of field, a slow-dolly framing, the top left quiet --ar 16:9 --raw --s 75 --v 8.2 --no logo, lens flare, neon
```

---

## Art direction as a variable

**Recipe:** varies with the world; the backdrop plate is the variable and the bento skeleton (built in
the UI) stays fixed. Default `--raw --s 100`. **Sref:** none, or one per world from the pack (`{SREF}`).

### Hero still

The backdrop plate for one world, made to sit behind a fixed set of cards.

```text
A full-bleed mood photograph for {WORLD}, {BACKDROP_SUBJECT}, {MATERIAL_AND_TEXTURE}, {LIGHT}, three dominant hues of {HUE_1}, {HUE_2} and {HUE_3} that the interface cards will sample, one hero element at {HERO_POSITION}, large calm areas where cards will float, depth of field soft enough that cards read on top --ar 16:10 --raw --s 100 --v 8.2 --no text, logo, clutter {SREF} {P}
```

### Series variant

One variable: the world. Same ratio, same calm areas for the cards.

```text
A full-bleed mood photograph for {NEXT_WORLD}, {NEXT_BACKDROP_SUBJECT}, {NEXT_MATERIAL}, {NEXT_LIGHT}, three dominant hues of {NEXT_HUES} for the cards to sample, one hero element at the same {HERO_POSITION}, the same large calm areas where cards will float --ar 16:10 --raw --s 100 --v 8.2 --no text, logo, clutter {SREF} {P}
```

### Edit Model instruction

References: 1, the locked backdrop; 2, the bento screenshot with the cards.

```text
Keep the backdrop of the first image. Lay the cards of the second image over it as frosted panels and recolour each card with a colour sampled from the backdrop beneath it. Keep the card sizes and positions exactly. --raw --v 8.2
```

### Video beat

```text
The levitating card rotates slowly a few degrees and drifts upward, light moves across the rock surface, the calm areas stay calm, locked camera --motion low --raw --loop --bs 1
```

### Filled example

Grounded in @pxdx.baddies's C-Bank world (a black rock texture, a levitating black card, a violet call to action).

```text
A full-bleed mood photograph for a fintech brand, a slab of black volcanic rock with a fine porous texture and a matte black payment card levitating just above it, the rock lit by a soft raking light from the right, three dominant hues of basalt black, graphite and one cool violet reflected along the card's edge that the interface cards will sample, the card at the right third, large calm areas of shadowed rock where cards will float, depth of field soft enough that cards read on top --ar 16:10 --raw --s 100 --v 8.2 --no text, logo, clutter
```

---

## Sound as ritual

**Recipe:** anti-sheen realism, `--raw --s 75`. **Sref:** none; `{SREF}` slot.

### Hero still

```text
A catalogue photograph of {AUDIO_OBJECT} in {ROOM}, {MATERIALS}, {CONTROLS: faders, reels, platters or meters and what each does}, printed legends with the words "{LEGEND}", a needle VU meter at {READING}, one {WARM_ACCENT} element on {ACCENT_PART}, warm natural window light with a soft fill, {WEAR}, medium format, 80mm, f/8, archival brochure grade, fine grain, the lower third quiet for a caption --ar 4:5 --raw --s 75 --v 8.2 --no glow, neon, logo, text {SREF} {P}
```

### Series variant

One variable: the object in the ritual (the deck, the platter, the mixer).

```text
The same catalogue photograph in the same {ROOM} with the same window light, now {NEXT_AUDIO_OBJECT} in {MATERIALS}, its controls and printed legends, one {WARM_ACCENT} element, the same archival brochure grade, medium format, 80mm, f/8, fine grain, the lower third quiet --ar 4:5 --raw --s 75 --v 8.2 --seed {SEED} --no glow, neon, logo, text {SREF} {P}
```

### Edit Model instruction

References: 1, the locked hero.

```text
Keep the deck, its reels, levers, legends and wear, the room and the window light of this image. Move the VU meter needles to {READING} and thread tape between the reels. Change nothing else. --raw --v 8.2
```

### Video beat

```text
The reels turn slowly and the tape runs between them, the VU needles swing gently with the music, one orange lever is pushed down, warm window light steady, locked camera --motion low --raw --loop --bs 1
```

### Filled example

Grounded in Kevin's Sound board (a Sony TC reel deck with orange levers; Braun hi-fi in white rooms; VU meters).

```text
A catalogue photograph of a reel-to-reel tape deck on a low walnut sideboard in a white room, brushed aluminium and Rams-white panels, two seven-inch reels with tape threaded through the heads, a row of transport levers and a pair of needle VU meters, printed legends with the words "PLAY" and "REC", the needles at minus three, one orange lever on the record transport, warm natural window light with a soft fill, a faint scratch on the tape guide, medium format, 80mm, f/8, archival brochure grade, fine grain, the lower third quiet for a caption --ar 4:5 --raw --s 75 --v 8.2 --no glow, neon, logo, text
```

---

## Explorable brand world

**Recipe:** maximal density at night, `--s 250`, `--c 0`. **Sref:** Kevin's `1226151696` (darker
nocturnal, high-contrast silhouette, cool cast; best_for key_art and environment): the night megacity is
its key art. The brand's one light is written in the text.

### Hero still

```text
An isometric night view of a vast megacity of thousands of small towers and lit windows, {PRODUCT} rendered as a skyscraper landmark at the centre, {PRODUCT_DETAILS}, districts separated by dark avenues ({DISTRICTS}), one {BRAND_LIGHT} light marking the landmark, high-contrast silhouettes against a cool haze, tiny lit screens as texture, a calm cinematic key art, clear dark margins where interface chrome will sit --ar 16:9 --s 250 --c 0 --v 8.2 --sref 1226151696 --sw 200 --no text, logo, lens flare {P}
```

### Series variant

One variable: the district the camera visits.

```text
The same isometric night megacity with the same {PRODUCT} skyscraper landmark in the distance and the same cool haze and {BRAND_LIGHT} light, now closer over {NEXT_DISTRICT}, its towers and streets in high-contrast silhouette, tiny lit screens as texture, clear dark margins for interface chrome --ar 16:9 --s 250 --c 0 --v 8.2 --seed {SEED} --sref 1226151696 --sw 200 --no text, logo, lens flare {P}
```

### Edit Model instruction

References: 1, the locked key art.

```text
Keep the city, the landmark, the night and the haze of this image. Move the camera in over {NEXT_DISTRICT}, keeping the landmark visible on the skyline, and add one small reticle marker of light above {HOTSPOT}. Dark nocturnal, high-contrast silhouette, cool cast. --v 8.2 --sref 1226151696 --sw 200
```

### Video beat

```text
A slow descending push toward the landmark tower, windows flicker across the districts, a thin mist slides between the towers, the landmark's light pulses once --motion low --raw --bs 1
```

### Filled example

Grounded in the Ledger Stax brand site (a hardware wallet rendered as a skyscraper in an isometric night megacity, explored by districts).

```text
An isometric night view of a vast megacity of thousands of small towers and lit windows, a slim hardware wallet rendered as a skyscraper landmark at the centre, its brushed steel face and single display panel standing above the towers, districts separated by dark avenues (a harbour, a market, an archive quarter), one white bracket of light marking the landmark, high-contrast silhouettes against a cool haze, tiny lit screens as texture, a calm cinematic key art, clear dark margins where interface chrome will sit --ar 16:9 --s 250 --c 0 --v 8.2 --sref 1226151696 --sw 200 --no text, logo, lens flare
```
