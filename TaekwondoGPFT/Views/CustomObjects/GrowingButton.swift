//
//  GrowingButton.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 02/03/2023.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.5), value: configuration.isPressed)
    }
}
