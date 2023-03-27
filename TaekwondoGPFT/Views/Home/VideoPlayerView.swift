//
//  VideoPlayerView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 06/03/2023.
//

import AVKit
import SwiftUI


struct VideoPlayerView: View {
    //MARK: - PROPERTIES
    var videoSelected: String
    var videoTitle: String
    var videoFormat: String = "mp4"
    @State var player = MediaPlayer(videoTitle: "Chon-gi", videoFormat: "mp4")
    
    //MARK: - BODY
    var body: some View {
        VStack {
            VideoPlayer(player: player.avPlayer)
                .frame(height: 400)
                .overlay(

                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.top, 6)
                        .padding(.horizontal, 8)
                    , alignment: .topLeading
                )
        } //: VSTACK

        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

//MARK: - PREVIEW
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "Chon-gi", videoTitle: "Chon-gi")
        }
    }
}
