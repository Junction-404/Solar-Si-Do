import SwiftUI

enum MainDestination: NavigationDestination {
    case home
    case selectFeedbackStyle
    case writeFeedback
    case feedbackResult(feedback: String, actionItems: [String])
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .home:
            MainView()
        case .selectFeedbackStyle:
            SelectFeedbackStyleView()
        case .writeFeedback:
            WriteFeedbackView()
        case .feedbackResult(let feedback, let actionItems):
            FeedbackResultView(refinedFeedback: feedback, actionItems: actionItems)
        }
    }
}
