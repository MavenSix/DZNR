# Failure modes: tests, fixes, owners

Each failure was named from the 2026-10-23 research (`legendary-standard/references/evidence.md`). The
"usual prompt change" is the edit that most often cures it; the fix column in SKILL.md is the short form.

---

## F1. AI sheen (blocker)
- **Seen in the research:** the gap list's "default AI sheen: glow, over-saturation, smooth plastic,
  centred hero pose". The 5/5 references (@an_improbable_future, @ovyonlabs) use flat archive daylight,
  real wear and film grain instead.
- **Test:** at 100 percent, are surfaces airbrushed, skin plastic, fabric waxy, edges haloed, blacks
  crushed with bloom? Any yes fails.
- **Fix:** name the light source and its quality ("overcast north-window daylight", "one large softbox
  top-left"); name two wear marks; Midjourney `--style raw --s 50` and `--no glow, bloom, lens flare`;
  in natural language, "no glow, matte finish, real surface texture". Finish with 2 to 4 percent grain and
  a lifted black.
- **Owner:** whoever made the asset (Cheetara, Gibson); Gandalf re-checks.

## F2. Loose palette (blocker)
- **Seen in:** "one-shot output spreads hue; the bar is neutrals plus one accent sampled from the subject".
- **Test:** count the hues outside the neutrals. More than one signal (plus one alarm, in UI only) fails;
  a hue not in `pack.md` fails.
- **Fix:** re-sample the signal from the subject; put the hex in the prompt beside its part ("only the
  record button is {hex}"); for small drift, recolour in Adobe for creativity (single-colour saturation,
  HSL); otherwise regenerate from the lock.
- **Owner:** Snape (tokens), the asset maker.

## F3. No type layer (major)
- **Seen in:** every top piece adds a deliberate type layer afterwards (@jasonscarecrowart's technical
  plates, @designchapel's logotype over every shot, @ovyonlabs's mono text on circular paths).
- **Test:** does a frame that is meant to carry a message or a brand carry designed type? A key art,
  poster, plate, slide or hero with none fails.
- **Fix:** Step 6 of `legendary-standard`: a display face plus a label face, set by hand; for plates, the
  `technical-poster` grammar.
- **Owner:** Snape (system), Morpheus (words).

## F4. Model-made lettering (blocker)
- **Test:** any text the model drew, legible or not: fake brand marks, pseudo-kanji, warped labels.
- **Fix:** regenerate with "no text, no lettering, no logos" (Midjourney `--no text, letters, logo`), keep
  the space for type, set the text in the type layer. Real third-party marks are never added without rights.
- **Owner:** the asset maker; Snape sets the type.

## F5. Illustration smoothed in motion (blocker)
- **Seen in:** @bywaviboy's point that most AI video "kills the grit, washes out the texture"; the
  gap list's "medium drift in motion".
- **Test:** compare a mid-clip frame with the source plate at the same size. Softer line, gradient where
  there was flat colour, 3D-ish volume or interpolated in-betweens fails.
- **Fix:** upscale the plate before motion (Higgsfield upscale, Topaz via RunningHub); image-to-video
  only; in the brief, name the medium and say "hold the linework, flat colour and print grain of the
  attached plate, animate on twos (12fps)"; never "3D-realism" or "cinematic depth of field" on a drawn
  plate; reject smoothed takes rather than accepting them to keep the pipeline moving. On QKI packs the
  Prime Gate's law is stricter and wins.
- **Owner:** Cheetara (clips), Gibson.

## F6. Meaningless spectacle (blocker)
- **Seen in:** @atsmatrix's blast-radius reel, 4/4/4/4 on craft, whose top comments were "More AI slop.
  It looks pretty but it's slop" and "wtf does this even mean".
- **Test:** show the frame for three seconds to someone without the brief. Can they say what it is about?
  No fails.
- **Fix:** make the reading part of the frame: an in-scene label, a one-line caption, a title card, a
  staged comparison, a counter that says what it counts. Cut spectacle that serves no beat.
- **Owner:** Morpheus (the line), Gibson or Cheetara (where it sits).

## F7. No micro-detail (major)
- **Seen in:** ISO container codes (@skvortsov.design), "128 pieces" (@jakymakey's output), fabric
  composition text (@ovyonlabs), coordinates and "YEAR 2094" (Kasane).
- **Test:** where the world would print small text (labels, panels, screens, spec sheets), is it specific
  and true to the domain or canon? Lorem, "TEXT HERE", generic "SYSTEM ONLINE" or nothing fails.
- **Fix:** write a micro-detail sheet from the domain (real code formats) or `lore/canon.json` (author
  worlds: facts only, never invented canon); set it in the type layer.
- **Owner:** Morpheus; Cheetara checks canon.

## F8. No staging (major)
- **Seen in:** "raw outputs are shown raw; the bar stages work in devices, sets and films" (@juliendesigncraft,
  @skvortsov.design, @tonythetechie with @augma.im, @danielsnows).
- **Test:** does the pack show the work where it will live, lit and in material context? Only flat
  backgrounds fails.
- **Fix:** Step 7: a Blender MCP set or a Nano Banana or Higgsfield composite of the device in the world;
  a filmed stage via Runway or Kling.
- **Owner:** Gibson, Cheetara.

## F9. Generic composition (major)
- **Test:** centred hero pose with no reason, a symmetrical three-card grid, a starter-kit landing layout,
  the wireframe from @danielsnows's "But..." slide with nothing art-directed on it.
- **Fix:** recompose from the thesis: orthographic plate, strict third, extreme macro crop through a mask
  (@vnarshia), the display word behind the hero object, one idea per tile (@pxdx.baddies).
- **Owner:** the maker; `high-end-visual-design` and `design-taste-frontend` for page layout.

## F10. Default lighting (major)
- **Test:** is there a light source you could point to? Unmotivated rim light, teal-and-orange by default,
  or "cinematic lighting" with no direction fails.
- **Fix:** name source, direction, quality and time ("raking afternoon sun through a window, soft
  window-shadow gradient"); match the pack's camera language on an author world.
- **Owner:** the maker.

## F11. Identity drift (blocker)
- **Seen in:** @kreevslab's achievement was consistency across about 35 frames; drift breaks the series.
- **Test:** across the series, does a recurring face, costume, object, marque or vehicle change? Yes fails.
- **Fix:** re-lock and regenerate from the hero: `--sref` with the same `--sw`, `--cref` (v6) or `--oref`
  (v7), Higgsfield Soul Character and reference elements, Nano Banana edits from the approved hero.
- **Owner:** Cheetara (identity lock), Gibson.

## F12. Depth gimmick (major)
- **Seen in:** @deluxewebsite's repost of @craftwavesux (2/3/3/2): pop-out parallax over template-grade
  type; comments asked about speed and mobile.
- **Test:** remove the parallax or pop-out. If nothing art-directed remains, it fails.
- **Fix:** art-direct the layers (palette sampled, type system, a thesis), or drop the trick.
- **Owner:** Gibson, Neo.

## F13. Outline strokes on DZNR UI cards and pills (major, DZNR's own chrome only)
- **Source:** Kevin, 2026-10-14, DZNR OS decision 218: no outline on cards or pills; fill plus a soft
  two-layer shadow on both platforms; edges only under Increase Contrast or forced colours.
- **Test:** do DZNR OS or Pulse OS cards, pills, tags or chips use a stroke as their separator? Yes fails.
  Hairlines inside instrument graphics (gauges, dials, charts, reticles) are fine.
- **Fix:** replace with fill plus shadow; say so where a platform guideline asks for a stroke.
- **Owner:** Neo (build), Snape (system).

## F14. Missing respect controls (blocker on immersive sites)
- **Seen in:** Kasane (SOUND OFF, SKIP PASSAGE, REPLAY PASSAGE, "Motion: full"), Ledger Stax (sound
  toggle).
- **Test:** a site with sound or scroll-driven motion lacks sound off by default, skip, replay, or a
  reduced-motion path. Any missing fails.
- **Fix:** add them per `immersive-world-site`; honour `prefers-reduced-motion`.
- **Owner:** Neo, Gibson.
