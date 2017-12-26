//
//  FileHandle.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/12/8.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit

class JTFilePathHelper {
    
    private var readFileHandle = FileHandle()
    private var writeFileHandle = FileHandle()
    
    // MARK: - singleton
    internal static let sharedInstance = {
        return JTFilePathHelper()
    }()
    fileprivate init() { }
    
    /// 是否存在缓存文件 存在：返回文件路径  不存在：返回nil
    func cacheFileExist(playURL: String) -> String? {
        
        var url = URL.init(string: playURL)!
        let path = String.init(format: "%@/%@", CachedFilePath, url.lastPathComponent)
        
        if FileManager.default.fileExists(atPath: path) {
            return path
        }
        return nil
    }
    
    /// 清空缓存文件
    func clearCache() {
        try! FileManager.default.removeItem(atPath: CachedFilePath)
    }
}


