import SwiftUI

struct HomeView: View {

    let categories: [CategoryCardData] = [
        CategoryCardData(name: "Alkanes", description: "The Fuel Series", textIcon: "C–C"),
        CategoryCardData(name: "Alkenes", description: "Double Bond Builders", textIcon: "C=C"),
        CategoryCardData(name: "Alkynes", description: "Triple Bond Energy", textIcon: "C≡C"),
        CategoryCardData(name: "Alcohols", description: "The Solvents", textIcon: "-OH"),
        CategoryCardData(name: "Ethers", description: "Volatile Bridges", textIcon: "-O-"),
        CategoryCardData(name: "Aldehydes", description: "Fragrant Carbonyls", textIcon: "-CHO"),
        CategoryCardData(name: "Ketones", description: "Industrial Solvents", textIcon: "C=O"),
        CategoryCardData(name: "Carboxylic Acids", description: "Organic Acids", textIcon: "-COOH"),
        CategoryCardData(name: "Aromatics", description: "Ring Structures", icon: "hexagon.fill"),
        CategoryCardData(name: "Inorganic", description: "Small Molecules", icon: "atom"),
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xxl) {

                VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                    Text("MoleVerse Lab")
                        .font(DesignSystem.Typography.largeTitle())
                        .foregroundStyle(.white)

                    Text("Explore molecular structures in 3D")
                        .font(DesignSystem.Typography.body())
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                }
                .padding(.horizontal, DesignSystem.Spacing.xl)
                .padding(.top, DesignSystem.Spacing.lg)

                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 160), spacing: DesignSystem.Spacing.lg)],
                    spacing: DesignSystem.Spacing.lg
                ) {
                    ForEach(categories) { category in
                        NavigationLink(value: category.name) {
                            CategoryCard(data: category)
                        }
                        .buttonStyle(CardPressStyle())
                    }
                }
                .padding(.horizontal, DesignSystem.Spacing.xl)
                .padding(.bottom, 100)
            }
        }
        .navigationDestination(for: String.self) { categoryName in
            MoleculeListView(category: categoryName)
        }
        .background {
            DesignSystem.Colors.background.ignoresSafeArea()
        }
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

struct CategoryCardData: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    var icon: String? = nil
    var textIcon: String? = nil
}

struct CategoryCard: View {
    let data: CategoryCardData

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            ZStack {
                Circle()
                    .fill(DesignSystem.Colors.primary.opacity(0.15))
                    .frame(width: 44, height: 44)

                if let textIcon = data.textIcon {
                    Text(textIcon)
                        .font(.system(.callout, design: .monospaced, weight: .bold))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .foregroundStyle(DesignSystem.Colors.primary)
                } else if let icon = data.icon {
                    Image(systemName: icon)
                        .foregroundStyle(DesignSystem.Colors.primary)
                        .font(.system(.title3, weight: .semibold))
                }
            }

            Spacer()

            VStack(alignment: .leading, spacing: 4) {
                Text(data.name)
                    .font(.system(.headline, design: .rounded, weight: .semibold))
                    .foregroundStyle(.white)

                Text(data.description)
                    .font(DesignSystem.Typography.caption())
                    .foregroundStyle(DesignSystem.Colors.textTertiary)
            }
        }
        .frame(minHeight: 140)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(DesignSystem.Spacing.lg)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(data.name), \(data.description)")
        .hoverEffect(.lift)
        .background {
            RoundedRectangle(cornerRadius: DesignSystem.Radius.xl, style: .continuous)
                .fill(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: DesignSystem.Radius.xl, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: DesignSystem.Radius.xl, style: .continuous)
                        .strokeBorder(DesignSystem.Colors.glassBorder, lineWidth: 0.5)
                )
        }
        .contentShape(RoundedRectangle(cornerRadius: DesignSystem.Radius.xl))
    }
}

struct CardPressStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .opacity(configuration.isPressed ? 0.85 : 1.0)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}
