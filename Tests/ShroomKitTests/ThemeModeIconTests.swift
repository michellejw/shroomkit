import Testing
@testable import ShroomKit

struct ThemeModeIconTests {
    @Test func iconNamesAreStable() {
        #expect(ThemeMode.system.iconName == "circle.lefthalf.filled")
        #expect(ThemeMode.forest.iconName == "sun.max.fill")
        #expect(ThemeMode.twilight.iconName == "moon.fill")
    }
}
