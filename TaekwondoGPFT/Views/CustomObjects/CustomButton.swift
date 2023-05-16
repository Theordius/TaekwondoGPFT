//
//  Buttons.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 01/03/2023.
//

import SwiftUI

struct CustomButton: View {
    // MARK: - PROPERTIES

    @ObservedObject var viewModel = ViewModel()

    var title: String
    var subtitle: String
    // var action: () -> Void

    // MARK: - BODY

    var body: some View {
        Button {
            print("button \(title) was pressesed")
        }
        label: {
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
        NavigationView {
            CustomButton(title: "UKŁADY FORMALNE", subtitle: "Układy formalne")
                .previewLayout(.sizeThatFits)
        }
    }
}
