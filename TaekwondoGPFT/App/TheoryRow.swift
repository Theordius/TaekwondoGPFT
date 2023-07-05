//
//  TheoryRow.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 05/03/2023.
//

import SwiftUI

struct TheoryRow: View {
    // MARK: - PROPERTIES

    var theory: Theory

    // MARK: - BODY

    var body: some View {
        HStack {
            Image(systemName: "books.vertical")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundColor(.blue)
            Text(theory.name)
                .modifier(RowTitleModifier())
        }
        .foregroundColor(.black)
    }
}

// MARK: - PREVIEW

struct TheoryRow_Previews: PreviewProvider {
    static let theory: [Theory] = Bundle.main.decode("Theory.json")
    static var previews: some View {
        TheoryRow(theory: theory[0])
            .previewLayout(.sizeThatFits)
    }
}
