
import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        TabView {
            AddFeedbackView()
                .tabItem {
                    Text("피드백 주기")
                }
            
            ReceiveFeedbackView()
                .tabItem {
                    Text("피드백 받기")
                }
        }
    }
}

#Preview {
    MainView()
}
