import SwiftUI

struct AntimatterAnnihilationView: View {
    @Environment(\.dismiss) var dismiss

    @State private var radius: CGFloat = 150
    @State private var rotation: Double = 0
    @State private var isAnnihilated = false
    @State private var gammaOffset: CGFloat = 0
    @State private var flashOpacity: Double = 0.0
    @State private var isRunning = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                DesignSystem.Colors.background.ignoresSafeArea()
                Color.white.opacity(flashOpacity).ignoresSafeArea()

                VStack(spacing: 0) {
                    SimulationHeader(
                        title: "Annihilation",
                        subtitle: "e⁻ + e⁺ → 2γ (1.022 MeV)",
                        onDismiss: { dismiss() }
                    )

                    Spacer()

                    ZStack {
                        if isAnnihilated {

                            ZStack {
                                SineWaveShape(frequency: 10, amplitude: 10)
                                    .stroke(DesignSystem.Colors.accent, lineWidth: 2)
                                    .frame(width: 100, height: 40)
                                    .offset(x: gammaOffset)
                                    .glow(color: DesignSystem.Colors.accent, radius: 8)

                                SineWaveShape(frequency: 10, amplitude: 10)
                                    .stroke(DesignSystem.Colors.accent, lineWidth: 2)
                                    .frame(width: 100, height: 40)
                                    .rotationEffect(.degrees(180))
                                    .offset(x: -gammaOffset)
                                    .glow(color: DesignSystem.Colors.accent, radius: 8)
                            }
                        } else {

                            ZStack {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 22, height: 22)
                                    .shadow(color: .blue.opacity(0.6), radius: 8)
                                    .overlay(Text("−").font(.system(.footnote, weight: .bold)).foregroundStyle(.white))
                                    .offset(x: radius)
                                    .rotationEffect(.degrees(rotation))

                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 22, height: 22)
                                    .shadow(color: .red.opacity(0.6), radius: 8)
                                    .overlay(Text("+").font(.system(.footnote, weight: .bold)).foregroundStyle(.white))
                                    .offset(x: -radius)
                                    .rotationEffect(.degrees(rotation))
                            }
                        }
                    }
                    .frame(height: 300)

                    Text(isAnnihilated ? "Mass converted to pure Energy (Gamma Rays)." : "Collision Imminent")
                        .font(DesignSystem.Typography.body(15))
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, DesignSystem.Spacing.xl)
                        .padding(.top, DesignSystem.Spacing.xxxl)

                    Spacer()

                    SimulationButton(
                        label: isRunning ? "Reset" : "Collide",
                        color: DesignSystem.Colors.accent,
                        isDisabled: isRunning && !isAnnihilated
                    ) {
                        runSimulation(width: geometry.size.width)
                    }
                }
            }
            .onAppear {
                radius = geometry.size.width * 0.35
            }
        }
    }

    func runSimulation(width: CGFloat) {
        if isAnnihilated {
            withAnimation {
                radius = width * 0.35
                rotation = 0
                isAnnihilated = false
                gammaOffset = 0
                flashOpacity = 0
                isRunning = false
            }
            return
        }

        isRunning = true

        let duration: Double = 2.0
        withAnimation(.easeIn(duration: duration)) {
            radius = 0
            rotation = 720
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            HapticManager.shared.playNuclearExplosion()
            AudioManager.shared.playNuclearEffect(type: "fission")

            withAnimation(.easeOut(duration: 0.1)) {
                flashOpacity = 1.0
                isAnnihilated = true
            }

            withAnimation(.easeOut(duration: 0.5).delay(0.1)) {
                flashOpacity = 0.0
            }

            withAnimation(.linear(duration: 1.0)) {
                gammaOffset = width * 0.4
            }
        }
    }
}
