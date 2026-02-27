import SwiftUI

struct QuickStatsView: View {
    @Environment(\.dismiss) var dismiss

    var totalMolecules: Int {
        MoleculeDatabase.molecules.count
    }

    var averageMass: Double {
        let total = MoleculeDatabase.molecules.reduce(0) { $0 + $1.molarMass }
        return total / Double(totalMolecules)
    }

    var heaviestMolecule: Molecule? {
        MoleculeDatabase.molecules.max(by: { $0.molarMass < $1.molarMass })
    }

    var lightestMolecule: Molecule? {
        MoleculeDatabase.molecules.min(by: { $0.molarMass < $1.molarMass })
    }

    var organicCount: Int {
        MoleculeDatabase.molecules.filter { $0.category == .organic }.count
    }

    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack {
            DesignSystem.Colors.background.ignoresSafeArea()

            VStack(spacing: DesignSystem.Spacing.xxl) {

                HStack {
                    Text("Lab Statistics")
                        .font(DesignSystem.Typography.title())
                        .foregroundStyle(DesignSystem.Colors.primary)

                    Spacer()

                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(.title2))
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.white.opacity(0.5))
                    }
                    .accessibilityLabel("Close")
                }
                .padding(.top)

                ScrollView(showsIndicators: false) {
                    VStack(spacing: DesignSystem.Spacing.lg) {
                        LazyVGrid(columns: columns, spacing: DesignSystem.Spacing.lg) {
                            QuickStatCard(title: "Total Molecules", value: "\(totalMolecules)", icon: "cube.box.fill", color: DesignSystem.Colors.primary)
                            QuickStatCard(title: "Avg Mass", value: String(format: "%.1f g/mol", averageMass), icon: "scalemass.fill", color: .orange)
                            QuickStatCard(title: "Organic", value: "\(organicCount)", icon: "leaf.fill", color: .green)
                            QuickStatCard(title: "Inorganic", value: "\(totalMolecules - organicCount)", icon: "flask.fill", color: DesignSystem.Colors.secondary)
                        }

                        if let heaviest = heaviestMolecule {
                            HighlightMoleculeCard(title: "Heaviest", molecule: heaviest, icon: "scalemass.fill", color: .orange)
                        }

                        if let lightest = lightestMolecule {
                            HighlightMoleculeCard(title: "Lightest", molecule: lightest, icon: "feather.fill", color: .cyan)
                        }
                    }
                }
            }
            .padding(.horizontal, DesignSystem.Spacing.xl)
        }
    }
}

struct QuickStatCard: View {
    let title: String
    let value: String
    let icon: String
    var color: Color = DesignSystem.Colors.primary

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color.opacity(0.12))
                    .frame(width: 36, height: 36)

                Image(systemName: icon)
                    .font(.system(.callout, weight: .medium))
                    .foregroundStyle(color)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(value)
                    .font(.system(.title2, design: .rounded, weight: .bold))
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.7)

                Text(title)
                    .font(DesignSystem.Typography.caption())
                    .foregroundStyle(DesignSystem.Colors.textTertiary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(DesignSystem.Spacing.lg)
        .liquidGlass()
        .accessibilityLabel("\(title): \(value)")
    }
}

struct HighlightMoleculeCard: View {
    let title: String
    let molecule: Molecule
    let icon: String
    var color: Color = DesignSystem.Colors.primary

    var body: some View {
        HStack(spacing: DesignSystem.Spacing.lg) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.12))
                    .frame(width: 48, height: 48)

                Image(systemName: icon)
                    .font(.system(.title3, weight: .medium))
                    .foregroundStyle(color)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(DesignSystem.Typography.caption())
                    .foregroundStyle(DesignSystem.Colors.textTertiary)
                    .textCase(.uppercase)

                Text(molecule.name)
                    .font(DesignSystem.Typography.heading(18))
                    .foregroundStyle(.white)

                Text("\(molecule.formula) · \(String(format: "%.1f", molecule.molarMass)) g/mol")
                    .font(DesignSystem.Typography.monospaced(13))
                    .foregroundStyle(DesignSystem.Colors.textSecondary)
            }

            Spacer()
        }
        .padding(DesignSystem.Spacing.lg)
        .liquidGlass()
        .accessibilityLabel("\(title) molecule: \(molecule.name)")
    }
}
