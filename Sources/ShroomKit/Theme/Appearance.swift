import Foundation

public enum Appearance: String, CaseIterable, Codable {
    case forest
    case twilight

    public var label: String {
        switch self {
        case .forest:   return "Light"
        case .twilight: return "Dark"
        }
    }
}
