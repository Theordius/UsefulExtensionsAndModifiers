//
//  CenterModifier.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 02/03/2023.
//

// A modifier which enebles you to center current content

import SwiftUI

/// Use example:  You can use .modifier with any kind of view to make it centered on the screen.
struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}


