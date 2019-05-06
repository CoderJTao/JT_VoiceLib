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

// MARK: - 发现首页的jsonmodel
struct GatherJsonModel : BaseJsonModel{
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
    
    init(json: [String : Any]) throws {
        self.uid = json["uid"] as? Int
        self.nickname = json["nickname"] as? String
        self.mediumLogo = json["mediumLogo"] as? String
        self.personDescribe = json["personDescribe"] as? String
        self.albums = json["albums"] as? Int
    }
}

struct SectionOfGather : BaseJsonModel{
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
    
    init(json: [String : Any]) throws {
        self.red = json["red"] as? Int
        self.msg = json["msg"] as? String
        self.maxPageId = json["maxPageId"] as? Int
        self.totalCount = json["totalCount"] as? Int
        self.pageId = json["pageId"] as? Int
        
        var temp: [GatherJsonModel] = []
        if let arr = json["list"] as? [Any] {
            for dic in arr {
                if let use = dic as? [String: Any] {
                    if let model = try? GatherJsonModel(json: use) {
                        temp.append(model)
                    }
                }
            }
        }
        self.list = temp.count == 0 ? nil : temp
    }
}


// MARK: - 首页点击进入Albums
struct AlbumsJsonModel : BaseJsonModel {
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
    
    init(json: [String : Any]) throws {
        self.albumId = json["albumId"] as? Int
        self.title = json["title"] as? String
        self.coverSmall = json["coverSmall"] as? String
        self.tracks = json["tracks"] as? Int
        self.updatedAt = json["updatedAt"] as? Int
        self.finished = json["finished"] as? Int
    }
}

struct SectionOfAlbums : BaseJsonModel {
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
    
    init(json: [String : Any]) throws {
        self.ret = json["ret"] as? Int
        self.msg = json["msg"] as? String
        self.uid = json["uid"] as? Int
        self.nickname = json["nickname"] as? String
        self.smallLogo = json["smallLogo"] as? String
        self.largeLogo = json["largeLogo"] as? String
        self.maxPageId = json["maxPageId"] as? Int
        self.totalCount = json["totalCount"] as? Int
        self.personalSingnature = json["personalSingnature"] as? String
        self.pageSize = json["pageSize"] as? Int
        self.pageId = json["pageId"] as? Int
        
        var temp: [AlbumsJsonModel] = []
        if let arr = json["list"] as? [Any] {
            for dic in arr {
                if let use = dic as? [String: Any] {
                    if let model = try? AlbumsJsonModel(json: use) {
                        temp.append(model)
                    }
                }
            }
        }
        self.list = temp.count == 0 ? nil : temp
    }
}


// MARK: - 专辑点击进入专辑列表
struct TrackTopJsonModel : BaseJsonModel {
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
    
    init(json: [String : Any]) throws {
        self.nickname = json["nickname"] as? String
        self.uid = json["uid"] as? Int
        self.smallLogo = json["smallLogo"] as? String
        self.albumId = json["albumId"] as? Int
        self.title = json["title"] as? String
        self.coverSmall = json["coverSmall"] as? String
        self.coverLarge = json["coverLarge"] as? String
        self.intro = json["intro"] as? String
        self.richIntro = json["richIntro"] as? String
        self.updatedAt = json["updatedAt"] as? Int
        self.playCount = json["playCount"] as? Int
        self.tracks = json["tracks"] as? Int
    }
}
struct TracksDic : BaseJsonModel {
    var maxPageId: Int?
    var totalCount: Int?
    var pageSize: Int?
    var pageId: Int?
    
    var list: [TracksJsonModel]?
    
    init(json: [String : Any]) throws {
        self.maxPageId = json["maxPageId"] as? Int
        self.totalCount = json["totalCount"] as? Int
        self.pageSize = json["pageSize"] as? Int
        self.pageId = json["pageId"] as? Int
        
        var temp: [TracksJsonModel] = []
        if let arr = json["list"] as? [Any] {
            for dic in arr {
                if let use = dic as? [String: Any] {
                    if let model = try? TracksJsonModel(json: use) {
                        temp.append(model)
                    }
                }
            }
        }
        self.list = temp.count == 0 ? nil : temp
    }
}
struct TracksJsonModel :BaseJsonModel {
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
    var duration: Double?
    var createdAt: Int?
    var updatedAt: Int?
    
    init(json: [String : Any]) throws {
        self.trackId = json["trackId"] as? Int
        self.title = json["title"] as? String
        self.coverSmall = json["coverSmall"] as? String
        self.coverLarge = json["coverLarge"] as? String
        self.playUrl32 = json["playUrl32"] as? String
        self.playUrl64 = json["playUrl64"] as? String
        self.playtimes = json["playtimes"] as? Int
        self.mp3size_32 = json["mp3size_32"] as? Int
        self.mp3size_64 = json["mp3size_64"] as? Int
        self.albumId = json["albumId"] as? Int
        self.albumUid = json["albumUid"] as? Int
        self.duration = json["duration"] as? Double
        self.createdAt = json["createdAt"] as? Int
        self.updatedAt = json["updatedAt"] as? Int
    }
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

struct SectionOfTracks: BaseJsonModel {
    var ret: Int?
    var msg: String?
    
    var album: TrackTopJsonModel?
    var tracks: TracksDic?
    
    init(json: [String : Any]) throws {
        self.ret = json["ret"] as? Int
        self.msg = json["msg"] as? String
        
        if let dic = json["album"] as? [String: Any] {
            self.album = try? TrackTopJsonModel(json: dic)
        }
        
        if let dic = json["tracks"] as? [String: Any] {
            self.tracks = try? TracksDic(json: dic)
        }
    }
}

