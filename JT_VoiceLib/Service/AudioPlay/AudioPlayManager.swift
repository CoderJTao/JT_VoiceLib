//
//  AudioPlayManager.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/12/7.
//  Copyright © 2017年 江涛. All rights reserved.
//

import Foundation
import AVFoundation

class AudioPlayManager: NSObject {
    
    var playModle: TracksJsonModel?
    
    // MARK: - singleton
    internal static let sharedInstance = {
        return AudioPlayManager()
    }()
    
    
    
    /// 开始播放
    func startPlay() {
        
    }
    
    /// 暂停
    func pausePlay() {
        
    }
    
    /// 下一曲
    func nextMusic() {
        
    }
    
    /// 上一曲
    func preMusic() {
        
    }
    
    /// 获取当前播放列表
    ///
    /// - Returns: 播放列表数组
    func getMusicList() -> [TracksJsonModel] {
        
        return []
    }
    
    /// 设置播放模式  单曲 随机  顺序
    func playType() {
        
    }
}
