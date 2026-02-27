import SwiftUI

struct MoleculeDetailView: View {
    @Binding var molecule: Molecule
    @State private var selectedTab = "Overview"
    @State private var showAnalysis = false

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack(alignment: .top) {
            DesignSystem.Colors.background.ignoresSafeArea()

            GeometryReader { _ in
                Text(molecule.formula)
                    .font(.system(.largeTitle, design: .monospaced, weight: .heavy))
                    .foregroundStyle(Color.white.opacity(0.02))
                    .rotationEffect(.degrees(-20))
                    .offset(x: -50, y: 120)
            }

            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(.title))
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.white.opacity(0.5))
                        .padding(DesignSystem.Spacing.lg)
                }
                .accessibilityLabel("Close")
            }
            .zIndex(1)

            ScrollView(showsIndicators: false) {
                VStack(spacing: DesignSystem.Spacing.xxl) {
                    Color.clear.frame(height: 36)

                    VStack(spacing: DesignSystem.Spacing.sm) {
                        Text(molecule.name)
                            .font(.system(.largeTitle, design: .rounded, weight: .bold))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)

                        HStack(spacing: DesignSystem.Spacing.sm) {
                            Circle()
                                .fill(molecule.category == .organic
                                      ? DesignSystem.Colors.primary
                                      : DesignSystem.Colors.secondary)
                                .frame(width: 6, height: 6)

                            Text(molecule.category.rawValue)
                                .font(DesignSystem.Typography.caption())
                                .foregroundStyle(DesignSystem.Colors.textSecondary)
                        }
                        .padding(.horizontal, DesignSystem.Spacing.md)
                        .padding(.vertical, DesignSystem.Spacing.sm)
                        .background(.ultraThinMaterial)
                        .clipShape(Capsule())
                    }

                    Button {
                        showAnalysis = true
                    } label: {
                        HStack(spacing: DesignSystem.Spacing.sm) {
                            Image(systemName: "sparkles")
                                .symbolRenderingMode(.multicolor)
                            Text("Quantum Analysis")
                                .font(.system(.callout, design: .rounded, weight: .semibold))
                        }
                        .foregroundStyle(.white)
                        .padding(.vertical, DesignSystem.Spacing.lg)
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(
                                colors: [
                                    DesignSystem.Colors.primary.opacity(0.7),
                                    DesignSystem.Colors.secondary.opacity(0.5)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: DesignSystem.Radius.md, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: DesignSystem.Radius.md, style: .continuous)
                                .strokeBorder(Color.white.opacity(0.15), lineWidth: 0.5)
                        )
                    }
                    .padding(.horizontal, DesignSystem.Spacing.xl)
                    .sheet(isPresented: $showAnalysis) {
                        QuantumAnalysisView(molecule: molecule)
                    }

                    CustomSegmentedPicker(tabs: ["Overview", "Synthesis", "Bonds"], selectedTab: $selectedTab)

                    Group {
                        if selectedTab == "Overview" {
                            OverviewTab(molecule: molecule)
                        } else if selectedTab == "Synthesis" {
                            SynthesisTab(molecule: molecule)
                        } else {
                            BondsTab(molecule: molecule)
                        }
                    }
                }
                .padding(.bottom, 40)
            }
        }
        .animation(DesignSystem.Animations.fluidSpring, value: selectedTab)
        .onChange(of: selectedTab) { _, _ in
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        }
    }
}
