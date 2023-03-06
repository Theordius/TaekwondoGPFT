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
        VStack(alignment: .center, spacing: 26) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
            Text("")
            
            Divider().padding(.horizontal,6)
            
            Text(pattern.name)
                .font(.headline)
                .foregroundColor(.blue)
            
            Divider().padding(.horizontal, 6)
            
            Text(pattern.description!)
                .font(.system(.subheadline))
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .lineLimit(.max)
            
        }
        .padding()
       
    }
    
    
}


struct PatternsDetailView_Previews: PreviewProvider {
    static let patterns: [Patterns] = Bundle.main.decode("Patterns.json")
    static var previews: some View {
        PatternDetailView(pattern: patterns[0])
            .previewDevice("iPhone 11 Pro")
    }
}
