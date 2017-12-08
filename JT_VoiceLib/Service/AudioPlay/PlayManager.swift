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
                // 去询问数据是否存在
                checkMusicData(model: model)
            }
        }
    }
    
    // 播放对象
    var playHandle = PlayHandler()
    
    // 管理音频数据的对象
    var resourceHandle = PlayResourceHandle()
    
    // MARK: - singleton
    internal static let sharedInstance = {
        return PlayManager()
    }()
    
    
    
    /// 让 resourceHandle 查询数据是否存在
    ///
    /// - Parameter model: music 对象
    func checkMusicData(model: TracksJsonModel) {
        
    }
    
}
