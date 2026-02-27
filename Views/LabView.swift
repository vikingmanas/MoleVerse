import SwiftUI

struct LabView: View {
    @State private var selectedMolecule: Molecule
    @State private var showDetail = false
    @State private var showStats = false
    @State private var viewOpacity: Double = 0.0
    @State private var viewScale: CGFloat = 0.97
    @State private var resetID = UUID()

    init(molecule: Molecule? = nil) {
        let fallback = Molecule(
            name: "Unknown", formula: "???", description: "Database empty.",
            category: .organic, atoms: [], bonds: [], molarMass: 0, bondEnergy: 0,
            hybridization: "", funFact: "", historicContext: "", synthesisRoutes: []
        )
        self._selectedMolecule = State(initialValue: molecule ?? MoleculeDatabase.molecules.first ?? fallback)
    }

    var body: some View {
        ZStack {

            LabBackground()

            Group {
                Button("Inspect Hidden") { showDetail.toggle() }
                    .keyboardShortcut("i", modifiers: .command)

                Button("Stats Hidden") { showStats.toggle() }
                    .keyboardShortcut("s", modifiers: .command)

                Button("Reset Hidden") {
                    withAnimation { resetID = UUID() }
                }
                .keyboardShortcut("r", modifiers: .command)
            }
            .opacity(0)

            RealityViewContainer(molecule: selectedMolecule)
                .id(resetID)
                .ignoresSafeArea()
                .opacity(viewOpacity)
                .scaleEffect(viewScale)
                .onAppear {
                    withAnimation(.easeOut(duration: 0.8)) {
                        viewOpacity = 1.0
                        viewScale = 1.0
                    }
                }

            VStack {
                LinearGradient(colors: [.black.opacity(0.8), .clear], startPoint: .top, endPoint: .bottom)
                    .frame(height: 140)
                    .ignoresSafeArea()
                Spacer()
                LinearGradient(colors: [.clear, .black.opacity(0.9)], startPoint: .top, endPoint: .bottom)
                    .frame(height: 220)
                    .ignoresSafeArea()
            }
            .allowsHitTesting(false)

            VStack(spacing: 0) {

                LabHUD(
                    molecule: selectedMolecule,
                    showStats: $showStats
                )

                Spacer()

                LabBottomBar(
                    molecule: selectedMolecule,
                    showDetail: $showDetail
                )
            }
        }
        .background(Color.black)
        .onAppear {
            AudioManager.shared.startAmbience()
            AudioManager.shared.updateStabilitySound(bondEnergy: selectedMolecule.bondEnergy)
        }
        .onChange(of: selectedMolecule.name) { _, _ in
            AudioManager.shared.updateStabilitySound(bondEnergy: selectedMolecule.bondEnergy)
        }
        .sheet(isPresented: $showDetail) {
            MoleculeDetailView(molecule: $selectedMolecule)
                .zIndex(100)
        }
        .sheet(isPresented: $showStats) {
            QuickStatsView()
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

private struct LabBackground: View {
    @State private var pulse = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            RadialGradient(
                gradient: Gradient(colors: [
                    DesignSystem.Colors.primary.opacity(pulse ? 0.18 : 0.10),
                    DesignSystem.Colors.secondary.opacity(pulse ? 0.08 : 0.03),
                    .black
                ]),
                center: .center,
                startRadius: 20,
                endRadius: 500
            )
            .ignoresSafeArea()
            .animation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true), value: pulse)

            Circle()
                .fill(DesignSystem.Colors.primary.opacity(pulse ? 0.12 : 0.06))
                .frame(width: 300, height: 300)
                .blur(radius: 80)
                .animation(.easeInOut(duration: 4.0).repeatForever(autoreverses: true), value: pulse)
        }
        .onAppear { pulse = true }
    }
}

private struct LabHUD: View {
    let molecule: Molecule
    @Binding var showStats: Bool

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text(molecule.name)
                    .font(DesignSystem.Typography.title())
                    .foregroundStyle(.white)

