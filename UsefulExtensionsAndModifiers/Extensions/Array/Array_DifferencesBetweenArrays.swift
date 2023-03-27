//
//  Array_DifferencesBetweenArrays.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 27/03/2023.
//

/*
 Array extension that could help to get the differences from one array to the other
 */

import Foundation

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let firstSet = Set(self)
        let secondSet = Set(other)
        return Array(firstSet.symmetricDifference(secondSet))
    }
}

/// Use examle:
/// let array1 = ["Rufus", "Waldek", "Ewelina"]
/// let array2 = ["Iga", "Ziomek", "John]
/// let difference = array1.difference(from: array2)
