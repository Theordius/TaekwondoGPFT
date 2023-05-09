//
//  TheoryView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 02/03/2023.
//

import SwiftUI

struct TheoryView: View {
    // MARK: - PROPERTIES

//    @StateObject var viewModel2 = Self.ViewModel2(fileName: "Theory.json")!
//    @StateObject var viewModel3 = Self.ViewModel2()!
    @StateObject var viewModel = Self.ViewModel()!

    // MARK: - BODY

    var body: some View {
        List {
            ForEach(viewModel.model) { item in
                NavigationLink(destination: TheoryDetailView(theory: item)) {
                    TheoryRow(theory: item)
                        .padding()
                }
            }
        }
        .listStyle(.inset)
        .navigationTitle("TEORIA TAEKWON-DO")
    }
}

// MARK: - PREVIEW

struct TheoryView_Previews: PreviewProvider {
    static var previews: some View {
        TheoryView()
    }
}
