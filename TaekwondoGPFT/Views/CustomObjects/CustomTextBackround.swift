//
//  CustomTextBackround.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 05/07/2023.
//

import SwiftUI

struct CustomTextBackround: View {
    // MARK: - PROPERTIES

    // MARK: - BODY

    var body: some View {
        ZStack {
            // MARK: - 3. DEPTH

            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)

            // MARK: - 2. LIGHT

            Color.customGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)

            // MARK: - 1. SURFACE

            LinearGradient(colors: [
                Color.customGreenLight,
                Color.customGreenMedium,
            ],
            startPoint: .top,
            endPoint: .bottom)
                .cornerRadius(40)
        }
    }
}

// MARK: - PREVIEW

struct CustomTextBackround_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextBackround()
            .padding()
    }
}
