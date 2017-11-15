//
//  FindNextViewModel.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/15.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class FindNextViewModel {
    
    var albums = Variable([SectionOfAlbums]())
    
    init() {
        
        
    }
    
    // 获取列表
    func loadData() {
        
        let sections = [
            SectionOfAlbums(header: "First section", items: [AlbumsJsonModel(anInt: 0, aString: "zero", aCGPoint: CGPoint.zero), AlbumsJsonModel(anInt: 1, aString: "one", aCGPoint: CGPoint(x: 1, y: 1)), AlbumsJsonModel(anInt: 2, aString: "two", aCGPoint: CGPoint(x: 2, y: 2)), AlbumsJsonModel(anInt: 3, aString: "three", aCGPoint: CGPoint(x: 3, y: 3)) ])
        ]
        
        self.albums.value = sections
        
    }
    
}


