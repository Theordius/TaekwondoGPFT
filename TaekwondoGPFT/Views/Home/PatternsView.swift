//
//  PatternsView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 02/03/2023.
//

import SwiftUI

struct PatternsView: View {
    //MARK: - PROPERTIES
    @StateObject var viewModel = Self.ViewModel()
    
    //MARK: - BODY
    var body: some View {
            List {
                ForEach(viewModel.patterns) { item in
                    NavigationLink(destination: PatternDetailView(pattern: item)) {
                        PatternRow(pattern: item)
                            .padding()
                    }
                }
            }
        .navigationTitle("UKŁADY FORMALNE")
    }
}

//MARK: - PREVIEW
struct PatternsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PatternsView()
                .previewLayout(.sizeThatFits)
        }
    }
}
