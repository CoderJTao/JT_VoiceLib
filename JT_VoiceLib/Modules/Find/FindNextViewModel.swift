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
import Kingfisher

class FindNextViewModel {
    
    var albums = Variable<[AlbumsJsonModel]>([])
    
    var totalPage = 99999
    
    let disposeBag  = DisposeBag()
    
    init() {
        
        
    }
    
    // 获取列表
    func loadData(uid: Int, _ pageNum : Int) {
        
        if pageNum > totalPage { return }
        
        NetWorkService.sharedInstance.getAlbumsList(uid: "\(uid)", pageNum: "\(pageNum)")
            .subscribe(onNext: { (albums) in
                
                self.albums.value = self.albums.value + albums.list!
                self.totalPage = albums.maxPageId!
            }, onError: { (error) in
                
            }).disposed(by: self.disposeBag)
        
    }
    
}


