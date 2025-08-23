import SwiftUI

enum MainDestination: NavigationDestination {
    case home
    case writeFeedback
    case feedbackResult(feedback: String, actionItems: [String])
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .home:
            MainView()
        case .writeFeedback:
            WriteFeedbackView()
        case .feedbackResult(let feedback, let actionItems):
            FeedbackResultView(refinedFeedback: feedback, actionItems: actionItems)
        }
    }
}
