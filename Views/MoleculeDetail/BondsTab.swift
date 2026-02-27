import SwiftUI

struct BondsTab: View {
    let molecule: Molecule

    var body: some View {
        VStack(spacing: DesignSystem.Spacing.xl) {

            VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
                Text("Atomic Composition")
                    .font(DesignSystem.Typography.heading(17))
                    .foregroundStyle(.white)

                HStack {
                    ForEach(uniqueElements(), id: \.self) { element in
                        VStack(spacing: DesignSystem.Spacing.sm) {
                            ZStack {
                                Circle()
                                    .fill(element.cpkColor)
                                    .frame(width: 42, height: 42)
                                    .shadow(color: element.cpkColor.opacity(0.3), radius: 6)

                                Text(element.rawValue)
                                    .font(.system(.footnote, design: .monospaced, weight: .bold))
                                    .foregroundStyle(element == .C ? .white : element == .S ? .black : .white.opacity(0.9))
                            }

                            Text(element.name)
                                .font(.system(.caption2, weight: .medium))
                                .foregroundStyle(DesignSystem.Colors.textTertiary)

                            Text("×\(count(of: element))")
                                .font(DesignSystem.Typography.monospaced(14))
                                .foregroundStyle(DesignSystem.Colors.primary)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding(DesignSystem.Spacing.lg)
                .liquidGlass()
            }
            .padding(.horizontal, DesignSystem.Spacing.xl)

            VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
                HStack {
                    Text("Bond Network")
                        .font(DesignSystem.Typography.heading(17))
                        .foregroundStyle(.white)

                    Spacer()

                    Text("\(molecule.bonds.count) bonds")
                        .font(DesignSystem.Typography.caption())
                        .foregroundStyle(DesignSystem.Colors.textTertiary)
                }

                VStack(spacing: 6) {
                    ForEach(molecule.bonds.filter {
                        $0.atom1Index < molecule.atoms.count && $0.atom2Index < molecule.atoms.count
                    }) { bond in
                        let atom1 = molecule.atoms[bond.atom1Index]
                        let atom2 = molecule.atoms[bond.atom2Index]

                        HStack {

                            HStack(spacing: 6) {
                                Text(atom1.element.rawValue)
                                    .font(.system(.footnote, design: .monospaced, weight: .bold))
                                    .foregroundStyle(atom1.element.cpkColor)

                                bondIcon(order: bond.order)

                                Text(atom2.element.rawValue)
                                    .font(.system(.footnote, design: .monospaced, weight: .bold))
                                    .foregroundStyle(atom2.element.cpkColor)
                            }

                            Spacer()

                            Text(bondOrderString(bond.order))
                                .font(.system(.footnote, design: .monospaced, weight: .medium))
                                .foregroundStyle(bondColor(bond.order))
                        }
                        .padding(.horizontal, DesignSystem.Spacing.md)
                        .padding(.vertical, DesignSystem.Spacing.sm)
                        .background(DesignSystem.Colors.cardFill)
                        .clipShape(RoundedRectangle(cornerRadius: DesignSystem.Radius.sm, style: .continuous))
                    }
                }
                .padding(DesignSystem.Spacing.md)
                .liquidGlass()
            }
            .padding(.horizontal, DesignSystem.Spacing.xl)
        }
    }

    func uniqueElements() -> [Element] {
        Array(Set(molecule.atoms.map { $0.element })).sorted { $0.rawValue < $1.rawValue }
    }

    func count(of element: Element) -> Int {
        molecule.atoms.filter { $0.element == element }.count
    }

    func bondOrderString(_ order: Int) -> String {
        switch order {
        case 1: return "σ Single"
        case 2: return "σ+π Double"
        case 3: return "σ+2π Triple"
        default: return "Unknown"
        }
    }

    func bondColor(_ order: Int) -> Color {
        switch order {
        case 2: return .yellow
        case 3: return .cyan
        default: return .gray
        }
    }

    @ViewBuilder
    func bondIcon(order: Int) -> some View {
        let color = bondColor(order)
        HStack(spacing: 1) {
            ForEach(0..<order, id: \.self) { _ in
                Capsule()
                    .fill(color.opacity(0.6))
                    .frame(width: 12, height: 2)
            }
        }
    }
}
