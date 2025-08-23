import SwiftUI

struct WriteFeedbackView: View {
    @StateObject private var viewModel = WriteFeedbackViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("나한테만 말해봐~\n\n하워드에 대해 가감없이 말해봐\n하워드는 어떤 팀원이야?")
                .font(.headline)
                .frame(maxWidth: .infinity, maxHeight: 200, alignment: .leading)
            
            TextEditor(text: $viewModel.rawInput)
                .frame(height: 140)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
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
            } else if !viewModel.refinedFeedback.isEmpty {
                VStack(alignment: .leading, spacing: 10) {
                    Text("✅ 생성된 피드백:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(viewModel.refinedFeedback)
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(10)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

