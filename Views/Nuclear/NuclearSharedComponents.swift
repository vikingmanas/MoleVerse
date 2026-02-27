import SwiftUI

struct SimulationHeader: View {
    let title: String
    var subtitle: String? = nil
    let onDismiss: () -> Void

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(DesignSystem.Typography.heading(22))
                    .foregroundStyle(.white)

                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(DesignSystem.Typography.monospaced(13))
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                }
            }

            Spacer()

            Button(action: onDismiss) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(.title))
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.white.opacity(0.5))
            }
            .accessibilityLabel("Close")
        }
        .padding(.horizontal, DesignSystem.Spacing.xl)
        .padding(.top, DesignSystem.Spacing.lg)
    }
}

struct SimulationButton: View {
    let label: String
    var color: Color = DesignSystem.Colors.primary
    var isDisabled: Bool = false
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(.headline, design: .rounded, weight: .semibold))
                .foregroundStyle(.black)
                .padding(.vertical, DesignSystem.Spacing.lg)
                .frame(maxWidth: .infinity)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: DesignSystem.Radius.md, style: .continuous))
        }
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.5 : 1.0)
        .padding(.horizontal, DesignSystem.Spacing.xl)
        .padding(.bottom, DesignSystem.Spacing.xxl)
    }
}

struct SineWaveShape: Shape {
    let frequency: Double
    let amplitude: Double

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let midY = rect.height / 2
        path.move(to: CGPoint(x: 0, y: midY))

        for x in stride(from: 0, through: rect.width, by: 1) {
            let relativeX = x / rect.width
            let y = midY + sin(relativeX * 2 * .pi * frequency) * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
        }

        return path
    }
}
