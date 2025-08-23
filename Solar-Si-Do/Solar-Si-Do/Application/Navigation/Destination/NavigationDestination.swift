import SwiftUI

protocol NavigationDestination: Hashable {
    associatedtype ViewType: View
    @ViewBuilder func view() -> ViewType
}

enum AppDestination: Hashable {
    case main(MainDestination)
}

extension AppDestination {
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .main(let destination):
            destination.view()
        }
    }
}
