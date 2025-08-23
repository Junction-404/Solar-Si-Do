//
//  Untitled.swift
//  Solar-Si-Do
//
//  Created by Jay on 8/23/25.
//


import Foundation

@MainActor
class MainViewModel: ObservableObject {
    
    private let navigationManager = NavigationManager.shared
    
    func tapNextButton() {
        navigationManager.navigate(to: .main(.writeFeedback))
    }
}
