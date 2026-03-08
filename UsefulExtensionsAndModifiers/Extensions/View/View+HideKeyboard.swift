//
//  View+HideKeyboard.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 02/03/2023.
//

/*
 Simple view extension that makes the keyboard disappear after the action is called.
*/

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
