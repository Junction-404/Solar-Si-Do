import SwiftUI

struct WriteFeedbackView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel = WriteFeedbackViewModel()
    let peerName: String = "엘레나"
    
    var body: some View {
        ZStack{
            Color.sendwichYellow
                .ignoresSafeArea()
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            
            VStack(spacing: 0) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 23))
                            .foregroundColor(.black)
                            .padding(8)
                    }

                    Spacer()
                }
                
                HStack{
                    Image("sendySmile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110, height: 120)
                    Spacer()
                    
                    ZStack{
                        Image("speechBubble")
                            .resizable()
                            .frame(width: 248, height: 76)

                        Text("나한테만 편하게 말해봐~\n\(peerName)는 어떤 팀원이야?")
                            .font(.system(size: 18, weight: .semibold))
                            .lineSpacing(2)
                    }
                }
                .padding(.top, 12)
                .padding(.bottom, -6)

                ZStack(alignment: .topLeading){
                    TextEditor(text: $viewModel.rawInput)
                        .padding(16)
                        .scrollContentBackground(.hidden)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: Color(red: 0.59, green: 0.49, blue: 0.17).opacity(0.1), radius: 7.5, x: 0, y: 2)
                    if viewModel.rawInput.isEmpty {
                        Text("솔직하게 뭐든지 말해도 괜찮아")
                            .font(.system(size: 14, weight: .light))
                            .foregroundColor(.black.opacity(0.4))
                            .padding(20)
                            .padding(.top, 4)
                    }
                }
                .padding(.bottom, 44)
                
                Button {
                    viewModel.generateFeedback()
                } label: {
                    Text("다음")
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.sendwichBrown)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.bottom, 20)
                
                if viewModel.isLoading {
                    ProgressView("생성 중...")
                        .padding(.top)
                }
            }
            .padding(.horizontal, 20)
        }
        .toolbar(.hidden)
    }
}

#Preview {
    WriteFeedbackView()
}
