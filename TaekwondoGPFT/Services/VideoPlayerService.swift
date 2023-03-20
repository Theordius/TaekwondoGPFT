//
//  VideoPlayer.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 06/03/2023.
//

import AVKit
import Foundation


var videoPlayer: AVPlayer?

func play(fileName: String, fileFormat: String) -> AVPlayer {
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}


//protocol VideoPlayerService {
//    func playVideo(fileName: String, fileFormat: String) -> AVPlayer
//}
//
//struct VideoPlayer: VideoPlayerService {
//    func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
//
//        var videoPlayer: AVPlayer?
//
//        if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
//            videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
//            videoPlayer?.play()
//        }
//        return videoPlayer!
//    }
//}


