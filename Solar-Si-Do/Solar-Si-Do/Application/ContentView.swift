import SwiftUI

struct ContentView: View {
    @StateObject private var navigationManager = NavigationManager.shared

    init() {
        LottieViewCacheManager.shared.preload(named: "Playful 3D Mascot Icon")
    }

    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            navigationManager.getRootView()
                .navigationDestination(for: AppDestination.self) {
                    destination in
                    destination.view()
                }
        }
    }
}

#Preview {
    ContentView()
}
