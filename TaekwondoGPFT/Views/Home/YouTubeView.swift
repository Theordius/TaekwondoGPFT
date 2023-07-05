//
//  YouTubeView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 22/06/2023.
//

import SwiftUI
import WebKit

struct YouTubeView: View {
    var videoID: String

    var body: some View {
        YouTubePlayer(videoID: videoID)
            .frame(width: 300, height: 300)
            .padding()
    }
}

struct YouTubeView_Previews: PreviewProvider {
    static var previews: some View {
        YouTubeView(videoID: "gZvn0B4JSLg")
            .previewLayout(.sizeThatFits)
    }
}
