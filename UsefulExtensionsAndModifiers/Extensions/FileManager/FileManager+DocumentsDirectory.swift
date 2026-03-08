//
//  FileManager+DocumentsDirectory.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 02/03/2023.
//

/*
 Extension to get the user's documents directory.
 Note: Modern API provides URL.documentsDirectory directly.
 */

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
