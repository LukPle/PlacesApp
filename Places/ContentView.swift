import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 2
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Feed()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "rectangle.grid.1x2.fill" : "rectangle.grid.1x2")
                        .environment(\.symbolVariants, .none)
                    Text(AppTexts.feed)
                        .fontWeight(selectedTab == 0 ? .medium : .regular)
                }
                .tag(0)
            Map()
                .tabItem {
                    Image(systemName: selectedTab == 1 ? "map.fill" : "map")
                        .environment(\.symbolVariants, .none)
                    Text(AppTexts.map)
                        .fontWeight(selectedTab == 1 ? .medium : .regular)
                }
                .tag(1)
            Collections()
                .tabItem {
                    Image(systemName: selectedTab == 2 ? "rectangle.stack.fill" : "rectangle.stack")
                        .environment(\.symbolVariants, .none)
                    Text(AppTexts.collections)
                        .fontWeight(selectedTab == 2 ? .medium : .regular)
                }
                .tag(2)
            Profile()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "person.fill" : "person")
                        .environment(\.symbolVariants, .none)
                    Text(AppTexts.profile)
                        .fontWeight(selectedTab == 3 ? .medium : .regular)
                }
                .tag(3)
        }.onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = UIColor(Color.white.opacity(0.25))
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}


#Preview {
    ContentView()
}
