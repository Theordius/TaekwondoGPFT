//
//  BlueCapsule.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 02/03/2023.
//

import SwiftUI

struct BlueCapsule: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        BlueCapsuleButton(configuration: configuration)
    }
}

private extension BlueCapsule {
    struct BlueCapsuleButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .frame(minWidth: 50)
                .padding()
                .background(isEnabled ? .blue : .gray)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .opacity(configuration.isPressed ? 0.75 : 1)
                .scaleEffect(configuration.isPressed ? 0.9 : 1)
                .opacity(isEnabled ? 1 : 0.5)
        }
    }
}
