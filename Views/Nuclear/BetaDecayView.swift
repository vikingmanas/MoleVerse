import SwiftUI

struct BetaDecayView: View {
    @Environment(\.dismiss) var dismiss

    @State private var phase = 0
    @State private var electronOffset: CGFloat = 0
    @State private var neutronColor: Color = .gray
    @State private var flashOpacity: Double = 0.0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                DesignSystem.Colors.background.ignoresSafeArea()
                Color.white.opacity(flashOpacity).ignoresSafeArea()

                VStack(spacing: 0) {
                    SimulationHeader(
                        title: "Beta Decay",
                        subtitle: "n → p + e⁻ + ν̄ₑ",
                        onDismiss: { dismiss() }
                    )

                    Spacer()

                    ZStack {
                        if phase >= 1 {
                            Circle()
                                .fill(Color.cyan)
                                .frame(width: 10, height: 10)
                                .shadow(color: .cyan.opacity(0.6), radius: 8)
                                .offset(x: electronOffset, y: -50)
                                .opacity(phase == 0 ? 0 : 1)
                        }

                        ZStack {
                            ForEach(0..<13) { i in
                                Circle()
                                    .fill(i % 2 == 0 ? Color.red.opacity(0.8) : Color.gray.opacity(0.6))
                                    .frame(width: 28, height: 28)
                                    .offset(x: CGFloat.random(in: -40...40), y: CGFloat.random(in: -40...40))
                            }

                            Circle()
                                .fill(neutronColor)
                                .frame(width: 30, height: 30)
                                .offset(x: 10, y: -10)
                                .shadow(color: neutronColor.opacity(0.6), radius: phase == 1 ? 16 : 0)
                                .overlay(
                                    Text(phase == 2 ? "p+" : "n")
                                        .font(.system(.caption, design: .monospaced, weight: .bold))
                                        .foregroundStyle(.white)
                                )
                        }
                        .frame(width: 150, height: 150)
                    }
                    .frame(height: 300)

                    Text(phase == 2 ? "A neutron turns into a proton, emitting a high-speed electron." : "Unstable Isotope")
                        .font(DesignSystem.Typography.body(15))
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, DesignSystem.Spacing.xl)
                        .padding(.top, DesignSystem.Spacing.xxxl)

                    Spacer()

                    SimulationButton(
                        label: phase == 0 ? "Trigger Decay" : "Reset",
                        color: DesignSystem.Colors.primary,
                        isDisabled: phase == 1
                    ) {
                        runSimulation(width: geometry.size.width)
                    }
                }
            }
        }
    }

    func runSimulation(width: CGFloat) {
        if phase == 2 {
            withAnimation {
                phase = 0
                electronOffset = 0
                neutronColor = .gray
                flashOpacity = 0
            }
            return
        }

        phase = 1

        withAnimation(.easeIn(duration: 0.5)) {
            neutronColor = .white
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeOut(duration: 0.1)) {
                flashOpacity = 0.3
            }
            withAnimation(.easeOut(duration: 0.3).delay(0.1)) {
                flashOpacity = 0.0
            }

            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                phase = 2
                neutronColor = .red
                electronOffset = width * 0.5
            }

            HapticManager.shared.playOrbitFeedback()
            AudioManager.shared.playNuclearEffect(type: "fission")
        }
    }
}
