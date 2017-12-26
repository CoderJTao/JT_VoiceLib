//
//  PlayManager.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/12/8.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit

class PlayManager: NSObject {
    
    var playModel: TracksJsonModel? {
        didSet {
            if let model = playModel {
                // 将播放对象给playHandle
                playHandle.playModel = model
            }
        }
    }
    
    // 播放对象
    private var playHandle = PlayHandler()
    
    // MARK: - singleton
    internal static let sharedInstance = {
        return PlayManager()
    }()
    
}


extension PlayManager {
    
    /// 播放
    func play() {
        
    }
    
    /// 暂停
    func pause() {
        
    }
    
    /// 上一曲
    func pre() {
        
    }
    
    /// 下一曲
    func next() {
        
    }
    
    /// 拖到指定时间
    func seekToTime() {
        
    }
}

