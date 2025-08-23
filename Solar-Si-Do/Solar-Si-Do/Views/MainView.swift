import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        VStack(spacing: 0) {
            TabView {
                AddFeedbackView()
                    .tabItem {
                        Image(systemName: "person.crop.rectangle.stack")
                        Text("피드백 주기")
                    }

                ReceiveFeedbackView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("피드백 받기")
                    }
            }
            .tint(.black)
        }
    }

}

#Preview {
    MainView()
}
