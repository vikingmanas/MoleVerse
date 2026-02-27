import SwiftUI

struct QuantumAnalysisView: View {
    let molecule: Molecule
    @State private var result: QuantumModelService.AnalysisResult?
    @State private var isLoading = true
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            DesignSystem.Colors.background.ignoresSafeArea()

            if isLoading {

                VStack(spacing: DesignSystem.Spacing.xl) {
                    ProgressView()
                        .tint(DesignSystem.Colors.primary)
                        .scaleEffect(1.5)

                        Text("Analyzing Quantum Properties...")
                            .font(DesignSystem.Typography.monospaced(14))
                            .foregroundStyle(DesignSystem.Colors.textTertiary)
                }
            } else if let result = result {
                VStack(spacing: DesignSystem.Spacing.xxl) {

                    VStack(spacing: DesignSystem.Spacing.sm) {
                        Image(systemName: "atom")
                            .font(.system(.title, weight: .light))
                            .foregroundStyle(DesignSystem.Colors.primary)

                        Text("Quantum Analysis")
                            .font(DesignSystem.Typography.title())
                            .foregroundStyle(.white)

                        Text(molecule.name)
                            .font(DesignSystem.Typography.monospaced(14))
                            .foregroundStyle(DesignSystem.Colors.textSecondary)
                    }

                    VStack(spacing: DesignSystem.Spacing.md) {
                        AnalysisRow(label: "Stability (U₀)", value: String(format: "%.2f eV", result.stability), icon: "shield.checkered", color: DesignSystem.Colors.primary)
                        AnalysisRow(label: "Polarity (μ)", value: String(format: "%.2f D", result.polarity), icon: "arrow.left.arrow.right", color: DesignSystem.Colors.secondary)
                        AnalysisRow(label: "Reactivity (Gap)", value: String(format: "%.2f eV", result.reactivity), icon: "flame.fill", color: DesignSystem.Colors.accent)
                    }
                    .padding(DesignSystem.Spacing.lg)
                    .liquidGlass()

                    Text(result.description)
                        .font(DesignSystem.Typography.body(15))
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.system(.callout, design: .rounded, weight: .semibold))
                            .foregroundStyle(.black)
                            .padding(.vertical, DesignSystem.Spacing.lg)
                            .frame(maxWidth: .infinity)
                            .background(DesignSystem.Colors.primary)
                            .clipShape(RoundedRectangle(cornerRadius: DesignSystem.Radius.md, style: .continuous))
                    }
                }
                .padding(DesignSystem.Spacing.xl)
            }
        }
        .task {
            let service = QuantumModelService()
            do {
                let analysis = try await service.analyze(molecule: molecule)
                withAnimation(DesignSystem.Animations.fluidSpring) {
                    self.result = analysis
                    self.isLoading = false
                }
            } catch {

            }
        }
    }
}

struct AnalysisRow: View {
    let label: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {
        HStack(spacing: DesignSystem.Spacing.md) {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color.opacity(0.12))
                    .frame(width: 32, height: 32)

                Image(systemName: icon)
                    .font(.system(.footnote, weight: .medium))
                    .foregroundStyle(color)
            }

            Text(label)
                .font(DesignSystem.Typography.body(15))
                .foregroundStyle(DesignSystem.Colors.textSecondary)

            Spacer()

            Text(value)
                .font(DesignSystem.Typography.monospaced(16))
                .foregroundStyle(color)
        }
        .accessibilityLabel("\(label): \(value)")
    }
}
