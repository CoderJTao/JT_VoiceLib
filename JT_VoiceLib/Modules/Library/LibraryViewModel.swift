//
//  LibraryViewModel.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/7.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import RxSwift

class LibraryViewModel {
    var catalogs = Variable([SectionOfCatalog]())
    var catalogDetail = Variable([SectionOfCatalogDetail]())
    
    let disposeBag = DisposeBag()
    
    init() {
    }
    
    // 获取分类列表
    func loadCatalogs() {
        
        let sections = [
            SectionOfCatalog(header: "", items: [CatalogJsonModel(anInt: 0, aString: "zero", aCGPoint: CGPoint.zero), CatalogJsonModel(anInt: 1, aString: "one", aCGPoint: CGPoint(x: 1, y: 1)), CatalogJsonModel(anInt: 2, aString: "two", aCGPoint: CGPoint(x: 2, y: 2)), CatalogJsonModel(anInt: 3, aString: "three", aCGPoint: CGPoint(x: 3, y: 3)) ])
        ]
        
        self.catalogs.value = sections
        self.loadCatalogDetail(catalog: sections.first?.items.first?.aString)
    }
    
    // 获取类别详情
    func loadCatalogDetail(catalog: String?) {
    
//        var sections = [
//            SectionOfCatalogDetail(header: "", items: [CatalogDetailJsonModel(anInt: 0, aString: "zero", aCGPoint: CGPoint.zero), CatalogDetailJsonModel(anInt: 1, aString: "one", aCGPoint: CGPoint(x: 1, y: 1)), CatalogDetailJsonModel(anInt: 2, aString: "two", aCGPoint: CGPoint(x: 2, y: 2)), CatalogDetailJsonModel(anInt: 3, aString: "three", aCGPoint: CGPoint(x: 3, y: 3)) ])
//        ]
        
        guard let type = catalog else {
            return
        }
        var sections = [SectionOfCatalogDetail]()
        switch type {
        case "zero":
            sections = [
                SectionOfCatalogDetail(header: "", items: [CatalogDetailJsonModel(anInt: 0, aString: "zero", aCGPoint: CGPoint.zero), CatalogDetailJsonModel(anInt: 1, aString: "one", aCGPoint: CGPoint(x: 1, y: 1)), CatalogDetailJsonModel(anInt: 2, aString: "two", aCGPoint: CGPoint(x: 2, y: 2)), CatalogDetailJsonModel(anInt: 3, aString: "three", aCGPoint: CGPoint(x: 3, y: 3)) ])]
            break
        case "one":
            sections = [
                SectionOfCatalogDetail(header: "", items: [CatalogDetailJsonModel(anInt: 0, aString: "one", aCGPoint: CGPoint.zero), CatalogDetailJsonModel(anInt: 1, aString: "one", aCGPoint: CGPoint(x: 1, y: 1)), CatalogDetailJsonModel(anInt: 2, aString: "two", aCGPoint: CGPoint(x: 2, y: 2)), CatalogDetailJsonModel(anInt: 3, aString: "three", aCGPoint: CGPoint(x: 3, y: 3)) ])]
        case "two":
            sections = [
                SectionOfCatalogDetail(header: "", items: [CatalogDetailJsonModel(anInt: 0, aString: "two", aCGPoint: CGPoint.zero), CatalogDetailJsonModel(anInt: 1, aString: "one", aCGPoint: CGPoint(x: 1, y: 1)), CatalogDetailJsonModel(anInt: 2, aString: "two", aCGPoint: CGPoint(x: 2, y: 2)), CatalogDetailJsonModel(anInt: 3, aString: "three", aCGPoint: CGPoint(x: 3, y: 3)) ])]
        case "three":
            sections = [
                SectionOfCatalogDetail(header: "", items: [CatalogDetailJsonModel(anInt: 0, aString: "three", aCGPoint: CGPoint.zero), CatalogDetailJsonModel(anInt: 1, aString: "one", aCGPoint: CGPoint(x: 1, y: 1)), CatalogDetailJsonModel(anInt: 2, aString: "two", aCGPoint: CGPoint(x: 2, y: 2)), CatalogDetailJsonModel(anInt: 3, aString: "three", aCGPoint: CGPoint(x: 3, y: 3)) ])]
        default: break
            
        }
        self.catalogDetail.value = sections
    }
}
