//
//  AddSpaceBetweenCamelCases.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 06/09/2024.
//

import Foundation

/// Useful extension that adds space between each camel case in String
extension String {
    func addSpaceBetweenCamelCases() -> String {
        return self.unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) && !$0.isEmpty {
                return $0 + " " + String($1)
            } else {
                return $0 + String($1)
            }
        }
    }
}

