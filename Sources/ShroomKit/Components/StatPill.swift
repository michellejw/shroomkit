import SwiftUI

/// Non-interactive HUD readout: optional SF Symbol + monospaced-digit text in a pill.
public struct StatPill: View {
    private let text: String
    private let systemName: String?

    @Environment(\.palette) private var palette

    public init(_ text: String, systemName: String? = nil) {
        self.text = text
        self.systemName = systemName
    }

    public var body: some View {
        HStack(spacing: 6) {
            if let systemName {
                Image(systemName: systemName)
                    .font(.system(.caption, design: .rounded).weight(.semibold))
                    .foregroundStyle(palette.sub)
            }
            Text(text)
                .font(.system(.subheadline, design: .rounded).weight(.semibold))
                .foregroundStyle(palette.text)
                .monospacedDigit()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 7)
        .background(
            RoundedRectangle(cornerRadius: Radius.md, style: .continuous)
                .fill(palette.pill)
        )
    }
}
