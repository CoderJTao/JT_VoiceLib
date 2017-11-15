//
//  FindMoya.swift
//  JT_VoiceLib
//
//  Created by JiangT on 2017/11/15.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import Moya

enum FindMoya {
    //获取发现列表数据
    case getGather(pageNum: String)
    
}

extension FindMoya: TargetType {
    var baseURL: URL {
        return URL(string: kAPIBaseURLString)!
    }
    
    var path: String {
        switch self {
        case .getGather(_):
            return "index/886"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        switch self {
        case .getGather(let pageNum)://, "device": "iPhone", "version": "1.1.2"
            return ["page_id": pageNum]
        }
    }
}
