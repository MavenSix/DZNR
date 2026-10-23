---
name: immersive-world-site
description: >
  A world, not a page: the pattern for immersive web experiences in Pulse OS (an author's novel as a place
  a reader walks through) and for Gibson and Neo's experience sites. Drawn from Ledger Stax
  (brand.ledger.com, a brand site as an explorable night city with districts, a minimap, an inventory and a
  sound toggle), Kasane (aura.build, a walked prologue, character dossiers, districts and a keepsake sigil)
  and An Improbable Future (the site as a frame for the objects, posts as still-plus-motion pairs). Gives
  the structure (thesis, districts or chapters, scroll as camera, in-world copy and HUD, one art direction
  across every asset, user controls for sound off, skip, replay and reduced motion, an honest loader, a
  keepsake at the end, a performance budget), maps a novel's lore into it from lore-engine's canon.json
  and the author's approved world pack, and gives a structured build brief. Ties to the threejs-* skills
  and threeui-catalog for the build. Owned by Gibson; Neo builds; Cheetara supplies the world's assets and
  canon; Morpheus writes the in-world copy; quality-gate checks it. Triggers on "immersive site", "world
  site", "novel as a world", "Pulse OS experience", "explorable", "scroll story", "districts", "a world not
  a page", "game-like landing", and when legendary-standard's pack becomes a site.
---

# Immersive World Site

Most AI-made pages are stacked sections scrolled past a fixed camera, with stock-looking images that share
no light. The three references that scored 5 for concept did four things those pages never do: they gave
the visitor a **place** with geography, a **goal**, **copy that lives inside the fiction**, and **controls
that respect the visitor**. This skill is that pattern, made buildable.

---

## The structure (nine parts, in build order)

### 1. Thesis, in the world's voice
One line that is both the premise and the first thing the visitor reads. Kasane opens on a single serif
italic line at bottom-left over a torii gate ("Some doors remember you."). On an author world the line is
the author's own sentence from the text, or one the author approves; never invented canon.

### 2. A spatial model: districts or chapters
Choose one and commit:
- **Districts** (Ledger Stax): a map of places the visitor travels between. A bottom switcher with
  bracketed numbers ("[01] DOWNTOWN", "[02] NANO SQUARE"), a minimap with a position dot, a cinematic
  camera move between districts. Use when the world is a geography.
- **Chapters** (Kasane, hyliox): a sequence the visitor walks. A chapter rail and a counter ("01 / 05"),
  pinned sections with progress lines, a right-edge section-dot nav. Use when the world is a story arc.
Four to six districts or chapters. More dilutes; fewer is a page.

### 3. Scroll is the camera
The wheel moves the visitor *through* space: walking through a gate down a path (Kasane), pushing into a
portal (Neon Orian), diving down a street (Ledger Stax). Content does not scroll past a static camera.
Motion means travel, not decoration.

### 4. In-world copy and HUD
Every label belongs to the fiction: epithets ("the Memory Thief"), field-recording labels, coordinates
("35° 41' N 139° 41' E"), a year, bracketed numbering, a readout that means something ("SPIRIT SYNC 084%").
The HUD is diegetic: chamfered frames, corner ticks, a reticle cursor (Ledger Stax), mono telemetry.
Marketing filler is a `quality-gate` F7 failure. On an author world, every fact in the HUD comes from
`lore/canon.json` or a ruling.

### 5. One art direction across everything
Characters, relics, places, UI and type share one palette, one light and one material language. This is
the pack (`legendary-standard`): on DZNR's own work from `kevin-taste`, on an author world from the
author's approved pack. A site that mixes generated plates with no shared light fails series coherence.

### 6. A goal
Give the visitor something to do: find the missing items and fill an inventory (Ledger Stax), choose a
character and forge a sigil (Kasane), collect the chapters. Optional for a pure reading experience, but
the best references all had one.

