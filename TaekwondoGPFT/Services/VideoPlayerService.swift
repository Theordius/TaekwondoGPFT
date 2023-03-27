//
//  VideoPlayer.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 06/03/2023.
//

import AVKit
import Foundation
import SwiftUI

protocol VideoPlayerService {
    func playVideo() -> AVPlayer
    func stopVideo()
}

struct MediaPlayer: VideoPlayerService {
    
    let avPlayer: AVPlayer
    init(videoTitle: String, videoFormat: String) {

        self.avPlayer = AVPlayer(url: Bundle.main.url(forResource: videoTitle, withExtension: videoFormat)!)
        self.avPlayer.play()
       
    }
    func playVideo() -> AVPlayer {
        avPlayer.play()
        return avPlayer
    }
    func stopVideo() {
        avPlayer.pause()
    }
}


