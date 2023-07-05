//
//  PatternRow.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 05/03/2023.
//

import SwiftUI

struct PatternRow: View {
    // MARK: - PROPERTIES

    var pattern: Patterns

    // MARK: - BODY

    var body: some View {
        HStack {
            Image(systemName: "figure.kickboxing")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundColor(.blue)
            Text(pattern.name)
                .modifier(RowTitleModifier())
        }
        .foregroundColor(.black)
    }
}

// MARK: - PREVIEW

struct PatternRow_Previews: PreviewProvider {
    static let patterns: [Patterns] = Bundle.main.decode("Patterns.json")

    static var previews: some View {
        PatternRow(pattern: patterns[3])
            .previewLayout(.sizeThatFits)
    }
}
