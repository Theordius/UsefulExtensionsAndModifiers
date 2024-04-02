//
//  StringPasswordValidation.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 02/04/2024.
//

/// Useful extension to check if typed in value is valid email adress
import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegex = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}"

        let emailPredicate = NSPredicate(
            format: "SELF MATCHES %@",
            emailRegex
        )
        return emailPredicate.evaluate(with: self)
    }
}


