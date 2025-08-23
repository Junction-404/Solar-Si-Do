import SwiftUI

struct AddFeedbackView: View {
    @StateObject private var viewModel = AddFeedbackViewModel()
    @State private var selectedIndex: Int? = nil
    @State private var selectedTab: Tab = .give
    let feedbackTargets = ["엘레나", "제인", "스티브"]

    enum Tab {
        case give, receive
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("TEAM 404")
                    .font(.system(size: 20, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()

                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 28, height: 28)
            }
            .padding(.top, 23)
            .padding(.horizontal, 20)

            Text("나랑 날것 그대로 얘기하자,\n팀원에게 좋은말로 피드백 해줄게")
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 30)
                .padding(.top, 95)

            VStack(spacing: 0) {
                ForEach(0..<3, id: \.self) { index in
                    HStack {
                        (
                            Text("\(feedbackTargets[index])")
                                .fontWeight(.bold)
                            +
                            Text("에 대해 얘기하기")
                                .fontWeight(.regular)
                        )
                        .font(.system(size: 16))
                        .padding(16)
                        .frame(width: 331, height: 52, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color(red: 151/255, green: 124/255, blue: 43/255, opacity: 0.15),
                                    radius: 10, x: 0, y: 2)
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 14)
                }
            }
            .padding(.top, 64)

            Spacer()

        }

    }
}

#Preview {
    AddFeedbackView()
}
