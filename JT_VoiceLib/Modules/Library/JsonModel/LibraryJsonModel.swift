//
//  LibraryJsonModel.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/28.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import RxDataSources
import HandyJSON

// 左侧类别model
struct CategoryJsonModel: HandyJSON {
    var cover: String?
    var name: String?
    var position: Int?
}



// 右侧列表modle
struct CategoryDetailListJsonModel: HandyJSON {
//    id: 2953430,
//    title: "媚公卿",
//    coverSmall: "http://fdfs.xmcdn.com/group11/M09/62/A7/wKgDa1XyutrTpvs5AATk-LotLTk893_mobile_small.jpg",
//    coverLarge: "http://fdfs.xmcdn.com/group11/M09/62/A7/wKgDa1XyutrTpvs5AATk-LotLTk893_mobile_large.jpg",
//    updatedAt: 1470740851000,
//    finished: 2,
//    plays_counts: 18217130,
//    tracks_counts: 174,
//    selected: false
    
    var id: Int?
    var title: String?
    var coverSmall: String?
    var coverLarge: String?
    var updatedAt: Int?
    var finished: Int?
    var plays_count: Int?
    var tracks_count: Int?
    var selected: Bool?
}
