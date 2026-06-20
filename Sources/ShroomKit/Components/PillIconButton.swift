import SwiftUI

public extension ThemeMode {
    /// SF Symbol representing this theme in a cycle control.
    var iconName: String {
        switch self {
        case .system:   return "circle.lefthalf.filled"
        case .forest:   return "sun.max.fill"
        case .twilight: return "moon.fill"
        }
    }
}

/// 44pt icon-only button in a pill (rounded-rect or circle). The
/// `accessibilityLabel` is required so icon buttons are never unlabeled.
public struct PillIconButton: View {
    public enum Shape { case roundedRect, circle }

    private let systemName: String
    private let label: String
    private let shape: Shape
    private let isEnabled: Bool
    private let action: () -> Void

    @Environment(\.palette) private var palette

    public init(systemName: String, accessibilityLabel: String,
                shape: Shape = .roundedRect, isEnabled: Bool = true,
                action: @escaping () -> Void) {
        self.systemName = systemName
        self.label = accessibilityLabel
        self.shape = shape
        self.isEnabled = isEnabled
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.system(.body, design: .rounded).weight(.semibold))
                .foregroundStyle(palette.sub.opacity(isEnabled ? 1 : 0.35))
                .frame(minWidth: 44, minHeight: 44)
                .background(background)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .disabled(!isEnabled)
        .accessibilityLabel(label)
    }

    @ViewBuilder private var background: some View {
        switch shape {
        case .roundedRect:
            RoundedRectangle(cornerRadius: Radius.md, style: .continuous).fill(palette.pill)
        case .circle:
            Circle().fill(palette.pill)
        }
    }
}
