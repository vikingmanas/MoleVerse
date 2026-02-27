import SwiftUI

struct MoleculeListView: View {
    let category: String

    var molecules: [Molecule] {
        MoleculeDatabase.molecules
            .filter { $0.chemClass == category }
            .sorted { $0.molarMass < $1.molarMass }
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            if molecules.isEmpty {

                VStack(spacing: DesignSystem.Spacing.lg) {
                    Image(systemName: "flask.fill")
                        .font(.system(.largeTitle, weight: .light))
                        .foregroundStyle(DesignSystem.Colors.textTertiary)

                    Text("No Molecules Found")
                        .font(DesignSystem.Typography.heading(20))
                        .foregroundStyle(DesignSystem.Colors.textSecondary)

                    Text("We're still synthesizing \(category)...")
                        .font(DesignSystem.Typography.caption())
                        .foregroundStyle(DesignSystem.Colors.textTertiary)
                }
            } else {
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: DesignSystem.Spacing.md) {

                        HStack {
                            Text("\(molecules.count) molecules")
                                .font(DesignSystem.Typography.caption())
                                .foregroundStyle(DesignSystem.Colors.textTertiary)
                                .textCase(.uppercase)
                            Spacer()
                        }
                        .padding(.horizontal, DesignSystem.Spacing.xs)

                        ForEach(molecules) { molecule in
                            NavigationLink(value: molecule) {
                                MoleculeRow(molecule: molecule, accentColor: categoryColor)
                            }
                            .buttonStyle(CardPressStyle())
                        }
                    }
                    .padding(.horizontal, DesignSystem.Spacing.xl)
                    .padding(.top, DesignSystem.Spacing.sm)
                    .padding(.bottom, 100)
                }
            }
        }
        .navigationTitle(category)
        .navigationBarTitleDisplayMode(.large)
        .navigationDestination(for: Molecule.self) { molecule in
            LabView(molecule: molecule)
        }
        .background {
            ZStack {
                Color.black.ignoresSafeArea()
                LinearGradient(
                    colors: [categoryColor.opacity(0.08), .black],
                    startPoint: .top,
                    endPoint: .center
                )
                .ignoresSafeArea()
            }
        }
        .toolbarColorScheme(.dark, for: .navigationBar)
    }

    private var categoryColor: Color {
        switch category {
        case "Alkanes": return .cyan
        case "Alkenes": return .green
        case "Alkynes": return .orange
        case "Alcohols": return .blue
        case "Ethers": return .teal
        case "Aldehydes": return .pink
        case "Ketones": return .purple
        case "Carboxylic Acids": return .red
        case "Aromatics": return .indigo
        case "Inorganic": return .gray
        default: return DesignSystem.Colors.primary
        }
    }
}

struct MoleculeRow: View {
    let molecule: Molecule
    var accentColor: Color = DesignSystem.Colors.primary

    var body: some View {
        HStack(spacing: DesignSystem.Spacing.lg) {

            ZStack {
                RoundedRectangle(cornerRadius: DesignSystem.Radius.sm, style: .continuous)
                    .fill(accentColor.opacity(0.1))
                    .frame(width: 52, height: 52)

                Text(molecule.formula)
                    .font(.system(.caption2, design: .monospaced, weight: .bold))
                    .foregroundStyle(accentColor)
                    .minimumScaleFactor(0.7)
                    .lineLimit(1)
                    .frame(width: 44)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(molecule.name)
                    .font(.system(.headline, design: .rounded, weight: .semibold))
                    .foregroundStyle(.white)

                Text(molecule.description)
                    .font(DesignSystem.Typography.caption())
                    .foregroundStyle(DesignSystem.Colors.textTertiary)
                    .lineLimit(2)
            }

            Spacer()

            Text(String(format: "%.1f", molecule.molarMass))
                .font(.system(.caption, design: .monospaced, weight: .medium))
                .foregroundStyle(DesignSystem.Colors.textTertiary)

            Image(systemName: "chevron.right")
                .foregroundStyle(DesignSystem.Colors.textTertiary)
                .font(.system(.caption, weight: .semibold))
        }
        .padding(DesignSystem.Spacing.lg)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: DesignSystem.Radius.md, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: DesignSystem.Radius.md, style: .continuous)
                .strokeBorder(DesignSystem.Colors.glassBorder, lineWidth: 0.5)
        )
        .accessibilityLabel("\(molecule.name), \(molecule.formula), molar mass \(String(format: "%.1f", molecule.molarMass))")
    }
}

