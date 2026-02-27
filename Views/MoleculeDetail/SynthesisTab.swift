import SwiftUI

struct SynthesisTab: View {
    let molecule: Molecule

    var body: some View {
        VStack(spacing: DesignSystem.Spacing.lg) {
            ForEach(molecule.synthesisRoutes) { route in
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {

                    HStack(spacing: DesignSystem.Spacing.sm) {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .font(.system(.footnote, weight: .medium))
                            .foregroundStyle(DesignSystem.Colors.secondary)

                        Text(route.name)
                            .font(DesignSystem.Typography.heading(17))
                            .foregroundStyle(DesignSystem.Colors.secondary)
                    }

                    Text(route.description)
                        .font(DesignSystem.Typography.body(15))
                        .foregroundStyle(DesignSystem.Colors.textPrimary)

                    Rectangle()
                        .fill(DesignSystem.Colors.separator)
                        .frame(height: 1)

                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("REACTANTS")
                                .font(.system(.caption2, design: .monospaced, weight: .bold))
                                .foregroundStyle(DesignSystem.Colors.textTertiary)
                                .tracking(0.5)

                            Text(route.reactants)
                                .font(DesignSystem.Typography.monospaced(14))
                                .foregroundStyle(.white)
                        }

                        Spacer()

                        Image(systemName: "arrow.right")
                            .font(.system(.caption, weight: .bold))
                            .foregroundStyle(DesignSystem.Colors.textTertiary)
                            .padding(.top, DesignSystem.Spacing.lg)

                        Spacer()

                        VStack(alignment: .trailing, spacing: 4) {
                            Text("CONDITIONS")
                                .font(.system(.caption2, design: .monospaced, weight: .bold))
                                .foregroundStyle(DesignSystem.Colors.textTertiary)
                                .tracking(0.5)

                            Text(route.conditions)
                                .font(DesignSystem.Typography.monospaced(14))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                }
                .padding(DesignSystem.Spacing.lg)
                .liquidGlass()
                .padding(.horizontal, DesignSystem.Spacing.xl)
            }

            if molecule.synthesisRoutes.isEmpty {
                VStack(spacing: DesignSystem.Spacing.md) {
                    Image(systemName: "beaker")
                        .font(.system(.largeTitle, weight: .light))
                        .foregroundStyle(DesignSystem.Colors.textTertiary)

                    Text("No synthesis data available")
                        .font(DesignSystem.Typography.body(15))
                        .foregroundStyle(DesignSystem.Colors.textTertiary)
                }
                .padding(.vertical, DesignSystem.Spacing.xxxl)
            }
        }
    }
}
