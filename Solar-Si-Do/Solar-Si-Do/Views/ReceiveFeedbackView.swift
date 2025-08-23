import SwiftUI

struct ReceiveFeedbackView: View {
    @StateObject private var viewModel = ReceiveFeedbackViewModel()
    @State private var selectedTab: Tab = .give

    enum Tab {
        case give, receive
    }

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color("sendwichGradientYellowGreen"),
                    Color("sendwichGradientYellow"),
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {
                HStack {
                    Text("TEAM 404")
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()

                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .foregroundColor(Color("sendwichBrown"))
                        .frame(width: 28, height: 28)
                }
                .padding(.top, 23)
                .padding(.horizontal, 20)

                Spacer()
            }
        }
    }
 
}

#Preview {
    ReceiveFeedbackView()
}
