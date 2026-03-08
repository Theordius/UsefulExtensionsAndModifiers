//
//  ShowcaseCatalog.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 08/03/2026.
//

import Foundation

/// A category grouping related extensions or modifiers.
enum ShowcaseCategory: String, CaseIterable, Identifiable, Hashable {
    case string = "String"
    case attributedString = "Attributed String"
    case array = "Array"
    case url = "URL"
    case bundle = "Bundle"
    case color = "Color"
    case fileManager = "File Manager"
    case view = "View"
    case viewModifier = "View Modifiers"

    var id: Self { self }

    var displayName: String { rawValue }

    var icon: String {
        switch self {
        case .string:           "textformat.abc"
        case .attributedString: "bold.italic.underline"
        case .array:            "square.stack.3d.up"
        case .url:              "link"
        case .bundle:           "doc.zipper"
        case .color:            "paintpalette"
        case .fileManager:      "folder"
        case .view:             "rectangle.on.rectangle"
        case .viewModifier:     "slider.horizontal.3"
        }
    }

    var items: [ShowcaseItem] {
        switch self {
        case .string:
            [
                ShowcaseItem(
                    title: "Camel Case Spacing",
                    description: "Adds spaces between camelCase words."
                ),
                ShowcaseItem(
                    title: "Email Validation",
                    description: "Validates an email address format."
                )
            ]
        case .attributedString:
            [
                ShowcaseItem(
                    title: "StaticString Init",
                    description: "Creates an AttributedString from a StaticString with markdown parsing."
                )
            ]
        case .array:
            [
                ShowcaseItem(
                    title: "Symmetric Difference",
                    description: "Finds elements that exist in one array but not both."
                )
            ]
        case .url:
            [
                ShowcaseItem(
                    title: "StaticString Init",
                    description: "Creates a URL from a StaticString without force unwrapping."
                )
            ]
        case .bundle:
            [
                ShowcaseItem(
                    title: "JSON Decoding",
                    description: "Decodes a JSON file from the bundle into any Codable type."
                ),
                ShowcaseItem(
                    title: "String Array",
                    description: "Loads a text file from the bundle as [String], split by newlines."
                )
            ]
        case .color:
            [
                ShowcaseItem(
                    title: "Codable",
                    description: "Adds Encodable & Decodable conformance to SwiftUI Color."
                )
            ]
        case .fileManager:
            [
                ShowcaseItem(
                    title: "Documents Directory",
                    description: "Provides a static documentsDirectory property."
                )
            ]
        case .view:
            [
                ShowcaseItem(
                    title: "Title Style",
                    description: "Applies a large, bold, indigo title style."
                ),
                ShowcaseItem(
                    title: "Hide Keyboard",
                    description: "Dismisses the keyboard programmatically."
                )
            ]
        case .viewModifier:
            [
                ShowcaseItem(
                    title: "CenterModifier",
                    description: "A ViewModifier that horizontally centers content using spacers."
                )
            ]
        }
    }
}

/// A single extension or modifier within a category.
struct ShowcaseItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
}
