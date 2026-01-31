//
//  TitleStyle.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 31/01/2026.
//

import SwiftUI

/// An title modifier example with macro that will not allow to use it without dot before the method by sending message: "Use of 'titleStyle' treated as a reference to instance method in protocol 'View'"
extension View {
    @warn_unqualified_access
    func titleStyle() -> some View {
        self
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundStyle(.indigo)
    }
}
