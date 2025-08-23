import SwiftUI

enum MainDestination: NavigationDestination {
    case home
    case writeFeedback
    case feedbackResult(String)
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .home:
            MainView()
        case .writeFeedback:
            WriteFeedbackView()
        case .feedbackResult(let feedback):
            FeedbackResultView(feedback: feedback)
        }
    }
}
