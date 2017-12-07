//
//  PlayCacheHandler.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/12/7.
//  Copyright © 2017年 江涛. All rights reserved.
//

import Foundation
import Moya

/*
 1. 下载网络音乐文件
 2. 完整的下载则持久化在本地, 不完整的下载则放弃 并删除本地缓存
 3. 将下载的数据传输给 播放器进行播放
**/
class PlayCacheHandler: NSObject {
    
    var playModel: TracksJsonModel? {
        didSet {
            if let model = playModel {
                self.cacheMusicData(model: model)
            }
        }
    }
    
    // MARK: - singleton
    internal static let sharedInstance = {
        return PlayCacheHandler()
    }()
    
    /// 查询本地是否有当前music 如果有，则返回本地filepath，如果没有则开始缓存
    func checkLocal() {
        // 通过realm数据库查询是否有条目
        //1. 数据库中有  直接播放
        
        //2. 数据库中无  开启下载
        
    }
    
    
    
    /// 下载音频文件
    func cacheMusicData(model: TracksJsonModel) {
        
        let progressClosure: ProgressBlock = { response in
            print(response.progress)
        }
        
        let progressCompletionClosure: Completion = { result in
            
            switch result {
            case .success:
                print("success")
            case .failure:
                print("failure")
            }
        }
        
        
        let provider = MoyaProvider<MultiTarget>()
        
        provider.request(MultiTarget.init(MusicMoya.downloadMusic(str: model.playUrl64!)), callbackQueue: DispatchQueue.main, progress: progressClosure, completion: progressCompletionClosure)
        
    }
    
}
