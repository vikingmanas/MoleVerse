import SwiftUI
struct CustomSegmentedPicker: View {
    let tabs: [String]
    @Binding var selectedTab: String
    @Namespace private var animation

    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs, id: \.self) { tab in
                Button {
                    withAnimation(DesignSystem.Animations.fluidSpring) {
                        selectedTab = tab
                    }
                } label: {
                    VStack(spacing: DesignSystem.Spacing.sm) {
                        Text(tab)
                            .font(.system(selectedTab == tab ? .headline : .subheadline, design: .rounded, weight: selectedTab == tab ? .semibold : .medium))
                            .foregroundStyle(selectedTab == tab ? DesignSystem.Colors.textPrimary : DesignSystem.Colors.textSecondary)
                            .frame(maxWidth: .infinity)

                        ZStack {
                            Capsule()
                                .fill(Color.clear)
                                .frame(height: 2.5)

                            if selectedTab == tab {
                                Capsule()
                                    .fill(DesignSystem.Colors.primary)
                                    .frame(height: 2.5)
                                    .matchedGeometryEffect(id: "TabIndicator", in: animation)
                                    .shadow(color: DesignSystem.Colors.primary.opacity(0.4), radius: 4, y: 2)
                            }
                        }
                    }
                    .padding(.vertical, DesignSystem.Spacing.sm)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .accessibilityLabel(tab)
                .accessibilityAddTraits(selectedTab == tab ? .isSelected : [])
            }
        }
        .padding(.horizontal, DesignSystem.Spacing.xl)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        CustomSegmentedPicker(tabs: ["Overview", "Synthesis", "Bonds"], selectedTab: .constant("Overview"))
    }
}
