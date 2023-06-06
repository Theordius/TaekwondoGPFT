//
//  PatternsView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 02/03/2023.
//

import SwiftUI
struct PatternsView: View {
    // MARK: - PROPERTIES

    let title: String = "UKŁADY FORMALNE"

    @StateObject var viewModel = Self.ViewModel()!

    // MARK: - BODY

    var body: some View {
        List {
            ForEach(viewModel.model) { pattern in
                NavigationLink(value: Route.patternDetail(pattern)) {
                    PatternRow(pattern: pattern)
                        .padding(.vertical, 6.0)
                }
            }
        }
        .navigationTitle(title)
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
