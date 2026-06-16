import SwiftUI

/// Cozy full-screen launch/transition loader. Bobbing mascot + animated dot
/// ellipsis. The mascot is supplied by the consuming app via a `@ViewBuilder`
/// closure so each game keeps its own glyph.
public struct LoadingView<Mascot: View>: View {
    private let message: String
    private let mascot: Mascot

    @Environment(\.palette) private var palette
    @State private var bob: Bool = false
    @State private var dotPhase: Int = 0

    public init(message: String = "Loading", @ViewBuilder mascot: () -> Mascot) {
        self.message = message
        self.mascot = mascot()
    }

    public var body: some View {
        VStack(spacing: 18) {
            Spacer()
            mascot
                .frame(width: 72, height: 72)
                .scaleEffect(bob ? 1.06 : 0.94)
                .offset(y: bob ? -4 : 4)
                .animation(
                    .easeInOut(duration: 0.75).repeatForever(autoreverses: true),
                    value: bob
                )
            HStack(spacing: 0) {
                Text(message)
                    .font(.system(.title2, design: .rounded).weight(.semibold))
                    .foregroundStyle(palette.sub)
                Text(String(repeating: ".", count: dotPhase))
                    .font(.system(.title2, design: .rounded).weight(.semibold))
                    .foregroundStyle(palette.sub)
                    .frame(width: 26, alignment: .leading)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(palette.appBg.ignoresSafeArea())
        .onAppear { bob = true }
        .task {
            while !Task.isCancelled {
                try? await Task.sleep(for: .milliseconds(380))
                if Task.isCancelled { return }
                dotPhase = (dotPhase + 1) % 4
            }
        }
    }
}
