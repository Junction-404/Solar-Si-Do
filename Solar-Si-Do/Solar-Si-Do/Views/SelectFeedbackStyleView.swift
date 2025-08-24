import SwiftUI

struct SelectFeedbackStyleView: View {
    @StateObject private var viewModel = SelectFeedbackStyleViewModel()

    private var titleName: [String] = [
        "스페셜 샌드위치",
        "클래식 샌드위치",
        "할머니의 샌드위치"
    ]
    private let descriptions: [Text] = [
        Text("가장 두꺼운 빵으로 만들어져 칼로리는 조금 높지만\n")
        + Text("부드러운 톤의 피드백").fontWeight(.bold)
        + Text("을 받아볼 수 있어요."),

        Text("꼭 필요한 재료로만 만든 샌드위치예요. 군더더기 없이\n")
        + Text("깔끔한 피드백").fontWeight(.bold)
        + Text("을 받아볼 수 있어요."),

        Text("밭에서 막 딴 싱싱한 재료로 할머니가 직접 만든\n샌드위치에요. 처음엔 조금 낯설 수 있지만,\n")
        + Text("가장 예리한 피드백").fontWeight(.bold)
        + Text("을 받아볼 수 있어요.")
    ]
    private var images: [Image] = [
        Image("sandwich01"),
        Image("sandwich02"),
        Image("sandwich03"),
    ]
    @State private var selectedIndex: Int? = nil
    
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

            VStack(alignment: .leading, spacing: 0) {
                Image("sendyWink")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 82, height: 106)
                    .padding(.top, 43)
                    .padding(.horizontal, 20)

                Text("받길 원하는 피드백 스타일을 알려줘")
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.top, 12)
                    .padding(.horizontal, 20)

                Text("팀원이 작성한 너의 피드백을 원하는 스타일로 받을 수 있어")
                    .font(.system(size: 14, weight: .medium))
                    .padding(.top, 8)
                    .padding(.horizontal, 20)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        Spacer(minLength: 20)
                        ForEach(0..<3, id: \.self) { index in
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(Color.white)
                                    .frame(width: 331, height: 300)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 18)
                                            .strokeBorder(selectedIndex == index ? Color("sendwichBrown") : .clear, lineWidth: 2)
                                    )

                                VStack {
                                    images[index]
                                        .resizable()
                                        .frame(width: 178, height: 130)

                                    Text(titleName[index])
                                        .font(.system(size: 17, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .padding(.top, 9)
                                    
                                    descriptions[index]
                                        .font(.system(size: 13, weight: .medium))
                                        .multilineTextAlignment(.center)
                                        .padding(.top, 9)

                                }
                            }
                            .onTapGesture {
                                selectedIndex = index
                            }

                            Spacer(minLength: 20)
                        }
                    }
                    .padding(.top, 47)
                }

                Spacer()

                Button(
                    action:
                        viewModel.tapNextButton
                ) {
                    Text("피드백 스타일 설정 완료")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: 46)
                        .background(Color("sendwichBrown"))
                        .cornerRadius(12)
                }
                .padding(.bottom, 54)
                .padding(.horizontal, 20)
            }

        }
        .toolbar(.hidden)
    }
}

#Preview {
    SelectFeedbackStyleView()
}
