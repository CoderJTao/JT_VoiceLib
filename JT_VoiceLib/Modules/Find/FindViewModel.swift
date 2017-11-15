//
//  FindViewModel.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/7.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources


class FindViewModel {
    
    var gatherAlbums = Variable([SectionOfGather]())
    
    init() {
        
        
    }
    
    // 获取列表
    func loadData() {
        
        let sections = [
            SectionOfGather(header: "First section", items: [GatherJsonModel(anInt: 0, aString: "zero", aCGPoint: CGPoint.zero), GatherJsonModel(anInt: 1, aString: "one", aCGPoint: CGPoint(x: 1, y: 1)), GatherJsonModel(anInt: 2, aString: "two", aCGPoint: CGPoint(x: 2, y: 2)), GatherJsonModel(anInt: 3, aString: "three", aCGPoint: CGPoint(x: 3, y: 3)) ])
        ]
        
        self.gatherAlbums.value = sections
        
    }
    
}

