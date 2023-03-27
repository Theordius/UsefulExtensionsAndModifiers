//
//  Collection_CountingOddNumbers.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 27/03/2023.
//

/*
 Extension to modify Collection Class to count odd numbers easier
 */

import Foundation

extension Collection {
    func count(where test: (Element) throws -> Bool) rethrows -> Int {
        return try self.filter(test).count
    }
}

/// example: let odd = [1, 2, 3, 4, 5].count { $0 % 2 == 1 }


