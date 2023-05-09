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
    @State private var selection: String? = nil

    var title: String
    var subtitle: String
    var tag: String

    // MARK: - BODY

    var body: some View {
        NavigationLink(tag: tag, selection: $selection) {
            switch tag {
            case "A":
                PatternsView()
            case "B":
                TheoryView()
            case "C":
                WebView(viewModel: viewModel)
            case "D":
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
            CustomButton(title: "UKŁADY FORMALNE", subtitle: "Układy formalne", tag: "A")
                .previewLayout(.sizeThatFits)
        }
    }
}
