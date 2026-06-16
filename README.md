# ShroomKit

A small SwiftUI design-system and onboarding-scaffolding package for Shroom Games apps.

See `CLAUDE.md` for the full design philosophy, scope, and what lives where.

## Quick consume (local path)

In a consumer Xcode project: **File → Add Package Dependencies… → Add Local…** and point at this folder, then `import ShroomKit` and use `@Environment(\.palette)`.

## Status

Just scaffolded. Next: extract `Palette` + `Appearance` from Shroomsweeper into `Sources/ShroomKit/Theme/`.
