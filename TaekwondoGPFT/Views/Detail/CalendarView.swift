//
//  CalendarView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 07/11/2022.
//
import SwiftUI

struct CalendarView: View {
    // MARK: - PROPERTIES

    @State var showLoader = true
    let url = URL(string: "https://www.facebook.com/taekwondopft/events")

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
