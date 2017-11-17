//
//  LibraryJsonModel.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/17.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift

// MARK: - left category jsonModel
struct CatalogJsonModel {
    var anInt: Int
    var aString: String
    var aCGPoint: CGPoint
}

struct SectionOfCatalog {
    var header: String
    var items: [CatalogJsonModel]
}
extension SectionOfCatalog: SectionModelType {
    typealias Item = CatalogJsonModel
    
    init(original: SectionOfCatalog, items: [CatalogJsonModel]) {
        self = original
        self.items = items
    }
}

// MARK: - left category jsonModel
struct CatalogDetailJsonModel {
    var anInt: Int
    var aString: String
    var aCGPoint: CGPoint
}

struct SectionOfCatalogDetail {
    var header: String
    var items: [CatalogDetailJsonModel]
}
extension SectionOfCatalogDetail: SectionModelType {
    typealias Item = CatalogDetailJsonModel
    
    init(original: SectionOfCatalogDetail, items: [CatalogDetailJsonModel]) {
        self = original
        self.items = items
    }
}
