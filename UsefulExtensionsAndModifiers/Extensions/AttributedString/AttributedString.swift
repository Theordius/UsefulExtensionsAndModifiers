//
//  AttributedString.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 30/01/2026.
//

import Foundation

/// Attributed String extension that allows to show an error if convertion is unsucessful.
extension AttributedString {
    init(_ staticString: StaticString) {
        let string = String(describing: staticString)
        
        do {
            self = try AttributedString(markdown: string)
        } catch {
            fatalError("Failed to create AttributedString from \(staticString): \(error.localizedDescription)")
        }
    }
}
