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
struct AlbumsJsonModel : HandyJSON {
//    albumId: 10076452,
//    title: "头条星闻1",
//    coverSmall: "http://fdfs.xmcdn.com/group33/M00/4A/61/wKgJnVmarFTCZ-fiAAF1FxXUpug810_mobile_small.jpg",
//    tracks: 12,
//    updatedAt: 1510842242000,
//    finished: 0
    
    var albumId : Int?
    var title : String?
    var coverSmall : String?
    var tracks : Int?
    var updatedAt : Int?
    var finished : Int?
}

struct SectionOfAlbums : HandyJSON {
    
//    ret: 0,
//    msg: "",
//    uid: 1021189,
//    nickname: "女王乔安",
//    smallLogo: "http://fdfs.xmcdn.com/group4/M03/79/E8/wKgDs1PHPD-jwj9-AAOhEL6AyVc833_mobile_small.jpg",
//    largeLogo: "http://fdfs.xmcdn.com/group4/M03/79/E8/wKgDs1PHPD-jwj9-AAOhEL6AyVc833_mobile_x_large.jpg",
//    maxPageId: 1,
//    totalCount: 19,
//    personalSignature: "新浪微博：Melody莱兮 合作请加Q：2737075079 微信公众账号：莱兮言情",
//    pageSize: 20,
//    pageId: 1,
    
    var ret : Int?
    var msg : String?
    var uid : Int?
    var nickname : String?
    var smallLogo : String?
    var largeLogo : String?
    var maxPageId : Int?
    var totalCount : Int?
    var personalSingnature : String?
    var pageSize : Int?
    var pageId : Int?
    
    var list: [AlbumsJsonModel]?
}


// MARK: - 专辑点击进入专辑列表
struct TrackTopJsonModel : HandyJSON {
    
    var nickname: String?
    var uid: Int?
    var smallLogo: String?
    var albumId: Int?
    var title: String?
    var coverSmall: String?
    var coverLarge: String?
    var intro: String?
    var richIntro: String?
    var updatedAt: Int?
    var playCount: Int?
    var tracks: Int?
}
struct TracksDic : HandyJSON {
    
    var maxPageId: Int?
    var totalCount: Int?
    var pageSize: Int?
    var pageId: Int?
    
    var list: [TracksJsonModel]?
}
struct TracksJsonModel :HandyJSON {
    
    var trackId: Int?
    var title: String?
    var coverSmall: String?
    var coverLarge: String?
    var playUrl32: String?
    var playUrl64: String?
    var playtimes: Int?
    var mp3size_32: Int?
    var mp3size_64: Int?
    var albumId: Int?
    var albumUid: Int?
    var duration: Int?
    var createdAt: Int?
    var updatedAt: Int?
}

struct AlbumModel {
    var top : TrackTopJsonModel?
    var detail : TracksJsonModel?
}

enum AlbumDetailModel {
    case topSection(items: [AlbumDetailSection])
    case detailSection(items: [AlbumDetailSection])
}
enum AlbumDetailSection {
    case topItem(model: TrackTopJsonModel)
    case detailItem(model: TracksJsonModel)
}

extension AlbumDetailModel : SectionModelType {
    
    init(original: AlbumDetailModel, items: [AlbumDetailSection]) {
        switch original {
        case .topSection(items: _):
            self = .topSection(items: items)
        case .detailSection(items: _):
            self = .detailSection(items: items)
        }
    }
    
    var items: [AlbumDetailSection] {
        switch self {
        case .topSection(let sections):
            return sections.map {$0}
        case .detailSection(let sections):
            return sections.map {$0}
        }
    }
}

struct SectionOfTracks : HandyJSON {
    var ret: Int?
    var msg: String?
    
    var album: TrackTopJsonModel?
    var tracks: TracksDic?
}

