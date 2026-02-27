import SwiftUI

struct AlphaDecayView: View {
    @Environment(\.dismiss) var dismiss

    @State private var phase = 0
    @State private var alphaOffset: CGFloat = 0
    @State private var nucleusColor: Color = Color(red: 0.8, green: 0.8, blue: 0.9)
    @State private var nucleusScale: CGFloat = 1.0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                DesignSystem.Colors.background.ignoresSafeArea()

                VStack(spacing: 0) {
                    SimulationHeader(
                        title: "Alpha Decay",
                        subtitle: "²¹⁰Po → ²⁰⁶Pb + ⁴He",
                        onDismiss: { dismiss() }
                    )

                    Spacer()

                    ZStack {
                        if phase >= 1 {
                            ZStack {
                                Circle()
                                    .fill(Color.yellow)
                                    .frame(width: 40, height: 40)
                                    .shadow(color: .yellow.opacity(0.6), radius: 10)
                                Text("α")
                                    .font(.system(.title2, weight: .bold))
                                    .foregroundStyle(.black)
                            }
                            .offset(x: alphaOffset)
                            .opacity(phase == 0 ? 0 : 1)
                        }

                        ZStack {
                            Circle()
                                .fill(
                                    RadialGradient(
                                        gradient: Gradient(colors: [nucleusColor.opacity(0.8), nucleusColor.opacity(0.2)]),
                                        center: .center,
                                        startRadius: 5,
                                        endRadius: 100
                                    )
                                )
                                .frame(width: 200, height: 200)
                                .overlay(
                                    Circle().strokeBorder(nucleusColor.opacity(0.4), lineWidth: 1)
                                )
                                .scaleEffect(nucleusScale)
                                .shadow(color: nucleusColor.opacity(0.4), radius: 16)
                                .overlay {
                                    Circle()
                                        .fill(.ultraThinMaterial)
                                        .frame(width: 180, height: 180)
                                        .scaleEffect(nucleusScale)
                                }

                            Text(phase == 2 ? "Pb-206" : "Po-210")
                                .font(DesignSystem.Typography.heading(30))
                                .foregroundStyle(.white)
                                .shadow(color: .black.opacity(0.3), radius: 4)
                                .scaleEffect(nucleusScale)
                        }
                        .offset(x: phase == 2 ? -20 : 0)
                    }
                    .frame(height: 300)

                    Text(phase == 2 ? "Polonium ejects a Helium nucleus to reach stability." : "Unstable Nucleus")
                        .font(DesignSystem.Typography.body(15))
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, DesignSystem.Spacing.xl)
                        .padding(.top, DesignSystem.Spacing.xxxl)

                    Spacer()

                    SimulationButton(
                        label: phase == 0 ? "Trigger Decay" : "Reset",
                        color: DesignSystem.Colors.secondary,
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
                alphaOffset = 0
                nucleusColor = Color(red: 0.8, green: 0.8, blue: 0.9)
                nucleusScale = 1.0
            }
            return
        }

        phase = 1
        withAnimation(Animation.linear(duration: 0.1).repeatCount(10, autoreverses: true)) {
            nucleusScale = 1.05
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            HapticManager.shared.playFusionBuildup()

            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                phase = 2
                alphaOffset = width * 0.4
                nucleusColor = Color.gray
                nucleusScale = 0.9
            }

            AudioManager.shared.playNuclearEffect(type: "fission")
        }
    }
}
