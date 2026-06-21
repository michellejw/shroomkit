import SwiftUI

/// The tone of a tutorial nudge — drives icon, tint, and the VoiceOver prefix.
public enum NudgeTone {
    case guidance
    case warning

    var iconName: String {
        switch self {
        case .guidance: "lightbulb.fill"
        case .warning: "exclamationmark.circle.fill"
        }
    }

    var accessibilityPrefix: String {
        switch self {
        case .guidance: "Tip"
        case .warning: "Warning"
        }
    }
}

/// A transient tutorial coaching pill: leading tone icon + message inside a
/// tone-tinted border. Placement and transition are the consumer's job — drop
/// this into a board overlay or a fixed-height slot as the flow requires.
/// No drop-shadow: the tinted border carries float definition in both themes
/// (a hardcoded `.black` shadow was invisible on twilight's dark background).
public struct NudgeToast: View {
    private let message: String
    private let tone: NudgeTone

    @Environment(\.palette) private var palette

    public init(_ message: String, tone: NudgeTone = .guidance) {
        self.message = message
        self.tone = tone
    }

    private var tint: Color {
        switch tone {
        case .guidance: palette.accent
        case .warning: palette.warn
        }
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: tone.iconName)
                .font(.system(.footnote, design: .rounded).weight(.semibold))
                .foregroundStyle(tint)
            Text(message)
                .font(.system(.subheadline, design: .rounded).weight(.semibold))
                .foregroundStyle(palette.text)
                .fixedSize(horizontal: false, vertical: true)
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 13)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: Radius.md, style: .continuous)
                .fill(palette.tierSelBg)
                .overlay(
                    RoundedRectangle(cornerRadius: Radius.md, style: .continuous)
                        .stroke(tint, lineWidth: 1.5)
                )
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(tone.accessibilityPrefix): \(message)")
    }
}