                HStack(spacing: DesignSystem.Spacing.sm) {
                    Text(molecule.formula)
                        .font(DesignSystem.Typography.monospaced(15))
                        .foregroundStyle(DesignSystem.Colors.primary)

                    Circle()
                        .fill(DesignSystem.Colors.separator)
                        .frame(width: 4, height: 4)

                    Text(molecule.chemClass)
                        .font(.system(.subheadline, weight: .medium))
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                }
            }

            Spacer()

            Button {
                showStats = true
            } label: {
                Image(systemName: "chart.bar.xaxis")
                    .font(.system(.body, weight: .medium))
                    .foregroundStyle(.white.opacity(0.8))
                    .frame(width: 44, height: 44)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .strokeBorder(DesignSystem.Colors.glassBorder, lineWidth: 0.5)
                    )
            }
            .accessibilityLabel("Lab Statistics")
        }
        .padding(.horizontal, DesignSystem.Spacing.xxl)
        .padding(.top, DesignSystem.Spacing.sm)
    }
}

private struct LabBottomBar: View {
    let molecule: Molecule
    @Binding var showDetail: Bool

    var body: some View {
        ZStack(alignment: .bottom) {

            HStack {
                AtomLegend(elements: uniqueElements)
                Spacer()
            }
            .padding(.leading, DesignSystem.Spacing.xxl)

            HStack {
                Spacer()
                Button {
                    withAnimation(DesignSystem.Animations.fluidSpring) {
                        showDetail = true
                    }
                } label: {
                    HStack(spacing: DesignSystem.Spacing.sm) {
                        Image(systemName: "info.circle")
                            .font(.system(.callout, weight: .medium))
                        Text("Inspect")
                            .font(.system(.subheadline, design: .rounded, weight: .semibold))
                    }
                    .foregroundStyle(.black)
                    .padding(.horizontal, DesignSystem.Spacing.xxl)
                    .padding(.vertical, DesignSystem.Spacing.md)
                    .background(DesignSystem.Colors.primary)
                    .clipShape(Capsule())
                    .shadow(color: DesignSystem.Colors.primary.opacity(0.4), radius: 12, x: 0, y: 6)
                    .overlay(
                        Capsule()
                            .strokeBorder(.white.opacity(0.2), lineWidth: 1)
                    )
                }
                .accessibilityLabel("Inspect \(molecule.name)")
                Spacer()
            }

            HStack {
                Spacer()
                BondLegendView()
            }
            .padding(.trailing, DesignSystem.Spacing.xxl)
        }
        .padding(.bottom, 90)
    }

    private var uniqueElements: [Element] {
        Array(Set(molecule.atoms.map { $0.element }))
            .sorted { $0.atomicMass < $1.atomicMass }
    }
}

struct AtomLegend: View {
    let elements: [Element]

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
            ForEach(elements, id: \.self) { element in
                LegendItem(color: element.cpkColor, label: element.rawValue)
            }
        }
        .padding(DesignSystem.Spacing.md)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: DesignSystem.Radius.sm, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: DesignSystem.Radius.sm, style: .continuous)
                .strokeBorder(DesignSystem.Colors.glassBorder, lineWidth: 0.5)
        )
    }
}

struct LegendItem: View {
    let color: Color
    let label: String

    var body: some View {
        HStack(spacing: DesignSystem.Spacing.sm) {
            Circle()
                .fill(color)
                .frame(width: 8, height: 8)
                .shadow(color: color.opacity(0.4), radius: 3)

            Text(label)
                .font(.system(.caption2, design: .monospaced, weight: .semibold))
                .foregroundStyle(.white.opacity(0.75))
        }
    }
}

struct BondLegendView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
            Text("BONDS")
                .font(.system(.caption2, design: .rounded, weight: .bold))
                .foregroundStyle(DesignSystem.Colors.textTertiary)
                .tracking(1)

            LegendItem(color: .gray, label: "Single")
            LegendItem(color: .yellow, label: "Double")
            LegendItem(color: .cyan, label: "Triple")
        }
        .padding(DesignSystem.Spacing.md)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: DesignSystem.Radius.sm, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: DesignSystem.Radius.sm, style: .continuous)
                .strokeBorder(DesignSystem.Colors.glassBorder, lineWidth: 0.5)
        )
    }
}
