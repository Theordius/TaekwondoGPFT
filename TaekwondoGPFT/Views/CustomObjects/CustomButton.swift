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
    var tag: String

    // MARK: - BODY

    var body: some View {
        NavigationLink {
            switch tag {
            case "patterns":
                PatternsView()
            case "theory":
                TheoryView()
            case "onlineShop":
                WebView(viewModel: viewModel)
            case "calendar":
                Text("Calendar")
            default:
                EmptyView()
            }
        } label: {
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

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomButton(title: "UKŁADY FORMALNE", subtitle: "Układy formalne", tag: "patterns")
                .previewLayout(.sizeThatFits)
        }
    }
}
