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
    
    var categorys = Variable<[CategoryJsonModel]>([])
    
    var catelogDetailList = Variable<[CategoryDetailListJsonModel]>([])
    
    let disposeBag = DisposeBag()
    
    var canLoadMore = true
    
    init() {
    }
    
    // 获取分类列表
    func loadCatalogs() {
        
        NetWorkService.sharedInstance.getCategotyList()
            .subscribe(onNext: { (categorys) in
                
                self.categorys.value = categorys
                
            }, onError: { (error) in
                
            }).disposed(by: self.disposeBag)
        
    }
    
    // 获取类别详情
    func loadCatalogDetail(catalog: String, pageNum: Int) {
        if !self.canLoadMore { return }
        NetWorkService.sharedInstance.getCategotyDetailList(catelog: catalog, pageNum: "\(pageNum)")
            .subscribe(onNext: { (lists) in
                if lists.count == 0 {
                    self.canLoadMore = false
                }
                self.catelogDetailList.value = self.catelogDetailList.value + lists
                
            }, onError: { (error) in
                
            }).disposed(by: self.disposeBag)
    }
}
