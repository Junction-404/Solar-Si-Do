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
                    Button(
                        action: viewModel.tapBackButton
                    ) {
                        Text("TEAM 404")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    Spacer()

                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .foregroundColor(Color("sendwichBrown"))
                        .frame(width: 28, height: 28)
                }
                .padding(.top, 23)
                .padding(.horizontal, 20)

                HStack {
                    Image("sendyWink")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 88, height: 130)

                    ZStack {
                        Image("speechBubbleGreen")
                            .resizable()
                            .frame(width: 252, height: 68)

                        Text("나랑 날것 그대로 이야기하자,\n팀원에게 보낼 피드백을 만들어줄게")
                            .font(.system(size: 16, weight: .bold))
                            .padding(.leading, 10)
                    }
                }
                .padding(.top, 54)
                .padding(.horizontal, 20)

                VStack(spacing: 0) {
                    ForEach(0..<3, id: \.self) { index in
                        Button(
                            action:
                                viewModel.tapFeedbackButton
                        ) {
                            HStack {
                                (Text("\(feedbackTargets[index])")
                                    .fontWeight(.bold)
                                    + Text("에 대해 얘기하기")
                                    .fontWeight(.regular))
                                    .font(.system(size: 16))
                                    .foregroundStyle(.black)
                                    .padding(16)
                                    .frame(
                                        width: 353,
                                        height: 53,
                                        alignment: .leading
                                    )
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    .shadow(
                                        color: Color(
                                            red: 151 / 255,
                                            green: 124 / 255,
                                            blue: 43 / 255,
                                            opacity: 0.15
                                        ),
                                        radius: 10,
                                        x: 0,
                                        y: 2
                                    )
                            }
                            .padding(.bottom, 14)
                        }
                    }
                }
                .padding(.top, 32)

                Spacer()
            }
        }
        .toolbar(.hidden)
    }
}

#Preview {
    AddFeedbackView()
}
