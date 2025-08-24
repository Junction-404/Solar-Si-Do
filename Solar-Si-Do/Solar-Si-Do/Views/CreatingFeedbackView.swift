import SwiftUI

struct CreatingFeedbackView: View {
    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        VStack(spacing: 0) {
            Text("피드백 샌드위치 조리중...")
                .font(.system(size: 22, weight: .bold))
                .padding(.top, 68)
                .padding(.horizontal, 20)

            Text("너가 말해준 걸 토대로 피드백을 만들고 있어")
                .font(.system(size: 14, weight: .medium))
                .padding(.top, 8)
                .padding(.horizontal, 20)

            if let animation = LottieViewCacheManager.shared.animation(
                named: "Playful 3D Mascot Icon"
            ) {
                LottieView(animation: animation)
                    .frame(width: 324, height: 324)
                    .padding(.top, 119)
            } else {
                ProgressView()  // fallback UI
                    .frame(width: 324, height: 324)
                    .padding(.top, 119)
            }

            Spacer()
        }
    }
}

#Preview {
    CreatingFeedbackView()
}
