//
//  FileHandle.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/12/8.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit

class FileHandle {
    // MARK: - singleton
    internal static let sharedInstance = {
        return FileHandle()
    }()
    fileprivate init() { }
    
    let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    // 历史文件路径
    func tempFilePath(tempName: String) -> String {
        let use = docDir.appendingFormat("/TempFile/%@.mp3", tempName)
        return use
    }
    
    // 缓存文件夹路径
    func cacheFilePath() -> String {
        
        return docDir + "/CachedFile"
    }
    
    
    // 下载文件路径
    func downloadFilePath() -> String {
        return docDir + "/DownloadFile"
    }
    
    /// 查询本地是否存在当前音频文件
    ///
    /// - Parameter name: 音频的trackId
    /// - Returns: 存在：返回文件路径  不存在：返回nil
    func checkFileExists(name: String) -> String {
        let cachedPath = self.cacheFilePath() + "/" + name + ".mp3"
        let downloadPath = self.downloadFilePath() + "/" + name + ".mp3"
        
        // 若缓存文件夹内有文件则返回路径
        if FileManager.default.fileExists(atPath: cachedPath) {
            return cachedPath
        }
        
        // 若已下载文件夹内有则返回路径
        if FileManager.default.fileExists(atPath: downloadPath) {
            return downloadPath
        }
        
        return ""
    }
    
}

