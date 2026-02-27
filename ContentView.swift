import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var showOnboarding = false
    @State private var selectedTab: Tab = .lab

    enum Tab {
        case lab
        case nuclear
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Molecular Lab", systemImage: "atom")
            }
            .tag(Tab.lab)

            NuclearLabView()
                .tabItem {
                    Label("Nuclear Lab", systemImage: "burst.fill")
                }
                .tag(Tab.nuclear)
        }
        .tint(DesignSystem.Colors.primary)
        .preferredColorScheme(.dark)
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance

            if !hasSeenOnboarding {
                Task { @MainActor in
                    showOnboarding = true
                }
            }
        }
        .fullScreenCover(isPresented: $showOnboarding, onDismiss: {
            hasSeenOnboarding = true
        }) {
            OnboardingView(isPresented: $showOnboarding)
        }
    }
}
