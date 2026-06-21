import Testing
@testable import ShroomKit

struct NudgeToneTests {
    @Test func iconNamesAreStable() {
        #expect(NudgeTone.guidance.iconName == "lightbulb.fill")
        #expect(NudgeTone.warning.iconName == "exclamationmark.circle.fill")
    }

    @Test func accessibilityPrefixesAreStable() {
        #expect(NudgeTone.guidance.accessibilityPrefix == "Tip")
        #expect(NudgeTone.warning.accessibilityPrefix == "Warning")
    }
}
