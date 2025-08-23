
import SwiftUI

enum MainDestination: NavigationDestination {
    case home
    case selectFeedbackStyle
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .home:
            MainView()
        case .selectFeedbackStyle:
            SelectFeedbackStyleView()
        }
    }
}
