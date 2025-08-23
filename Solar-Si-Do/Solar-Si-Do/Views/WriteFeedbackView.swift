import SwiftUI

struct WriteFeedbackView: View {
    @StateObject private var viewModel = WriteFeedbackViewModel()
    let peerName: String = "하워드"
    
    var body: some View {
        ZStack{
            Color.sendwichYellow
                .ignoresSafeArea()
            VStack(spacing: 0) {
                HStack{
                    Text("나한테만 편하게 말해봐~\n\(peerName)는 어떤 팀원이야?")
                        .font(.system(size: 20, weight: .semibold))
                        .lineSpacing(2)
                        .padding()
                        .background(Color(red: 1, green: 0.83, blue: 0.13).opacity(0.2))
                        .cornerRadius(20)
                    Spacer()
                    Image("sendySmile")
                }
                .padding(.bottom, 8)
                
                ZStack{
                    TextEditor(text: $viewModel.rawInput)
                        .padding(16)
                        .scrollContentBackground(.hidden)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: Color(red: 0.59, green: 0.49, blue: 0.17).opacity(0.1), radius: 7.5, x: 0, y: 2)
                    
                    Text("솔직하게 뭐든지 말해도 괜찮아")
                        .font(.system(size: 16, weight: .light))
                        .foregroundColor(.black.opacity(0.4))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
                .padding(.bottom, 44)
                
                Button {
                    viewModel.generateFeedback()
                } label: {
                    Text("다 말했어")
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.sendwichBrown)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                if viewModel.isLoading {
                    ProgressView("생성 중...")
                        .padding(.top)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    WriteFeedbackView()
}
