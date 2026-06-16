import SwiftUI

private struct PaletteKey: EnvironmentKey {
    static let defaultValue: Palette = .forest
}

extension EnvironmentValues {
    public var palette: Palette {
        get { self[PaletteKey.self] }
        set { self[PaletteKey.self] = newValue }
    }
}
