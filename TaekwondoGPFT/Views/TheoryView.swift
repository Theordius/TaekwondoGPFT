//
//  TheoryView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 02/03/2023.
//

import SwiftUI

struct TheoryView: View {
    //MARK: - PROPERTIES
    @StateObject var vm = Self.ViewModel()
    
    //MARK: - BODY
    var body: some View {
                List {
                    ForEach(vm.theory) { item in
                        NavigationLink(destination: TheoryDetailView(theory: item)) {
                            TheoryRow(theory: item)
                                .padding()
                        }
                    }
                }
            .navigationTitle("TEORIA TAEKWON-DO")
        }
    }

//MARK: - PREVIEW
struct TheoryView_Previews: PreviewProvider {
    static var previews: some View {
        TheoryView()
    }
}
