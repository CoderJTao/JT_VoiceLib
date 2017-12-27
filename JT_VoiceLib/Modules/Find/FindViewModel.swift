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
    
    var gathers = Variable<[GatherJsonModel]>([])
    var totalPage = 99999
    
    let disposeBag = DisposeBag()
    
    init() {
    }
    
    // 获取列表
    func loadData(_ pageNum : Int, _ isRefresh: Bool) {
        
        if isRefresh {
            NetWorkService.sharedInstance.getGather(pageNum: "\(pageNum)")
                .subscribe(onNext: { (sectionOfGather) in
                    self.gathers.value = sectionOfGather.list!
                    self.totalPage = sectionOfGather.totalCount!
                }, onError: { (error) in
                    
                }).disposed(by: disposeBag)
        } else {
            if pageNum > totalPage { return }
            
            NetWorkService.sharedInstance.getGather(pageNum: "\(pageNum)")
                .subscribe(onNext: { (sectionOfGather) in
                    self.gathers.value = self.gathers.value + sectionOfGather.list!
                    self.totalPage = sectionOfGather.totalCount!
                }, onError: { (error) in
                    
                }).disposed(by: disposeBag)
        }
        
        
        
        
        
    }
    
}

