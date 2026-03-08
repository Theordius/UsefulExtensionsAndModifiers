//
//  ContentView.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 02/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(ShowcaseCategory.allCases) { category in
                NavigationLink(value: category) {
                    CategoryRow(category: category)
                }
            }
            .navigationTitle("Extensions & Modifiers")
            .navigationDestination(for: ShowcaseCategory.self) { category in
                CategoryDetailView(category: category)
            }
        }
    }
}

struct CategoryRow: View {
    let category: ShowcaseCategory

    var body: some View {
        Label {
            HStack {
                Text(category.displayName)

                Spacer()

                Text(category.items.count, format: .number)
                    .foregroundStyle(.secondary)
            }
        } icon: {
            Image(systemName: category.icon)
                .foregroundStyle(.primary)
        }
    }
}

#Preview {
    ContentView()
}
