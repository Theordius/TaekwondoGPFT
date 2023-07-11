//
//  GalleryView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 01/03/2023.
//

import SwiftUI

struct GalleryView: View {
    @State var showLoader = true
    let url = URL(string: "https://www.gpft.pl/galeria/")

    // MARK: - BODY

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                if let url {
                    WebLoader(url: url, showLoader: $showLoader)
                }
            }

            if showLoader {
                ProgressBar()
                    .frame(width: 200, height: 200)
            }
        }
        .onAppear {
            showLoader = true
        }
    }
}

// MARK: - PREVIEW

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
            .previewDevice("iPhone 11 Pro")
    }
}
