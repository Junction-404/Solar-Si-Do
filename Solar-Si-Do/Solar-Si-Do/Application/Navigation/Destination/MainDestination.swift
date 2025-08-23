
import SwiftUI

enum MainDestination: NavigationDestination {
    case home
    case writeFeedbackStyle
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .home:
            MainView()
        case .writeFeedbackStyle:
            WriteFeedbackStyleView()
        }
    }
}
