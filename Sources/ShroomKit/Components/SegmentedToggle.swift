import SwiftUI

/// Generic pill-style segmented control. Each segment carries an arbitrary
/// leading glyph (custom shape or SF Symbol). The active segment gets the
/// `.isSelected` accessibility trait.
public struct SegmentedToggle<Value: Hashable>: View {
    public struct Segment: Identifiable {
        public let id: Value
        let title: String
        let icon: AnyView
        public init(_ value: Value, title: String, @ViewBuilder icon: () -> some View) {
            self.id = value
            self.title = title
            self.icon = AnyView(icon())
        }
    }

    @Binding private var selection: Value
    private let segments: [Segment]

    @Environment(\.palette) private var palette

    public init(selection: Binding<Value>, segments: [Segment]) {
        self._selection = selection
        self.segments = segments
    }

    public var body: some View {
        HStack(spacing: 6) {
            ForEach(segments) { segment in
                let isActive = segment.id == selection
                Button { selection = segment.id } label: {
                    HStack(spacing: 7) {
                        segment.icon
                        Text(segment.title)
                            .font(.system(.subheadline, design: .rounded).weight(.semibold))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: 44)
                    .padding(.vertical, 4)
                    .foregroundStyle(isActive ? palette.accentText : palette.sub)
                    .background(
                        RoundedRectangle(cornerRadius: Radius.md, style: .continuous)
                            .fill(isActive ? palette.accent : Color.clear)
                    )
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .accessibilityAddTraits(isActive ? .isSelected : [])
                .animation(.easeInOut(duration: 0.15), value: isActive)
            }
        }
        .padding(5)
        .background(
            RoundedRectangle(cornerRadius: Radius.xl, style: .continuous)
                .fill(palette.pill)
        )
    }
}
