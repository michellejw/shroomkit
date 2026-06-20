import SwiftUI

/// Screen header skeleton: optional back button + title (+ optional eyebrow
/// subtitle) + a trailing slot for screen-specific actions.
public struct ScreenHeader<Trailing: View>: View {
    private let title: String
    private let subtitle: String?
    private let onBack: (() -> Void)?
    private let trailing: Trailing

    @Environment(\.palette) private var palette

    public init(_ title: String, subtitle: String? = nil, onBack: (() -> Void)?,
                @ViewBuilder trailing: () -> Trailing = { EmptyView() }) {
        self.title = title
        self.subtitle = subtitle
        self.onBack = onBack
        self.trailing = trailing()
    }

    public var body: some View {
        HStack(spacing: 12) {
            if let onBack {
                PillIconButton(systemName: "chevron.left", accessibilityLabel: "Back", action: onBack)
            }
            VStack(alignment: .leading, spacing: 1) {
                if let subtitle { EyebrowLabel(subtitle) }
                Text(title)
                    .font(.system(.title2, design: .rounded).weight(.semibold))
                    .foregroundStyle(palette.text)
            }
            Spacer()
            trailing
        }
    }
}
