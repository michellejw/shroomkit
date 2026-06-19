import Testing
import SwiftUI
@testable import ShroomKit

/// Guards that the generated `Palette` keeps every known-good value, so a
/// generator regression can't silently ship a wrong color. Values are the
/// original hand-authored palette (the frozen source of truth).
struct TokenGenerationTests {
    /// (property, expected hex) for all 23 stored colors. Order matches the
    /// frozen `Palette` surface.
    private static func colorChecks(forest: Bool) -> [(KeyPath<Palette, Color>, UInt32)] {
        forest
            ? [
                (\.appBg, 0xF3EFE4), (\.boardBg, 0xECE6D6), (\.text, 0x3A3D30),
                (\.sub, 0x8C8C74), (\.pill, 0xEAE4D4), (\.accent, 0x6E8B4E),
                (\.accentText, 0xFBF9F1), (\.tileCovered, 0xAEBE8F), (\.tileCoveredHi, 0xC0CEA1),
                (\.tileCoveredEdge, 0x93A675), (\.tileRevealed, 0xFBF9F1), (\.tileRevealedEdge, 0xE8E2D0),
                (\.mushroomCap, 0xC5603F), (\.mushroomStem, 0xD6A458), (\.mushroomSpot, 0xEBCBA2),
                (\.explodeBg, 0xE3B3A1), (\.markerPost, 0x7A5B45), (\.markerSign, 0xC5603F),
                (\.markerInk, 0xFBF3E8), (\.emptyMark, 0xA4B187), (\.tierBorder, 0xE1DBC9),
                (\.tierBg, 0xFBF9F1), (\.tierSelBg, 0xEFF2E2),
            ]
            : [
                (\.appBg, 0x161B22), (\.boardBg, 0x10151B), (\.text, 0xE7EAEE),
                (\.sub, 0x7E8893), (\.pill, 0x222A34), (\.accent, 0x6FBFA8),
                (\.accentText, 0x0E1318), (\.tileCovered, 0x29313B), (\.tileCoveredHi, 0x333D48),
                (\.tileCoveredEdge, 0x1E252E), (\.tileRevealed, 0x1B212A), (\.tileRevealedEdge, 0x262E38),
                (\.mushroomCap, 0xE0B25A), (\.mushroomStem, 0xF2E8CE), (\.mushroomSpot, 0xC58A3C),
                (\.explodeBg, 0x7C3B33), (\.markerPost, 0x6B5640), (\.markerSign, 0xE0B25A),
                (\.markerInk, 0x1B212A), (\.emptyMark, 0x39434F), (\.tierBorder, 0x2B3440),
                (\.tierBg, 0x1E2630), (\.tierSelBg, 0x22302E),
            ]
    }

    private static let forestNumbers: [UInt32] = [0x5C8C57, 0x3E7C8C, 0xC5603F, 0x7A5BA6, 0xB8893B, 0x3E8C7C, 0x7A5B45, 0x6B6B6B]
    private static let twilightNumbers: [UInt32] = [0x7FB0E0, 0x83C9A0, 0xE59B7E, 0xB79AE0, 0xE0C57E, 0x79C9C9, 0xC9A78F, 0xAEB4BC]

    @Test func forestPaletteMatchesKnownGood() {
        let p = Palette.forest
        for (kp, hex) in Self.colorChecks(forest: true) {
            #expect(p[keyPath: kp] == Color(hex: hex))
        }
    }

    @Test func twilightPaletteMatchesKnownGood() {
        let p = Palette.twilight
        for (kp, hex) in Self.colorChecks(forest: false) {
            #expect(p[keyPath: kp] == Color(hex: hex))
        }
    }

    @Test func numberColorsMatchKnownGood() {
        for (theme, expected) in [(Palette.forest, Self.forestNumbers), (Palette.twilight, Self.twilightNumbers)] {
            #expect(theme.numberColors.count == 9)
            #expect(theme.numberColors[0] == Color.clear)
            for (i, hex) in expected.enumerated() {
                #expect(theme.numberColors[i + 1] == Color(hex: hex))
            }
        }
    }

    @Test func warnAliasesMushroomCap() {
        #expect(Palette.forest.warn == Palette.forest.mushroomCap)
        #expect(Palette.twilight.warn == Palette.twilight.mushroomCap)
    }

    @Test func radiusScale() {
        #expect(Radius.sm == 10)
        #expect(Radius.md == 12)
        #expect(Radius.lg == 14)
        #expect(Radius.xl == 16)
        #expect(Radius.xxl == 18)
        #expect(Radius.pill == 22)
    }

    @Test func spaceScale() {
        #expect(Space.xxs == 4)
        #expect(Space.xs == 8)
        #expect(Space.sm == 12)
        #expect(Space.md == 16)
        #expect(Space.lg == 24)
        #expect(Space.xl == 32)
    }
}
