import SwiftUI

/// Tappable radio-style selection row: title + subtitle + radio dot, with
/// selected chrome and the `.isSelected` accessibility trait.
public struct SelectionCard: View {
    private let title: String
    private let subtitle: String
    private let isSelected: Bool
    private let action: () -> Void

    @Environment(\.palette) private var palette

    public init(title: String, subtitle: String, isSelected: Bool, action: @escaping () -> Void) {
        self.title = title
        self.subtitle = subtitle
        self.isSelected = isSelected
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(.headline, design: .rounded))
                        .foregroundStyle(palette.text)
                    Text(subtitle)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundStyle(palette.sub)
                }
                Spacer()
                ZStack {
                    Circle()
                        .stroke(isSelected ? palette.accent : palette.tierBorder, lineWidth: 2)
                        .frame(width: 22, height: 22)
                    if isSelected {
                        Circle().fill(palette.accent).frame(width: 12, height: 12)
                    }
                }
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 15)
            .frame(minHeight: 44)
            .background(
                RoundedRectangle(cornerRadius: Radius.xl, style: .continuous)
                    .fill(isSelected ? palette.tierSelBg : palette.tierBg)
                    .overlay(
                        RoundedRectangle(cornerRadius: Radius.xl, style: .continuous)
                            .strokeBorder(isSelected ? palette.accent : palette.tierBorder, lineWidth: 2)
                    )
            )
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }
}
