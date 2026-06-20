import SwiftUI

/// Tracked, uppercased caption used as a quiet section/card header.
/// Pass sentence-case text — uppercasing is visual only, so VoiceOver reads the word.
public struct EyebrowLabel: View {
    public enum Tint { case sub, accent }

    private let text: String
    private let tint: Tint

    @Environment(\.palette) private var palette

    public init(_ text: String, tint: Tint = .sub) {
        self.text = text
        self.tint = tint
    }

    public var body: some View {
        Text(text)
            .font(.system(.caption, design: .rounded).weight(.semibold))
            .tracking(FontTracking.eyebrow)
            .textCase(.uppercase)
            .foregroundStyle(tint == .accent ? palette.accent : palette.sub)
    }
}
