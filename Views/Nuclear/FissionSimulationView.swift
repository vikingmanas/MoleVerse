import SwiftUI

struct FissionSimulationView: View {
    @Environment(\.dismiss) var dismiss

    @State private var neutronOffset: CGFloat = 0
    @State private var nucleusScale: CGFloat = 1.0
    @State private var isSplit = false
    @State private var showEnergy = false
    @State private var phase = 0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                DesignSystem.Colors.background.ignoresSafeArea()

                if showEnergy {
                    DesignSystem.Colors.primary.opacity(0.4)
                        .ignoresSafeArea()
                }

                VStack(spacing: 0) {
                    SimulationHeader(
                        title: "Uranium-235 Fission",
                        subtitle: "U-235 + n → Ba-141 + Kr-92 + 3n",
                        onDismiss: { dismiss() }
                    )

                    Spacer()

                    ZStack {
                        if isSplit {
                            NucleusView(protons: 36, neutrons: 56, label: "Kr-92", color: .green)
                                .offset(x: -100, y: -100)

                            NucleusView(protons: 56, neutrons: 85, label: "Ba-141", color: .blue)
                                .offset(x: 100, y: 100)

                            ForEach(0..<3) { i in
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 12, height: 12)
                                    .shadow(color: .white.opacity(0.6), radius: 6)
                                    .offset(x: CGFloat([150, -150, 0][i]), y: CGFloat([-50, 50, -150][i]))
                            }
                        } else {
                            NucleusView(protons: 92, neutrons: 143, label: phase == 2 ? "U-236" : "U-235", color: .orange)
                                .scaleEffect(nucleusScale)
                        }

                        if phase < 3 {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 14, height: 14)
                                .shadow(color: .white.opacity(0.6), radius: 5)
                                .offset(x: neutronOffset, y: 0)
                                .opacity(phase == 2 ? 0 : 1)
                        }
                    }
                    .frame(height: 400)

                    Spacer()

                    SimulationButton(
                        label: phase == 0 ? "Fire Neutron" : "Reset",
                        color: DesignSystem.Colors.primary,
                        isDisabled: phase == 1 || phase == 2
                    ) {
                        runSimulation(width: geometry.size.width)
                    }
                }
            }
            .onAppear {
                neutronOffset = -geometry.size.width * 0.6
            }
        }
    }

    func runSimulation(width: CGFloat) {
        if phase == 3 {
            withAnimation {
                phase = 0
                neutronOffset = -width * 0.6
                nucleusScale = 1.0
                isSplit = false
                showEnergy = false
            }
            return
        }

        phase = 1
        withAnimation(.linear(duration: 1.0)) {
            neutronOffset = 0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.2)) {
                phase = 2
                nucleusScale = 1.2
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                phase = 3
                isSplit = true
                showEnergy = true
            }

            HapticManager.shared.playNuclearExplosion()
            AudioManager.shared.playNuclearEffect(type: "explosion")

            withAnimation(.easeOut(duration: 2.0).delay(0.2)) {
                showEnergy = false
            }
        }
    }
}

struct NucleusView: View {
    let protons: Int
    let neutrons: Int
    let label: String
    let color: Color

    var body: some View {
        ZStack {
            Circle()
                .fill(color.opacity(0.2))
                .frame(width: 120, height: 120)
                .blur(radius: 12)

            ZStack {
                ForEach(0..<30) { _ in
                    Circle()
                        .fill(Bool.random() ? Color.red.opacity(0.8) : Color.gray.opacity(0.6))
                        .frame(width: 14, height: 14)
                        .offset(x: CGFloat.random(in: -30...30), y: CGFloat.random(in: -30...30))
                }
            }
            .frame(width: 100, height: 100)
            .background(
                Circle()
                    .fill(.ultraThinMaterial)
                    .padding(5)
            )

            Text(label)
                .font(DesignSystem.Typography.heading(20))
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.5), radius: 2)
        }
    }
}
