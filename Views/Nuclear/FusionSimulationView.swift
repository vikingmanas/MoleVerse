import SwiftUI

struct FusionSimulationView: View {
    @Environment(\.dismiss) var dismiss

    @State private var deuteriumOffset: CGFloat = -200
    @State private var tritiumOffset: CGFloat = 200
    @State private var isFused = false
    @State private var showEnergy = false
    @State private var phase = 0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                DesignSystem.Colors.background.ignoresSafeArea()

                if showEnergy {
                    RadialGradient(colors: [DesignSystem.Colors.primary, .clear], center: .center, startRadius: 0, endRadius: 300)
                        .opacity(0.8)
                }

                VStack(spacing: 0) {
                    SimulationHeader(
                        title: "Nuclear Fusion",
                        subtitle: "D + T → He-4 + n + 17.6 MeV",
                        onDismiss: { dismiss() }
                    )

                    Spacer()

                    ZStack {
                        if isFused {
                            NucleusView(protons: 2, neutrons: 2, label: "He-4", color: .red)
                                .glow(color: .red, radius: 20)

                            Circle()
                                .fill(Color.white)
                                .frame(width: 14, height: 14)
                                .shadow(color: .cyan.opacity(0.6), radius: 8)
                                .offset(x: geometry.size.width * 0.8, y: -200)
                        } else {
                            NucleusView(protons: 1, neutrons: 1, label: "H-2", color: .red)
                                .offset(x: deuteriumOffset, y: 0)

                            NucleusView(protons: 1, neutrons: 2, label: "H-3", color: .blue)
                                .offset(x: tritiumOffset, y: 0)
                        }
                    }
                    .frame(height: 300)

                    Spacer()

                    SimulationButton(
                        label: phase == 0 ? "Ignite Fusion" : "Reset",
                        color: DesignSystem.Colors.secondary,
                        isDisabled: phase == 1
                    ) {
                        runSimulation(width: geometry.size.width)
                    }
                }
            }
            .onAppear {
                deuteriumOffset = -geometry.size.width * 0.4
                tritiumOffset = geometry.size.width * 0.4
            }
        }
    }

    func runSimulation(width: CGFloat) {
        if phase == 2 {
            withAnimation {
                phase = 0
                deuteriumOffset = -width * 0.4
                tritiumOffset = width * 0.4
                isFused = false
                showEnergy = false
            }
            return
        }

        phase = 1

        withAnimation(.easeIn(duration: 1.5)) {
            deuteriumOffset = -10
            tritiumOffset = 10
        }

        HapticManager.shared.playFusionBuildup()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) {
                isFused = true
                showEnergy = true
                phase = 2
            }

            AudioManager.shared.playNuclearEffect(type: "fusion")

            withAnimation(.easeOut(duration: 1.0).delay(0.2)) {
                showEnergy = false
            }
        }
    }
}
