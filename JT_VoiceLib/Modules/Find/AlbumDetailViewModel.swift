//
//  AlbumDetailViewModel.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/16.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AlbumDetailViewModel {
    
    var tracks = Variable([SectionOfTracks]())
    
    let disposeBag = DisposeBag()
    
    init() {
    }
    
    // 获取列表
    func loadData() {
        
        let sections = [
            SectionOfTracks(header: "", items: [TracksJsonModel(anInt: 0, aString: "zero", aCGPoint: CGPoint.zero), TracksJsonModel(anInt: 1, aString: "one", aCGPoint: CGPoint(x: 1, y: 1)), TracksJsonModel(anInt: 2, aString: "two", aCGPoint: CGPoint(x: 2, y: 2)), TracksJsonModel(anInt: 3, aString: "three", aCGPoint: CGPoint(x: 3, y: 3)) ])
        ]
        
        self.tracks.value = sections
        
    }
}
