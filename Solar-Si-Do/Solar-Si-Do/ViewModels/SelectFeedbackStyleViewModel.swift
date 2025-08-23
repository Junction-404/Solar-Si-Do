//
//  Untitled.swift
//  Solar-Si-Do
//
//  Created by Jay on 8/23/25.
//


import Foundation

@MainActor
class SelectFeedbackStyleViewModel: ObservableObject {
    
    private let navigationManager = NavigationManager.shared
    
    func tapNextButton() {
        navigationManager.navigate(to: .main(.home))
    }

}
