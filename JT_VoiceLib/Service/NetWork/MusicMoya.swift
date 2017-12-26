//
//  MusicMoya.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/12/7.
//  Copyright © 2017年 江涛. All rights reserved.
//

import Foundation
import Moya

enum MusicMoya {
    // http://audio.xmcdn.com/group32/M02/4A/73/wKgJS1mar_fxzaw9AEtDLvG1zKk670.mp3
    case downloadMusic(str: String)
    
}

extension MusicMoya: TargetType {
    var baseURL: URL {
        switch self {
        case .downloadMusic(let str):
            return URL.init(string: str)!
        }
//        return URL.init(string: "http://audio.xmcdn.com")!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .downloadMusic(_):
            return .downloadDestination(defaultDownloadDestination)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

private let defaultDownloadDestination: DownloadDestination = { temporaryURL, response in
    let directoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    if !directoryURLs.isEmpty {
        guard let suggestedFilename = response.suggestedFilename else {
            fatalError("@Moya/contributor error!! We didn't anticipate this being nil")
        }
        
        return (directoryURLs[0].appendingPathComponent(suggestedFilename), [])
    }
    
    return (temporaryURL, [])
}

