import SwiftUI

struct NuclearLabView: View {
    @State private var showFission = false
    @State private var showFusion = false
    @State private var showAlpha = false
    @State private var showBeta = false
    @State private var showAntimatter = false
    @State private var showReactorGame = false

    var body: some View {
        ZStack {
            DesignSystem.Colors.background.ignoresSafeArea()

            Circle()
                .fill(DesignSystem.Colors.secondary.opacity(0.06))
                .frame(width: 300, height: 300)
                .blur(radius: 80)
                .offset(x: -100, y: -200)

            Circle()
                .fill(DesignSystem.Colors.primary.opacity(0.06))
                .frame(width: 250, height: 250)
                .blur(radius: 80)
                .offset(x: 100, y: 200)

            ScrollView(showsIndicators: false) {
                VStack(spacing: DesignSystem.Spacing.xxl) {

                    VStack(spacing: DesignSystem.Spacing.sm) {
                        Text("Nuclear Lab")
                            .font(DesignSystem.Typography.largeTitle())
                            .foregroundStyle(.white)

                        Text("Explore the fundamental forces of the universe")
                            .font(DesignSystem.Typography.body())
                            .foregroundStyle(DesignSystem.Colors.textSecondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, DesignSystem.Spacing.xl)
                    .padding(.horizontal, DesignSystem.Spacing.xl)

                    VStack(spacing: DesignSystem.Spacing.lg) {
                        Button { showFission = true } label: {
                            NuclearCard(
                                title: "Nuclear Fission",
                                subtitle: "Splitting the Atom",
                                description: "Bombard U-235 with a neutron.",
                                icon: "burst.fill",
                                color: DesignSystem.Colors.primary
                            )
                        }
                        .buttonStyle(CardPressStyle())
                        .sheet(isPresented: $showFission) { FissionSimulationView() }

                        Button { showFusion = true } label: {
                            NuclearCard(
                                title: "Nuclear Fusion",
                                subtitle: "Stellar Power",
                                description: "Fuse Deuterium and Tritium.",
                                icon: "sun.max.fill",
                                color: DesignSystem.Colors.secondary
                            )
                        }
                        .buttonStyle(CardPressStyle())
                        .sheet(isPresented: $showFusion) { FusionSimulationView() }

                        Button { showAlpha = true } label: {
                            NuclearCard(
                                title: "Alpha Decay",
                                subtitle: "Emission",
                                description: "Polonium instability releases Helium.",
                                icon: "circle.grid.hex.fill",
                                color: DesignSystem.Colors.secondary
                            )
                        }
                        .buttonStyle(CardPressStyle())
                        .sheet(isPresented: $showAlpha) { AlphaDecayView() }

                        Button { showBeta = true } label: {
                            NuclearCard(
                                title: "Beta Decay",
                                subtitle: "Transformation",
                                description: "Neutron becomes Proton + Electron.",
                                icon: "arrow.triangle.2.circlepath",
                                color: DesignSystem.Colors.primary
                            )
                        }
                        .buttonStyle(CardPressStyle())
                        .sheet(isPresented: $showBeta) { BetaDecayView() }

                        Button { showAntimatter = true } label: {
                            NuclearCard(
                                title: "Annihilation",
                                subtitle: "Matter vs Antimatter",
                                description: "Electron and Positron collide.",
                                icon: "bolt.horizontal.fill",
                                color: DesignSystem.Colors.accent
                            )
                        }
                        .buttonStyle(CardPressStyle())
                        .sheet(isPresented: $showAntimatter) { AntimatterAnnihilationView() }

                        Button { showReactorGame = true } label: {
                            NuclearCard(
                                title: "Reactor Manager",
                                subtitle: "Simulation Game",
                                description: "Stabilize the reactor core physics.",
                                icon: "gauge.with.needle.fill",
                                color: DesignSystem.Colors.accent
                            )
                        }
                        .buttonStyle(CardPressStyle())
                        .sheet(isPresented: $showReactorGame) { ReactorGameView() }
                    }
                    .padding(.horizontal, DesignSystem.Spacing.xl)
                }
                .padding(.bottom, 80)
            }
        }
    }
}

struct NuclearCard: View {
    let title: String
    let subtitle: String
    let description: String
    let icon: String
    let color: Color

    var body: some View {
        HStack(spacing: DesignSystem.Spacing.lg) {

            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [color.opacity(0.25), color.opacity(0.08)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 64, height: 64)

                Image(systemName: icon)
                    .font(.system(.title2, weight: .medium))
                    .foregroundStyle(color)
            }

            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(title)
                    .font(DesignSystem.Typography.heading(19))
                    .foregroundStyle(.white)

                Text(subtitle)
                    .font(DesignSystem.Typography.monospaced(13))
                    .foregroundStyle(color)

                Text(description)
                    .font(DesignSystem.Typography.body(14))
                    .foregroundStyle(DesignSystem.Colors.textTertiary)
                    .lineLimit(2)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(.footnote, weight: .semibold))
                .foregroundStyle(DesignSystem.Colors.textTertiary)
        }
        .padding(DesignSystem.Spacing.xl)
        .background {
            RoundedRectangle(cornerRadius: DesignSystem.Radius.xl, style: .continuous)
                .fill(.ultraThinMaterial)
                .overlay(alignment: .leading) {

                    UnevenRoundedRectangle(
                        cornerRadii: .init(topLeading: DesignSystem.Radius.xl, bottomLeading: DesignSystem.Radius.xl)
                    )
                    .fill(color.opacity(0.2))
                    .frame(width: 4)
                }
                .clipShape(RoundedRectangle(cornerRadius: DesignSystem.Radius.xl, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: DesignSystem.Radius.xl, style: .continuous)
                        .strokeBorder(color.opacity(0.12), lineWidth: 0.5)
                )
        }
        .accessibilityLabel("\(title): \(description)")
    }
}
