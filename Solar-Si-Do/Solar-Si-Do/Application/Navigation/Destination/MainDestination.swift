
import SwiftUI

enum MainDestination: NavigationDestination {
    case home
    case writeFeedback
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .home:
            MainView()
        case .writeFeedback:
            WriteFeedbackView()
        }
    }
}
