import SwiftUI

/// Cozy first-run welcome screen scaffold. Mascot tile + heading + tagline +
/// primary/secondary CTA. The mascot is supplied by the consuming app via a
/// `@ViewBuilder` closure; copy and callbacks are passed in.
public struct WelcomeScaffold<Mascot: View>: View {
    private let title: String
    private let tagline: String
    private let primaryLabel: String
    private let secondaryLabel: String
    private let onPrimary: () -> Void
    private let onSecondary: () -> Void
    private let mascot: Mascot

    @Environment(\.palette) private var palette

    public init(
        title: String,
        tagline: String,
        primaryLabel: String = "Show me how to play",
        secondaryLabel: String = "Jump right in",
        onPrimary: @escaping () -> Void,
        onSecondary: @escaping () -> Void,
        @ViewBuilder mascot: () -> Mascot
    ) {
        self.title = title
        self.tagline = tagline
        self.primaryLabel = primaryLabel
        self.secondaryLabel = secondaryLabel
        self.onPrimary = onPrimary
        self.onSecondary = onSecondary
        self.mascot = mascot()
    }

    public var body: some View {
        VStack(spacing: 38) {
            Spacer(minLength: 0)
            VStack(spacing: 14) {
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .fill(palette.pill)
                    .frame(width: 90, height: 90)
                    .overlay(mascot.frame(width: 52, height: 52))
                Text(title)
                    .font(.system(.title, design: .rounded).weight(.semibold))
                    .foregroundStyle(palette.text)
                    .multilineTextAlignment(.center)
                Text(tagline)
                    .font(.system(.callout, design: .rounded))
                    .foregroundStyle(palette.sub)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 290)
                    .lineSpacing(2)
            }
            VStack(spacing: 11) {
                Button(primaryLabel, action: onPrimary)
                    .buttonStyle(.shroomPrimary)

                Button(secondaryLabel, action: onSecondary)
                    .buttonStyle(.shroomSecondary)
            }
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(palette.appBg.ignoresSafeArea())
    }
}
