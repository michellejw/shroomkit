import Testing
import SwiftUI
@testable import ShroomKit

struct TokenGenerationTests {
    @Test func forestColorsMatchKnownGood() {
        #expect(Palette.forest.appBg == Color(hex: 0xF3EFE4))
        #expect(Palette.forest.accent == Color(hex: 0x6E8B4E))
        #expect(Palette.forest.sub == Color(hex: 0x8C8C74))
    }

    @Test func twilightColorsMatchKnownGood() {
        #expect(Palette.twilight.appBg == Color(hex: 0x161B22))
        #expect(Palette.twilight.accent == Color(hex: 0x6FBFA8))
    }

    @Test func warnAliasesMushroomCap() {
        #expect(Palette.forest.warn == Palette.forest.mushroomCap)
        #expect(Palette.twilight.warn == Palette.twilight.mushroomCap)
    }

    @Test func numberColorsShape() {
        #expect(Palette.forest.numberColors.count == 9)
        #expect(Palette.forest.numberColors[0] == Color.clear)
        #expect(Palette.forest.numberColors[1] == Color(hex: 0x5C8C57))
    }

    @Test func radiusScale() {
        #expect(Radius.md == 12)
        #expect(Radius.pill == 22)
    }

    @Test func spaceScale() {
        #expect(Space.sm == 12)
        #expect(Space.xl == 32)
    }
}
