//
//  RowTitleModifier.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 05/07/2023.
//

import SwiftUI

struct RowTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .regular, design: .serif))
            .fontWeight(.heavy)
            .lineLimit(1)
            .padding(.horizontal, 6)
    }
}
