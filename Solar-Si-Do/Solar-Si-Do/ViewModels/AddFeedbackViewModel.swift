//
//  Untitled.swift
//  Solar-Si-Do
//
//  Created by Jay on 8/23/25.
//

import Foundation

@MainActor
class AddFeedbackViewModel: ObservableObject {

    private let navigationManager = NavigationManager.shared
    
    func tapFeedbackButton() {
        navigationManager.navigate(to: .main(.writeFeedback))
    }
}
