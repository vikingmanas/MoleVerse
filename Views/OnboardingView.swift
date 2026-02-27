import SwiftUI

struct OnboardingView: View {
    @Binding var isPresented: Bool
    @State private var curPage = 0
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    let pages: [OnboardingPageData] = [
        OnboardingPageData(
            id: 0,
            image: "graduationcap.fill",
            title: "Born from Curiosity",
            description: "I could never truly see molecules in my chemistry class. Textbook diagrams felt flat and lifeless. So I decided to build something better."
        ),
        OnboardingPageData(
            id: 1,
            image: "cube.transparent.fill",
            title: "A Tactile Sandbox",
            description: "MoleVerse isn't just an explanation tool. Using RealityKit and CoreMotion, it transforms abstract molecules into interactive 3D structures you can rotate and examine."
        ),
        OnboardingPageData(
            id: 2,
            image: "burst.fill",
            title: "Nuclear Reactions",
            description: "Watch fission, fusion, and radioactive decay unfold before your eyes. Tap to trigger each reaction and see the physics in action."
        ),
        OnboardingPageData(
            id: 3,
            image: "sparkles",
            title: "Welcome to MoleVerse",
            description: "Explore 50+ molecules and discover the invisible architecture of everything around you."
        )
    ]

    var body: some View {
        ZStack {
            DesignSystem.Colors.background.ignoresSafeArea()

            VStack {
                Spacer()

                TabView(selection: $curPage) {
                    ForEach(pages) { page in
                        OnboardingPageView(data: page)
                            .tag(page.id)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 450)

                HStack(spacing: 8) {
                    ForEach(0..<pages.count, id: \.self) { i in
                        Capsule()
                            .fill(i == curPage ? DesignSystem.Colors.primary : Color.white.opacity(0.2))
                            .frame(width: i == curPage ? 24 : 8, height: 8)
                            .animation(reduceMotion ? .none : .spring, value: curPage)
                    }
                }
                .padding(.bottom, 40)

                Button {
                    if curPage < pages.count - 1 {
                        withAnimation(reduceMotion ? .none : .easeInOut) {
                            curPage += 1
                        }
                    } else {
                        dismiss()
                    }
                } label: {
                    Text(curPage == pages.count - 1 ? "Start Exploring" : "Continue")
                        .font(.system(.headline, design: .rounded, weight: .semibold))
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(DesignSystem.Colors.primary)
                        .clipShape(Capsule())
                }
                .sensoryFeedback(.impact(weight: .light), trigger: curPage)
                .padding(.horizontal, DesignSystem.Spacing.xxl)

                if curPage < pages.count - 1 {
                    Button("Skip") {
                        dismiss()
                    }
                    .font(DesignSystem.Typography.body())
                    .foregroundStyle(DesignSystem.Colors.textTertiary)
                    .padding(.top, DesignSystem.Spacing.md)
                }

                Spacer().frame(height: 40)
            }
        }
    }

    func dismiss() {
        withAnimation { isPresented = false }
    }
}

struct OnboardingPageData: Identifiable {
    let id: Int
    let image: String
    let title: String
    let description: String
}

struct OnboardingPageView: View {
    let data: OnboardingPageData

    var body: some View {
        VStack(spacing: DesignSystem.Spacing.xl) {
            ZStack {
                Circle()
                    .fill(DesignSystem.Colors.primary.opacity(0.12))
                    .frame(width: 160, height: 160)

                Image(systemName: data.image)
                    .font(.system(.largeTitle, weight: .light))
                    .foregroundStyle(DesignSystem.Colors.primary)
            }
            .padding(.bottom, 12)

            Text(data.title)
                .font(DesignSystem.Typography.largeTitle())
                .foregroundStyle(.white)

            Text(data.description)
                .font(DesignSystem.Typography.body(17))
                .foregroundStyle(DesignSystem.Colors.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .lineSpacing(4)
        }
    }
}
