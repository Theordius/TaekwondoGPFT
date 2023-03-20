//
//  BlueButton.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 02/03/2023.
//

import SwiftUI

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}
