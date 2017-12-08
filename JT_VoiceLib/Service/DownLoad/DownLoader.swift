//
//  DownLoader.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/12/8.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import RxSwift
import Moya

/*
 1. 下载网络音乐文件
 2. 完整的下载则持久化在本地, 不完整的下载则放弃 并删除本地缓存
 3. 将下载的数据传输给 播放器进行播放
 **/
class DownLoader: NSObject {
    
    // 进度
    var progress = Variable<Float>(0)
    
    // 结果
    var result : Variable<Bool>?
    
    // 路径
    var localPath: Variable<String>?
    
    var downloadStrList : [String] = []
    var currentDownloadStr : String?
    
    let provider = MoyaProvider<MultiTarget>()
    
    // MARK: - singleton
    internal static let sharedInstance = {
        return DownLoader()
    }()
    
    /// 下载音频文件
    func startDownloadMusic(urlStr: String) {
        
        if self.currentDownloadStr == nil {
            self.currentDownloadStr = urlStr
            self.downLoadMusic()
        } else {
            self.downloadStrList.append(urlStr)
        }
    }
    
    /// 下载
    private func downLoadMusic() {
        let progressClosure: ProgressBlock = { response in
            // 将进度通过delegate传出
            print(response.progress)
            self.progress.value = Float(response.progress)
        }
        
        let progressCompletionClosure: Completion = { result in
            self.currentDownloadStr = nil
            // 将下载的结果传出
            switch result {
            case .success:
                print("success")
            case .failure:
                print("failure")
                self.result?.value = false
            }
            // 如果还有需要下载的继续下载
            self.result?.value = true
            if let str = self.downloadStrList.first {
                self.downloadStrList.removeFirst()
                self.currentDownloadStr = str
                self.downLoadMusic()
            }
            
        }
        
        provider.request(MultiTarget.init(MusicMoya.downloadMusic(str: self.currentDownloadStr!)), callbackQueue: DispatchQueue.main, progress: progressClosure, completion: progressCompletionClosure)
    }
    
    
    /// 停止下载某个音频
    func stopDownloadMusic() {
        
    }
}
