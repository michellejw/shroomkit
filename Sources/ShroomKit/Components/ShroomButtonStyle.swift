import SwiftUI

/// Full-width CTA styles. Apply to a `Button` whose label is plain text.
public struct ShroomButtonStyle: ButtonStyle {
    public enum Kind { case primary, secondary, outline }

    let kind: Kind
    let prominent: Bool

    @Environment(\.palette) private var palette

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(prominent ? .title3 : .headline, design: .rounded).weight(.semibold))
            .foregroundStyle(foreground)
            .frame(maxWidth: .infinity)
            .frame(minHeight: 44)
            .padding(.vertical, prominent ? 14 : 10)
            .background(background)
            .contentShape(Rectangle())
            .opacity(configuration.isPressed ? 0.9 : 1)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }

    private var foreground: Color {
        switch kind {
        case .primary:             palette.accentText
        case .secondary, .outline: palette.text
        }
    }

    @ViewBuilder private var background: some View {
        let shape = RoundedRectangle(cornerRadius: Radius.xl, style: .continuous)
        switch kind {
        case .primary:   shape.fill(palette.accent)
        case .secondary: shape.fill(palette.pill)
        case .outline:   shape.fill(palette.tierBg).overlay(shape.strokeBorder(palette.tierBorder, lineWidth: 1))
        }
    }
}

public extension ButtonStyle where Self == ShroomButtonStyle {
    static var shroomPrimary: ShroomButtonStyle { .init(kind: .primary, prominent: false) }
    static func shroomPrimary(prominent: Bool) -> ShroomButtonStyle { .init(kind: .primary, prominent: prominent) }
    static var shroomSecondary: ShroomButtonStyle { .init(kind: .secondary, prominent: false) }
    static var shroomOutline: ShroomButtonStyle { .init(kind: .outline, prominent: false) }
}
