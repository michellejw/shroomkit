import SwiftUI

/// End-of-session card: app-supplied badge + title/subtitle (+ optional accent
/// note) and a secondary/primary button pair.
public struct ResultCard<Badge: View>: View {
    private let title: String
    private let subtitle: String
    private let note: String?
    private let primaryLabel: String
    private let onPrimary: () -> Void
    private let secondaryLabel: String
    private let onSecondary: () -> Void
    private let badge: Badge

    @Environment(\.palette) private var palette

    public init(title: String, subtitle: String, note: String? = nil,
                primaryLabel: String, onPrimary: @escaping () -> Void,
                secondaryLabel: String, onSecondary: @escaping () -> Void,
                @ViewBuilder badge: () -> Badge) {
        self.title = title
        self.subtitle = subtitle
        self.note = note
        self.primaryLabel = primaryLabel
        self.onPrimary = onPrimary
        self.secondaryLabel = secondaryLabel
        self.onSecondary = onSecondary
        self.badge = badge()
    }

    public var body: some View {
        VStack(spacing: 14) {
            HStack(spacing: 12) {
                badge
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(.callout, design: .rounded).weight(.semibold))
                        .foregroundStyle(palette.text)
                    Text(subtitle)
                        .font(.system(.footnote, design: .rounded))
                        .foregroundStyle(palette.sub)
                        .fixedSize(horizontal: false, vertical: true)
                    if let note {
                        Text(note)
                            .font(.system(.caption, design: .rounded).weight(.medium))
                            .foregroundStyle(palette.accent)
                    }
                }
                Spacer(minLength: 0)
            }
            HStack(spacing: 10) {
                Button(secondaryLabel, action: onSecondary).buttonStyle(.shroomOutline)
                Button(primaryLabel, action: onPrimary).buttonStyle(.shroomPrimary)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: Radius.xl, style: .continuous)
                .fill(palette.pill)
        )
    }
}
