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
struct GatherJsonModel {
    var anInt: Int
    var aString: String
    var aCGPoint: CGPoint
}

struct SectionOfGather {
    var header: String
    var items: [GatherJsonModel]
}
extension SectionOfGather: SectionModelType {
    typealias Item = GatherJsonModel
    
    init(original: SectionOfGather, items: [GatherJsonModel]) {
        self = original
        self.items = items
    }
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
