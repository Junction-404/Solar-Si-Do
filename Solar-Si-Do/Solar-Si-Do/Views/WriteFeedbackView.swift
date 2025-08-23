import SwiftUI

struct WriteFeedbackView: View {
    @StateObject private var viewModel = WriteFeedbackViewModel()
    let peerName: String = "하워드"
    
    var body: some View {
        VStack(spacing: 0) {
            HStack{
                Text("나한테만 편하게 말해봐~\n\(peerName)는 어떤 팀원이야?")
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: 120, alignment: .leading)
                Image("character")
                    .border(Color.gray, width: 1)
            }
            
            TextEditor(text: $viewModel.rawInput)
                .frame(height: 400)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Spacer()
                        
            Button {
                viewModel.generateFeedback()
            } label: {
                Text("작성 완료하기")
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            if viewModel.isLoading {
                ProgressView("생성 중...")
                    .padding(.top)
            }
        }
        .padding()
    }
}
