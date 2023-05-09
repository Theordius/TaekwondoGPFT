//
//  ProgressBar.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 03/04/2023.
//

import SwiftUI

struct ProgressBar: View {
    // MARK: - PROPERTIES

    @State private var loadingData = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    // MARK: - BODY

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 240, height: 240)
                .background(Color.blue)
                .cornerRadius(8).opacity(0.3)

            VStack(alignment: .center) {
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)

                Divider().padding(.vertical, 15)

                ProgressView("Loading...", value: loadingData, total: 100.0)
                    .onReceive(timer) { _ in
                        if loadingData < 100 {
                            loadingData += 2
                        }
                    }
            }
        }
    }
}

// MARK: - PREVIEW

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
            .previewLayout(.sizeThatFits)
    }
}