### 7. Respect controls (blocker if missing)
- **Sound:** off by default, a visible toggle from the first screen, remembered for the session.
- **Skip** the passage or intro film; **Replay** it from the end.
- **Motion level:** full, reduced, off. `prefers-reduced-motion` sets reduced on arrival; reduced replaces
  scroll-scrubbed camera travel with cuts and stills.
- **Keyboard:** every hotspot, district and choice reachable; visible focus.
- **An honest loader:** real progress ("Preparing the forest 15/17"), not a fake bar.

### 8. A keepsake at the end
An ending, not a footer: a sigil to download (Kasane), a completed inventory, a reader's card, a still
from the world with the visitor's name or choice set in the type layer. On Pulse OS, the keepsake can be
the reader's progress artefact.

### 9. The performance budget (numbers, enforced)
| Budget | Value |
|---|---|
| LCP | under 2.5s on a mid-range phone over 4G; the first screen is a poster frame, not the 3D scene |
| CLS | under 0.05 |
| Initial JS | under 250KB gzipped before the 3D chunk; the scene loads after first paint |
| Scene | under 150k triangles on screen; textures KTX2 or WebP, 2048px max, 1024px on mobile |
| Device pixel ratio | capped at 2, at 1.5 on mobile |
| Frame rate | 60fps target, degrade to 30fps and drop post-processing below 50fps sustained |
| Video plates | AV1 or H.264 at 1080p max, poster frame first, muted autoplay only |
| Fallback | a no-WebGL path with the plates as stills, the copy intact, every choice reachable |

`threejs-production-hardening` and `fixing-motion-performance` hold the detail.

---

## Mapping a novel's lore into the structure (Pulse OS)

The full map is `references/lore-to-structure.md`. In short, from `lore/canon.json` and the approved
author world pack:

| Canon | Becomes |
|---|---|
| Places | Districts, or the setting of each chapter; geography from the canon (what is beside what) |
| Characters | Dossiers: epithet, a short bio in the author's words, a portrait from the identity lock |
| Objects | Relics: an interactive 3D object or a plate with its micro-detail |
| Groups | Faction colour within the pack palette, a HUD badge |
| Rules | HUD readouts and "how this world works" modules |
| Timeline and events | Chapter order; dates and "17 YEARS AGO" style labels |
| Open questions | Hold the content they touch; never fill the gap with invention |

Fixed rules on an author world: the author's pack decides medium, palette and camera; the Fidelity Gate
runs on every plate and every line of in-world copy before `quality-gate`; the author approves the site
structure as part of the pack or a checkpoint (through Pulse OS on a Pulse OS job, never mid-run);
spoilers follow the reader's position when Pulse OS supplies it (a chapter the reader has not reached
stays locked).

## Who does what

| Agent | Part |
|---|---|
| Gibson | Spatial model, scroll-as-camera, the goal, the experience design and the brief |
| Cheetara | Every plate, relic and portrait from the pack; canon for every in-world fact |
| Morpheus | In-world copy: the thesis line, epithets, labels, the keepsake text |
| Neo | The build: Three.js scene, controls, budget, fallback |
| Snape | Type system and HUD chrome tokens on DZNR's own work |
| Gandalf | `quality-gate`, with `critique`, `polish`, `fixing-accessibility`, `fixing-motion-performance` |

## Build path

`threejs-fundamentals` (scene, camera rig), `threejs-loaders` (GLTF, KTX2, progress for the honest
loader), `threejs-animation` and `threejs-interaction` (scroll-scrubbed camera, hotspots, reticle cursor),
`threejs-lighting`, `threejs-materials`, `threejs-shaders` (fog, particles, the medium's look),
`threejs-postprocessing` (bloom and grain, dropped first under budget), `threejs-production-hardening`
(budget, fallback). `threeui-catalog` before hand-building HUD components. Places blocked first in Blender
MCP when the canon's geography matters. Sound from ElevenLabs or Wan's native audio, off by default.

## Reference files

- `references/lore-to-structure.md`: the canon-to-site map in full, with the fields each element reads.
- `references/site-brief-template.md`: the structured build brief (the prompt-architecture slots for a
  world site), with a worked example on an invented world.
