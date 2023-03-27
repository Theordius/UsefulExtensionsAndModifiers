//
//  Directory.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 02/03/2023.
//

/*
 extension to get user filepath from the userDomainMask
 */

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask)
        return paths[0]
    }
}
