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
    @StateObject var viewModel = Self.ViewModel()
    @EnvironmentObject var router: Router

    // MARK: - BODY

    var body: some View {
        Group {
            switch viewModel.modelState {
            case let .failure(error):
                Text(error.localizedDescription)
            case let .loadded(model: model):
                List {
                    ForEach(model) { theory in
                        NavigationLink(value: theory) {
                            TheoryRow(theory: theory)
                                .padding(.vertical, 6.0)
                        }
                    }

                    .listStyle(.inset)
                }
                .navigationDestination(for: Theory.self) { theory in
                    TheoryDetailView(theory: theory)
                }

                .navigationTitle("TEORIA TAEKWON-DO")
            case .loading:
                ProgressView()
            }
        }.task {
            viewModel.loadDataAsync()
        }
    }
}

// MARK: - PREVIEW

struct TheoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TheoryView()
        }
    }
}
