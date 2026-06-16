import SwiftUI

/// User-facing theme preference. `.system` follows the device's Light/Dark
/// setting; `.forest` and `.twilight` are manual overrides matching `Palette`.
public enum ThemeMode: String, CaseIterable, Codable, Sendable {
    case system
    case forest
    case twilight

    public var label: String {
        switch self {
        case .system:   return "System"
        case .forest:   return "Light"
        case .twilight: return "Dark"
        }
    }

    /// Pass to `.preferredColorScheme(_:)`. `nil` means "follow the device."
    public var preferredColorScheme: ColorScheme? {
        switch self {
        case .system:   return nil
        case .forest:   return .light
        case .twilight: return .dark
        }
    }
}
