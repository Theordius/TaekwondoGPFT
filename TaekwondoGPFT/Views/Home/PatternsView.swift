//
//  PatternsView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 02/03/2023.
//

import SwiftUI
struct PatternsView: View {
    // MARK: - PROPERTIES

    @StateObject var viewModel = Self.ViewModel()!

    // MARK: - BODY

    var body: some View {
        List {
            ForEach(viewModel.model) { pattern in
                NavigationLink(value: pattern) {
                    PatternRow(pattern: pattern)
                        .padding(.vertical, 6.0)
                }
            }
        }
        .navigationDestination(for: Patterns.self) { pattern in
            PatternDetailView(pattern: pattern)
        }
        .navigationTitle("UKŁADY FORMALNE")
    }
}

// MARK: - PREVIEW

struct PatternsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PatternsView()
                .previewLayout(.sizeThatFits)
        }
    }
}
