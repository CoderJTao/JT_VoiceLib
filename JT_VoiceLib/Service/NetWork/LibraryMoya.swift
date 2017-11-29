//
//  LibraryMoya.swift
//  JT_VoiceLib
//
//  Created by JiangT on 2017/11/15.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import Moya

enum LibraryMoya {
    
    // 获取类别列表
    // http://app.9nali.com/886/category/3/tags?page_id=1&amp;device=iPhone&amp;version=1.1.2
    case getCategory()
    
    // 获取类别详情列表
    // http://app.9nali.com/886/common_tag/3/女生最爱?page_id=1&amp;device=iPhone&amp;version=1.1.2
    case getCategoryDetail(type: String, pageNum: String)
}

extension LibraryMoya: TargetType {
    var baseURL: URL {
        return URL(string: kAPIBaseURLString)!
    }
    
    var path: String {
        switch self {
        case .getCategory():
            return "886/category/3/tags"
        case .getCategoryDetail(let type, _):
            return "886/common_tag/3/" + type
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getCategory():
            return .requestParameters(parameters: ["page_id": "1", "device": "iPhone"], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getCategoryDetail(_, let pageNUm):
            return ["page_id": pageNUm]
        default:
            return nil
        }
    }
}
