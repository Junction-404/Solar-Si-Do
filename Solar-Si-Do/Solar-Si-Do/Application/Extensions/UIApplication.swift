//
//  Untitled.swift
//  Solar-Si-Do
//
//  Created by soyeonsoo on 8/24/25.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
