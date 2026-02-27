import SwiftUI

struct OverviewTab: View {
    let molecule: Molecule

    var body: some View {
        VStack(spacing: DesignSystem.Spacing.lg) {

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: DesignSystem.Spacing.lg) {
                StatInfoCard(title: "Molar Mass", value: "\(molecule.molarMass) g/mol", icon: "scalemass.fill", color: DesignSystem.Colors.primary)
                StatInfoCard(title: "Bond Energy", value: "\(molecule.bondEnergy) kJ/mol", icon: "bolt.fill", color: .orange)
                StatInfoCard(title: "Hybridization", value: molecule.hybridization, icon: "hexagon.fill", color: DesignSystem.Colors.secondary)
                StatInfoCard(title: "Atom Count", value: "\(molecule.atoms.count)", icon: "circle.grid.3x3.fill", color: .green)
            }
            .padding(.horizontal, DesignSystem.Spacing.xl)

            HStack(alignment: .top, spacing: DesignSystem.Spacing.md) {
                RoundedRectangle(cornerRadius: 2, style: .continuous)
                    .fill(.yellow.opacity(0.6))
                    .frame(width: 3)

                VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                    HStack(spacing: DesignSystem.Spacing.sm) {
                        Image(systemName: "lightbulb.fill")
                            .foregroundStyle(.yellow)
                            .font(.system(.callout))
                        Text("Fun Fact")
                            .font(DesignSystem.Typography.heading(17))
                            .foregroundStyle(.white)
                    }

                    Text(molecule.funFact)
                        .font(DesignSystem.Typography.body(15))
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(DesignSystem.Spacing.lg)
            .frame(maxWidth: .infinity, alignment: .leading)
            .liquidGlass()
            .padding(.horizontal, DesignSystem.Spacing.xl)

            HStack(alignment: .top, spacing: DesignSystem.Spacing.md) {
                RoundedRectangle(cornerRadius: 2, style: .continuous)
                    .fill(DesignSystem.Colors.primary.opacity(0.6))
                    .frame(width: 3)

                VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                    HStack(spacing: DesignSystem.Spacing.sm) {
                        Image(systemName: "clock.fill")
                            .foregroundStyle(DesignSystem.Colors.primary)
                            .font(.system(.callout))
                        Text("History")
                            .font(DesignSystem.Typography.heading(17))
                            .foregroundStyle(.white)
                    }

                    Text(molecule.historicContext)
                        .font(DesignSystem.Typography.body(15))
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(DesignSystem.Spacing.lg)
            .frame(maxWidth: .infinity, alignment: .leading)
            .liquidGlass()
            .padding(.horizontal, DesignSystem.Spacing.xl)
        }
    }
}

struct StatInfoCard: View {
    let title: String
    let value: String
    let icon: String
    var color: Color = DesignSystem.Colors.primary

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color.opacity(0.12))
                    .frame(width: 36, height: 36)

                Image(systemName: icon)
                    .font(.system(.callout, weight: .medium))
                    .foregroundStyle(color)
            }

            Spacer()

            Text(value)
                .font(.system(.headline, design: .rounded, weight: .bold))
                .foregroundStyle(.white)
                .minimumScaleFactor(0.7)
                .lineLimit(1)

            Text(title)
                .font(DesignSystem.Typography.caption())
                .foregroundStyle(DesignSystem.Colors.textTertiary)
        }
        .padding(DesignSystem.Spacing.lg)
        .frame(height: 120)
        .frame(maxWidth: .infinity, alignment: .leading)
        .liquidGlass()
        .accessibilityLabel("\(title): \(value)")
    }
}
