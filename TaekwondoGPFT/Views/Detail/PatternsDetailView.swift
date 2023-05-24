//
//  PatternsDetailViewController.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 21/11/2022.
//

import SwiftUI

struct PatternDetailView: View {
    @EnvironmentObject var router: Router

    // MARK: - PROPERTIES

    var pattern: Patterns

    // MARK: - BODY

    var body: some View {
        VStack(alignment: .center, spacing: 26) {
            VideoPlayerView(videoSelected: pattern.videoName ?? "chon-gi", videoTitle: pattern.name)
                .frame(width: 360, height: 360)
                .scaledToFit()

            Divider().padding(.horizontal, 6)

            Text(pattern.name)
                .font(.headline)
                .foregroundColor(.blue)

            Divider().padding(.horizontal, 6)

            Text(pattern.description!)
                .font(.system(.subheadline))
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .lineLimit(.max)
            Button("Strona Główna") {
                router.resetPath()
            }

            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct PatternsDetailView_Previews: PreviewProvider {
    static let patterns: [Patterns] = Bundle.main.decode("Patterns.json")
    static var previews: some View {
        PatternDetailView(pattern: patterns[0])
            .environmentObject(Router())
            .previewDevice("iPhone 11 Pro")
    }
}
