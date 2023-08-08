//
//  CustomBackground.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 08/08/2023.
//

import SwiftUI

struct CustomBackground: View {
    // MARK: - PROPERTIES

    @ViewBuilder
    private var customBackground: some View {
        ZStack {
            Rectangle()
                .fill(Gradient(colors: [.gray, .white]))
                .ignoresSafeArea()
        }
    }

    // MARK: - BODY

    var body: some View {
        GeometryReader { _ in
            ZStack {
                customBackground
            }
        }
    }
}

// MARK: - PREVIEW

struct CustomBackground_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackground()
    }
}
