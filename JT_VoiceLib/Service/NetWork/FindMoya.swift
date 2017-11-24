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
    //    http://app.9nali.com/index/886?page_id=1&amp;device=iPhone&amp;version=1.1.2
    case getGather(pageNum: String)
    
    //获取专辑列表数据
    //    http://app.9nali.com/886/bozhus/1021189?page_id=1&device=iPhone&version=1.1.2
    case getAlbumsList(uid: String, pageNum: String)
    
    //获取专辑详情
    //    http://app.9nali.com/886/albums/10076452?page_id=1&isAsc=true&device=iPhone&version=1.1.2
    case getTacksList(uid: String, pageNum: String)
}

extension FindMoya: TargetType {
    var baseURL: URL {
        return URL(string: kAPIBaseURLString)!
    }

    var path: String {
        switch self {
        case .getGather(_):
            return "index/886"
        case .getAlbumsList(let uid, _):
            return "886/bozhus/" + uid
        case .getTacksList(let uid, _):
            return "886/albums/" + uid
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
        case .getAlbumsList(_, let pageNum):
            return ["page_id": pageNum]
        case .getTacksList(_, let pageNum):
            return ["page_id": pageNum]
        }
    }
}
