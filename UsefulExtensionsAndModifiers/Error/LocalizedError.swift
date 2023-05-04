//
//  LocalizedError.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 04/05/2023.
//

import Foundation

/// Useful extension to show more detailed description of the error in the console box
extension LocalizedError {
    var errorDesription: String? {
        return "\(self)"
    }
}
