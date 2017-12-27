//
//  PlayManager.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/12/8.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import RxSwift
import AVFoundation

class PlayManager: NSObject {
    
    var progress = Variable<Float>(0)       // 进度
    var currentTime = Variable<Int>(0)    // 当前时间
    var duration = Variable<Int>(0)       // 音频总时长
    
    private var timer = Timer.init()    // 用于监测播放进度的计时器
    
    var disposeBag = DisposeBag()
    
    var playModel: TracksJsonModel? {
        didSet {
            if let model = playModel {
                checkMusicData(model: model)
            }
        }
    }
    var musicList: [TracksJsonModel]?
    
    var isPlaying: Bool {
        get {
            return self.player.isPlaying
        }
    }
    
    var player = AVAudioPlayer.init()
    private var localPath : String?
    
    // MARK: - singleton
    internal static let sharedInstance = {
        return PlayManager()
    }()
    
    
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


extension PlayManager {
    
    /// 播放
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
        
        self.duration.value = Int(Float(self.player.duration))
        // 数据源设置
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            let pro = self.player.currentTime / self.player.duration
            self.progress.value = Float(pro)
            
            self.currentTime.value = Int(self.player.currentTime)
        })
        
    }
    
    /// 暂停
    func pause() {
        self.player.pause()
    }
    
    /// 上一曲
    func pre() {
        
    }
    
    /// 下一曲
    func next() {
        
    }
    
    /// 拖到指定时间
    func seekToTime(progress: Float) {
        self.pause()
        self.player.currentTime = TimeInterval(Float(self.duration.value) * progress)
        self.player.play()
    }
}


extension PlayManager: AVAudioPlayerDelegate {
    
    /// 当前音频播放完成时的回调
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
    }
    
}
