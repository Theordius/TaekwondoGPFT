//
//  DescriptionTextModifier.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 05/07/2023.
//

import Foundation
import SwiftUI

struct DescriptionTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.leading)
            .italic()
            .foregroundColor(Color.customGrayMedium)
            .font(.system(size: 16, weight: .regular, design: .serif))
            .lineSpacing(4)
            .lineLimit(nil)
    }
}
