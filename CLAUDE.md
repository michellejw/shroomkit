# ShroomKit

A small SwiftUI design-system + onboarding-scaffolding package for Shroom Games
apps. Cozy, accessible, opinionated.

## Why this exists

Shroom Games is a small studio of cozy iOS games. The first game
(Shroomsweeper) established a house style — color tokens, typography, button
shapes, a welcome/tutorial flow, etc. ShroomKit packages those patterns so:

- App #2, #3, … inherit the look and onboarding scaffold for free
- Visual updates (e.g. dark-theme tweaks) propagate to every game
- The Welcome → Tutorial → Home structure works as a starting skeleton

## Source of truth (right now)

Patterns are being extracted FROM the live Shroomsweeper codebase at
`~/dev/games/shroomsweeper/` (the user is moving it there from
`~/dev/archive/APPS/puzzle-game/shroomsweeper/` — if the new path isn't there
yet, fall back to the archive path).

Files to mine for patterns:

- `Theme/Theme.swift` — `Appearance`, `Palette`, environment plumbing
- `Views/WelcomeView.swift` — first-run "tutorial or jump in?" screen
- `Views/TutorialView.swift` + `Model/TutorialFlow.swift` — banner-style step
  tutorial with nudge toasts and target highlighting
- `Views/LoadingView.swift` — bobbing mascot + animated dot ellipsis
- `Views/OptionsSheet.swift` — tabbed settings sheet pattern
- `Views/ResultBar.swift` — end-of-session card
- `Views/HomeView.swift` — landing screen layout
- `Views/RootView.swift` — `Screen` state machine

Always validate any new API by swapping Shroomsweeper to use it — if the swap
feels awkward, the API isn't done.

## In scope

- Color/theme tokens: `Palette`, `Appearance`, `@Environment(\.palette)`
- Typography helpers: rounded-system font shortcuts, "eyebrow" tracked-caps
  label style, monospaced number style
- Reusable views/styles: `LoadingView`, primary/secondary button styles,
  stat pill, sheet chrome, result bar
- Welcome screen scaffold — slots for mascot, copy, callbacks
- Tutorial scaffold: banner card view, nudge toast, step state machine
- Animation/haptics constants (durations, springs, sensory feedback triggers)
- Conventions: 44pt minimum tap targets, accessible defaults

## Out of scope

- Game-specific logic (no Minesweeper code, no boards, no scoring)
- Specific mascots / icons (consumer supplies its own — kit might define a
  protocol or generic slot)
- App-specific copy or vocabulary
- Persistence (each app handles its own UserDefaults keys for now)

## Conventions

- iOS 17+ minimum (matches Shroomsweeper)
- SwiftUI only — no UIKit, no Combine; use `async/await`
- `@Observable` (Swift 5.9+), not `ObservableObject`
- 4-space indentation; PascalCase types, camelCase members
- Public surface gets one-line doc comments only where the WHY is non-obvious —
  no boilerplate docstrings
- Views never hard-code colors — always read from `@Environment(\.palette)`
- Tap targets: **44pt minimum** (the user runs larger Dynamic Type and depends
  on this)
- Strong types; avoid force-unwrap
- Don't add backwards-compatibility shims while there's only one consumer —
  just update both the kit and Shroomsweeper together

## Package layout

Single target (`ShroomKit`) to start. Split into `ShroomTheme` /
`ShroomComponents` / `ShroomFlow` only if a consumer needs finer granularity.

Folder structure inside `Sources/ShroomKit/`:

```
Theme/         — Palette, Appearance, environment plumbing
Components/    — reusable views and button styles
Flow/          — Welcome/Tutorial scaffolds + Screen state machine helpers
Style/         — typography, animation, haptics constants
```

(Create folders as you fill them — don't pre-create empty ones.)

## Status

Scaffolded, empty. Next step: extract `Palette` + `Appearance` from
Shroomsweeper's `Theme/Theme.swift` into `Sources/ShroomKit/Theme/`, then
have Shroomsweeper add this package as a local dependency and import it.

## User context

The user is Michelle (michelle@waveformanalytics.com). She:

- Has poor eyesight and runs Dynamic Type larger than baseline — semantic
  fonts and 44pt+ tap targets are non-negotiable
- Prefers terse responses, no trailing summaries
- Will not want fake iOS UI mockups (use real screenshots/placeholders when
  documenting)
- Runs the marketing site at shroomgames.app from `~/dev/sites/shroomsweeper-site`
