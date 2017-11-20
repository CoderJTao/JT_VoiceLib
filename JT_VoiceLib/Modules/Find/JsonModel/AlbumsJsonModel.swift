//
//  AlbumsJsonModel.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/14.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import HandyJSON

// MARK: - 发现首页的jsonmodel
struct GatherJsonModel : HandyJSON{
    
    var anInt: Int?
    var aString: String?
    var aCGPoint: CGPoint?

//    uid: 1021189,
//    nickname: "女王乔安",
//    mediumLogo: "http://image.xmcdn.com/group4/M03/79/E8/wKgDs1PHPD-jwj9-AAOhEL6AyVc833_mobile_large.jpg",
//    personDescribe: "莱兮言情，青春言情女王",
//    albums: 19
    
    var uid : Int?
    var nickname : String?
    var mediumLogo : String?
    var personDescribe : String?
    var albums : Int?
    
}

struct SectionOfGather : HandyJSON{
//    ret: 0,
//    msg: "",
//    maxPageId: 3,
//    totalCount: 74,
//    pageSize: 30,
//    pageId: 1,
//    list : [GatherJsonModel]
    var red : Int?
    var msg : String?
    var maxPageId : Int?
    var totalCount : Int?
    var pageId : Int?
    var list: [GatherJsonModel]?
}


// MARK: - 首页点击进入Albums
struct AlbumsJsonModel {
    var anInt: Int
    var aString: String
    var aCGPoint: CGPoint
}

struct SectionOfAlbums {
    var header: String
    var items: [AlbumsJsonModel]
}
extension SectionOfAlbums: SectionModelType {
    typealias Item = AlbumsJsonModel
    
    init(original: SectionOfAlbums, items: [AlbumsJsonModel]) {
        self = original
        self.items = items
    }
}

// MARK: - 专辑点击进入专辑列表
struct TracksJsonModel {
    var anInt: Int
    var aString: String
    var aCGPoint: CGPoint
}
struct SectionOfTracks {
    var header: String
    var items: [TracksJsonModel]
}
extension SectionOfTracks: SectionModelType {
    typealias Item = TracksJsonModel
    
    init(original: SectionOfTracks, items: [TracksJsonModel]) {
        self = original
        self.items = items
    }
}
