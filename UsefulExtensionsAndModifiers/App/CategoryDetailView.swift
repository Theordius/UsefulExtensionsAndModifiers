//
//  CategoryDetailView.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 08/03/2026.
//

import SwiftUI

/// Level 2: Lists the individual extensions or modifiers within a category.
struct CategoryDetailView: View {
    let category: ShowcaseCategory
    @State private var selectedItem: ShowcaseItem?

    var body: some View {
        List(category.items) { item in
            Button {
                selectedItem = item
            } label: {
                ItemRow(item: item)
            }
        }
        .navigationTitle(category.displayName)
        .sheet(item: $selectedItem) { item in
            ExampleDetailView(category: category, item: item)
        }
    }
}

/// A row displaying an item's title and description.
struct ItemRow: View {
    let item: ShowcaseItem

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(item.title)
                .font(.headline)
                .foregroundStyle(.black)

            Text(item.description)
                .font(.body)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    NavigationStack {
        CategoryDetailView(category: .string)
    }
}
