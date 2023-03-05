//
//  TheoryDetailView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 01/12/2022.
//

import SwiftUI

struct TheoryDetailView: View {
    //MARK: - PROPERTIES
    
    var theory: Theory
    
    //MARK: - BODY
    
    var body: some View {
        Text(theory.name)
        }
    }


struct TheoryDetailView_Previews: PreviewProvider {
    static let theory: [Theory] = Bundle.main.decode("Theory.json")
    static var previews: some View {
        TheoryDetailView(theory: theory[0])
            .previewDevice("iPhone 11 Pro")
    }
}
