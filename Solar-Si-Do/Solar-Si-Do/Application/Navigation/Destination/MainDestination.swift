import SwiftUI

enum MainDestination: NavigationDestination {
    case home
    case selectFeedbackStyle
    case writeFeedback
    case creatingFeedback
    case feedbackResult(feedback: String, actionItems: [String], rawInput: String)
    case sendFeedback
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .home:
            MainView()
        case .selectFeedbackStyle:
            SelectFeedbackStyleView()
        case .writeFeedback:
            WriteFeedbackView()
        case .creatingFeedback:
            CreatingFeedbackView()
        case .feedbackResult(let feedback, let actionItems, let rawInput):
            FeedbackResultView(refinedFeedback: feedback, actionItems: actionItems, rawInput: rawInput)
        case .sendFeedback:
            SendFeedbackView()
        }
    }
}
