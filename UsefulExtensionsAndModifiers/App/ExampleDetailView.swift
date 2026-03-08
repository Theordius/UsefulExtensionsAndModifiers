//
//  ExampleDetailView.swift
//  UsefulExtensionsAndModifiers
//
//  Created by Rafał Gęsior on 08/03/2026.
//

import SwiftUI

/// Level 3: A dismissible sheet showing a live interactive example.
struct ExampleDetailView: View {
    let category: ShowcaseCategory
    let item: ShowcaseItem
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    exampleContent
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .navigationTitle(item.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }

    @ViewBuilder
    private var exampleContent: some View {
        switch (category, item.title) {
        case (.string, "Camel Case Spacing"):
            CamelCaseSpacingExample()
        case (.string, "Email Validation"):
            EmailValidationExample()
        case (.attributedString, _):
            AttributedStringStaticExample()
        case (.array, _):
            SymmetricDifferenceExample()
        case (.url, _):
            URLStaticStringExample()
        case (.bundle, "JSON Decoding"):
            BundleJSONDecodingExample()
        case (.bundle, "String Array"):
            BundleStringArrayExample()
        case (.color, _):
            ColorCodableExample()
        case (.fileManager, _):
            DocumentsDirectoryExample()
        case (.view, "Title Style"):
            TitleStyleExample()
        case (.view, "Hide Keyboard"):
            HideKeyboardExample()
        case (.viewModifier, _):
            CenterModifierExample()
        default:
            Text("No example available.")
        }
    }
}

// MARK: - String Examples

private struct CamelCaseSpacingExample: View {
    @State private var input = "helloWorld"

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Type a camelCase string:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            TextField("camelCaseInput", text: $input)
                .textFieldStyle(.roundedBorder)

            Label("Result", systemImage: "arrow.right.circle")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(input.addSpaceBetweenCamelCases())
                .font(.title3)
                .bold()
        }
    }
}

private struct EmailValidationExample: View {
    @State private var email = "user@example.com"

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Type an email address:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            TextField("email", text: $email)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)

            Label(
                email.isValidEmail() ? "Valid email" : "Invalid email",
                systemImage: email.isValidEmail() ? "checkmark.circle.fill" : "xmark.circle.fill"
            )
            .foregroundStyle(email.isValidEmail() ? .green : .red)
            .font(.title3)
        }
    }
}

// MARK: - AttributedString Examples

private struct AttributedStringStaticExample: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Input StaticString:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("\"some **markdown** text\"")
                .font(.body.monospaced())
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.quaternary)
                .clipShape(.rect(cornerRadius: 8))

            Text("Rendered:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(AttributedString("some **markdown** text"))
                .font(.title3)
        }
    }
}

// MARK: - Array Examples

private struct SymmetricDifferenceExample: View {
    private let array1 = [1, 2, 3]
    private let array2 = [2, 3, 4]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Array 1:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(array1.description)
                .font(.body.monospaced())

            Text("Array 2:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(array2.description)
                .font(.body.monospaced())

            Label("Symmetric Difference", systemImage: "arrow.right.circle")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(array1.difference(from: array2).sorted().description)
                .font(.title3)
                .bold()
        }
    }
}

// MARK: - URL Examples

private struct URLStaticStringExample: View {
    private let url: URL = {
        let string: StaticString = "https://apple.com"
        return URL(string)
    }()

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Code:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("URL(\"https://apple.com\")")
                .font(.body.monospaced())
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.quaternary)
                .clipShape(.rect(cornerRadius: 8))

            Label("Result", systemImage: "arrow.right.circle")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(url.absoluteString)
                .font(.title3)
                .bold()
        }
    }
}

// MARK: - Bundle Examples

private struct BundleJSONDecodingExample: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Usage:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("let items: [Item] = Bundle.main.decode(\"data.json\")")
                .font(.body.monospaced())
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.quaternary)
                .clipShape(.rect(cornerRadius: 8))

            Text("Decodes any Codable type from a bundled JSON file using a generic function.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }
}

private struct BundleStringArrayExample: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Usage:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("Bundle.main.loadStringArray(from: \"file.txt\")")
                .font(.body.monospaced())
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.quaternary)
                .clipShape(.rect(cornerRadius: 8))

            Text("Loads a text file and splits it into [String] by newlines.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - Color Examples

private struct ColorCodableExample: View {
    @State private var selectedColor = Color.blue

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Pick a color to encode:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            ColorPicker("Color", selection: $selectedColor)

            if let data = try? JSONEncoder().encode(selectedColor),
               let json = String(data: data, encoding: .utf8) {
                Text("Encoded JSON:")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text(json)
                    .font(.body.monospaced())
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.quaternary)
                    .clipShape(.rect(cornerRadius: 8))
            }
        }
    }
}

// MARK: - FileManager Examples

private struct DocumentsDirectoryExample: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Usage:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("FileManager.documentsDirectory")
                .font(.body.monospaced())
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.quaternary)
                .clipShape(.rect(cornerRadius: 8))

            Text("Example output:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("file:///var/mobile/.../Documents/")
                .font(.body.monospaced())
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.quaternary)
                .clipShape(.rect(cornerRadius: 8))

            Text("Returns the user's documents directory URL. The actual path depends on the device and app sandbox.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - View Examples

private struct TitleStyleExample: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Normal text:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("Hello, World!")

            Text("With .titleStyle():")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("Hello, World!")
                .titleStyle()
        }
    }
}

private struct HideKeyboardExample: View {
    @State private var text = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Tap the text field, then tap the button:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            TextField("Type something...", text: $text)
                .textFieldStyle(.roundedBorder)

            Button("Hide Keyboard", systemImage: "keyboard.chevron.compact.down") {
                hideKeyboard()
            }
        }
    }
}

// MARK: - ViewModifier Examples

private struct CenterModifierExample: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Without CenterModifier:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("Left-aligned text")
                .padding()
                .background(.quaternary)
                .clipShape(.rect(cornerRadius: 8))

            Text("With CenterModifier:")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("Centered text")
                .modifier(CenterModifier())
                .padding()
                .background(.quaternary)
                .clipShape(.rect(cornerRadius: 8))
        }
    }
}

// MARK: - Previews

#Preview("String — Camel Case") {
    ExampleDetailView(category: .string, item: ShowcaseItem(title: "Camel Case Spacing", description: ""))
}

#Preview("Color — Codable") {
    ExampleDetailView(category: .color, item: ShowcaseItem(title: "Codable", description: ""))
}
