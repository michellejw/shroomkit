import SwiftUI

/// Tutorial step banner: a pill card wrapping an optional eyebrow + trailing
/// action, a title, a body message, and an optional footer (e.g. a CTA).
/// Flow content is consumer-supplied; the kit owns only the chrome. The
/// header row (eyebrow + trailing) renders only when `eyebrow` is non-nil —
/// the trailing slot rides with the eyebrow.
public struct TutorialBannerCard<Trailing: View, Footer: View>: View {
    private let eyebrow: String?
    private let title: String
    private let message: String
    private let trailing: Trailing
    private let footer: Footer

    @Environment(\.palette) private var palette

    public init(
        eyebrow: String? = nil,
        title: String,
        message: String,
        @ViewBuilder trailing: () -> Trailing = { EmptyView() },
        @ViewBuilder footer: () -> Footer = { EmptyView() }
    ) {
        self.eyebrow = eyebrow
        self.title = title
        self.message = message
        self.trailing = trailing()
        self.footer = footer()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if let eyebrow {
                HStack {
                    EyebrowLabel(eyebrow, tint: .accent)
                    Spacer()
                    trailing
                }
            }
            Text(title)
                .font(.system(.title3, design: .rounded).weight(.semibold))
                .foregroundStyle(palette.text)
                .padding(.top, eyebrow == nil ? 0 : 2)
            Text(message)
                .font(.system(.callout, design: .rounded))
                .foregroundStyle(palette.sub)
                .lineSpacing(2)
                .fixedSize(horizontal: false, vertical: true)
            footer
        }
        .padding(.horizontal, Space.md)
        .padding(.vertical, 14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: Radius.xxl, style: .continuous)
                .fill(palette.pill)
        )
    }
}
