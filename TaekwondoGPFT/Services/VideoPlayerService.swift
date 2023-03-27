//
//  VideoPlayer.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 06/03/2023.
//

import AVKit
import Foundation
import SwiftUI


//var videoPlayer: AVPlayer?
//
//func play(fileName: String, fileFormat: String) -> AVPlayer {
//    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
//        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
//        videoPlayer?.play()
//    }
//    return videoPlayer!
//}


protocol VideoPlayerService {
    func playVideo() -> AVPlayer
    func stopVideo()
}

struct MediaPlayer {
    
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


