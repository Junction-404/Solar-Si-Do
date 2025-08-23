import SwiftUI

struct ReceiveFeedbackView: View {
    @StateObject private var viewModel = ReceiveFeedbackViewModel()
    @State private var selectedTab: Tab = .give
    
    enum Tab {
        case give, receive
    }

    var body: some View {
        VStack(spacing: 0) {
            Text("TEAM 404")
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 55)
                .padding(.horizontal, 30)

            Spacer()
        }
    }
}

#Preview {
    ReceiveFeedbackView()
}
