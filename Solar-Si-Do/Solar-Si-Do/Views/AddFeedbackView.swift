import SwiftUI

struct AddFeedbackView: View {
    @StateObject private var viewModel = AddFeedbackViewModel()
    @State private var selectedIndex: Int? = nil
    @State private var selectedTab: Tab = .give
    let feedbackTargets = ["잼", "해피제이", "노터"]
    
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

            Text("나랑 날것 그대로 얘기하자,\n팀원에게 좋은말로 피드백 해줄게")
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 30)
                .padding(.top, 155)

            VStack(spacing: 0) {
                ForEach(0..<3, id: \.self) { index in
                    HStack {
                        Text("\(feedbackTargets[index])에 대해 얘기하기")
                            .font(.system(size: 16, weight: .regular))
                            .padding(.horizontal, 30)
                            .frame(width: 331, height: 52, alignment: .leading)
                            .background(Color.gray.opacity(0.2))
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 12)
                }
            }
            .padding(.top, 46)
            

            Spacer()
            
        }

    }
}

#Preview {
    AddFeedbackView()
}
