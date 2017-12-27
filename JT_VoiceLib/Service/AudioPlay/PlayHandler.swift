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

class PlayHandler: NSObject {
    
    var passTime = Variable<Float>(0)
    
    let disposeBag = DisposeBag()
    
    // 进度
    var progress = Variable<Float>(0)
    
    // 结果
    var result : Variable<Bool>?
    
    // 路径
//    var localPath: Variable<String>?
    
    private var localPath : String?
    
    // 程序开始运行时就必须设置的model
    var playModel : TracksJsonModel? {
        didSet {
            if let model = playModel {
                // 去查找
                checkMusicData(model: model)
            }
        }
    }
    
    var player = AVAudioPlayer.init()
    
    var isPlaying: Bool {
        get {
            return player.isPlaying
        }
    }
    
    // 音频数据信息的绑定
    func checkMusicData(model: TracksJsonModel) {
        
        PlayCacheHandler.sharedInstance.playModel = model
        
        // 下载进度
        PlayCacheHandler.sharedInstance.progress.asObservable()
            .subscribe(onNext: { (progress) in
                // 下载音频的进度
                print(progress)
                
            }).disposed(by: self.disposeBag)
        
        // 下载音频的本地路径
        PlayCacheHandler.sharedInstance.localPath.asObservable().observeOn(MainScheduler.instance)
            .subscribe(onNext: { (localPath) in
                // 音频的本地位置
                if !localPath.isEmpty {
                    self.localPath = localPath
                    self.play()
                }
                
            }).disposed(by: self.disposeBag)
    }
}

extension PlayHandler {
    
    func play() {
        if let path = self.localPath {
            self.play(localPath: path)
        } else {
            print("本地路径为空")
        }
    }
    
    /// 播放音频
    private func play(localPath: String) {
        let url = URL.init(string: localPath)!
        
        try! player = AVAudioPlayer.init(contentsOf: url)
        
        player.delegate = self
        player.play()
        
    }
    
    /// 暂停
    func pause() {
        player.pause()
    }
    
    /// 拖动进度条
    func seekToTime(progress: Float) {
        
    }
}


extension PlayHandler: AVAudioPlayerDelegate {
    
    // 播放完成
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
    }
    
    
    
    
}
