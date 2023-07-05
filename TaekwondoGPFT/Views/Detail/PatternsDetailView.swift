//
//  PatternsDetailViewController.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 21/11/2022.
//

import SwiftUI

struct PatternDetailView: View {
    // MARK: - PROPERTIES

    var pattern: Patterns
    @EnvironmentObject var router: Router

    // MARK: - BODY

    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            YouTubeView(videoID: pattern.videoID)
                .frame(width: 300, height: 300)
                .scaledToFit()

            Divider().padding(.horizontal, 6)

            Text(pattern.name)
                .font(.headline)
                .foregroundColor(.blue)

            Divider().padding(.horizontal, 6)

            ScrollView(showsIndicators: false) {
                ZStack {
                    CustomTextBackround()
                    VStack(alignment: .leading, spacing: 4) {
                        Text(pattern.description ?? "Opis wkrótce")
                            .modifier(DescriptionTextModifier())
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.all)
                }
                .padding()
            }
            Divider().padding(.horizontal, 6)

            Button("Strona Główna") {
                router.resetPath()
            }
            .buttonStyle(.borderedProminent)

            Divider().padding(.horizontal, 6)
        }
        .padding()
    }
}

struct PatternsDetailView_Previews: PreviewProvider {
    static let patterns: [Patterns] = Bundle.main.decode("Patterns.json")
    static var previews: some View {
        PatternDetailView(pattern: patterns[0])
            .environmentObject(Router())
    }
}
