import SwiftUI

struct SelectFeedbackStyleView: View {
    @StateObject private var viewModel = SelectFeedbackStyleViewModel()
    @State private var selectedIndex: Int? = nil

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            Text("너가 받길 원하는 피드백 스타일을 알려줘")
                .font(.system(size: 20, weight: .semibold))

            Text("팀원이 작성한 너의 피드백을 원하는 스타일로 받을 수 있어")
                .font(.system(size: 14, weight: .medium))
                .padding(.top, 8)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 19) {
                    ForEach(0..<5, id: \.self) { index in
                        let isSelected = selectedIndex == index

                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 312, height: 384)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .strokeBorder(
                                        isSelected
                                            ? .blue : .gray,
                                        lineWidth: 3
                                    )
                            )
                            .onTapGesture {
                                selectedIndex = index
                            }

                    }
                }
                .padding(.top, 47)
                .padding(.horizontal, 30)
            }
            .padding(.leading, 4)

            Spacer()

            Button(action: viewModel.tapNextButton) {
                Text("피드백 스타일 설정 완료")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.black)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 24)
                    .background(Color.gray.opacity(0.2))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 2)
                    )
            }
            .padding(.bottom, 60)
        }
    }
}

#Preview {
    SelectFeedbackStyleView()
}
