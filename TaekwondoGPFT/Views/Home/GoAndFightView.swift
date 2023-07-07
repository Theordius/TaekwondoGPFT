//
//  GoAndFightView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 07/07/2023.
//

import SwiftUI

struct GoAndFightView: View {
    // MARK: - PROPERTIES

    @State var showLoader = true
    let url = URL(string: "https://www.go.gpft.pl/zawody")

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

struct GoAndFightView_Previews: PreviewProvider {
    static var previews: some View {
        GoAndFightView()
    }
}
