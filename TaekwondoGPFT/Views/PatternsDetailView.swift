//
//  PatternsDetailViewController.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 21/11/2022.
//

import SwiftUI

struct PatternDetailView: View {
    //MARK: - PROPERTIES
    
    var pattern: Patterns
    
    //MARK: - BODY
    
    var body: some View {
        Text(pattern.name)
        }
    }


struct FruitDetailView_Previews: PreviewProvider {
    static let patterns: [Patterns] = Bundle.main.decode("Patterns.json")
    static var previews: some View {
        PatternDetailView(pattern: patterns[0])
            .previewDevice("iPhone 11 Pro")
    }
}
