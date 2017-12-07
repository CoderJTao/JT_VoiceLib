//
//  PlayHandler.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/12/7.
//  Copyright © 2017年 江涛. All rights reserved.
//

import Foundation
import AVFoundation

class PlayHandler: NSObject {
    
    var playModel = TracksJsonModel()
    
    var playCacheTool = PlayCacheHandler()
    
    var player: AVPlayer?
    
    override init() {
        
        let asset = AVAsset.init(url: URL(string: "/Users/jiangtao/Desktop/JT_VoiceLib/JT_VoiceLib/CFNetworkDownload_QyDWY1.tmp")!)
        
        let item = AVPlayerItem.init(asset: asset)
        
        player = AVPlayer.init(playerItem: item)
        
        player?.play()
    }
    
    // MARK: - singleton
    internal static let sharedInstance = {
        return PlayHandler()
    }()
}
