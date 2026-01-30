//
//  StaticString.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 30/01/2026.
//

import Foundation

/// URL extension that allows to use url adress without force unwrapping
/// ex. let url = URL("https://apple.com")

extension URL {
    init(_ staticString: StaticString) {
        let string = String(describing: staticString)
        
        if let url = URL(string: string) {
            self = url
        } else {
            fatalError("Unable to create URL from string: \(staticString)")
        }
    }
}
