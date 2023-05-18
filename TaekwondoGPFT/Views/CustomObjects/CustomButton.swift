//
//  Buttons.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 01/03/2023.
//

import SwiftUI

struct CustomButton<Destination: View>: View {
    // MARK: - PROPERTIES

    @ObservedObject var viewModel = ViewModel()

    var title: String
    var subtitle: String
    var destination: Destination

    // MARK: - BODY

    var body: some View {
        NavigationLink(destination: destination) {
            VStack(alignment: .center) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)

                Text(subtitle)

                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            .fixedSize(horizontal: true, vertical: false)
            .frame(width: 200)
        }
    }
}

// MARK: - PREVIEW

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CustomButton(title: "UKŁADY FORMALNE", subtitle: "Układy formalne", destination: PatternsView())
                .previewLayout(.sizeThatFits)
        }
    }
}
