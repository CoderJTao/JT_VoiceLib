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
