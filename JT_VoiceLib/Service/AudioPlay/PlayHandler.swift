//
//  PlayHandler.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/12/7.
//  Copyright © 2017年 江涛. All rights reserved.
//

import Foundation
import AVFoundation
import RxSwift

class PlayHandler {
    
    let disposeBag = DisposeBag()
    
    // 进度
    var progress = Variable<Float>(0)
    
    // 结果
    var result : Variable<Bool>?
    
    // 路径
    var localPath: Variable<String>?
    
    // 程序开始运行时就必须设置的model
    var playModel : TracksJsonModel? {
        didSet {
            if let model = playModel {
                checkMusicData(model: model)
            }
        }
    }
    
    
    
    var player = AVPlayer.init()
    
    
    
    // MARK: - singleton
    
    // 音频数据信息的绑定
    func checkMusicData(model: TracksJsonModel) {
       
        PlayCacheHandler.sharedInstance.playModel = model
        
        PlayCacheHandler.sharedInstance.progress.asObservable()
            .subscribe(onNext: { (progress) in
                self.progress.value = progress
            }).disposed(by: self.disposeBag)
        
        PlayCacheHandler.sharedInstance.result?.asObservable()
            .subscribe(onNext: { (result) in
                self.result?.value = result
            }).disposed(by: self.disposeBag)
        
        PlayCacheHandler.sharedInstance.localPath?.asObservable()
            .subscribe(onNext: { (localPath) in
                self.localPath?.value = localPath
            }).disposed(by: self.disposeBag)
    }
}

extension PlayHandler {
    
    func downloadMusicSuccess() {
        // 下载成功之后  去本地下载文件夹拉去数据播放
        
        
    }
    
    func playLocalMusic() {
        
    }
    
}



