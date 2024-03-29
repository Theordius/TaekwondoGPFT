//
//  WebView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 03/04/2023.
//

import SwiftUI

struct WebView: View {
    // MARK: - PROPERTIES

    @State var showLoader = true
    let url = URL(string: "https://sklep.gpft.pl")

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

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
