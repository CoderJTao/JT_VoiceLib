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
import RxDataSources

class AlbumDetailViewModel {
    
    var tracks = Variable<[TracksJsonModel]>([])
    
    var totalPage = 99999
    
    let disposeBag = DisposeBag()
    
    var albumDetailModels = Variable<[AlbumDetailModel]>([])
    
    var dataSource : RxTableViewSectionedReloadDataSource<AlbumDetailModel>!
    
    init() {
        self.dataSource = self.getDataSources()
    }
    
    // 获取列表
    func loadData(uid: Int, pageNum: Int) {
        if pageNum > totalPage { return }
        
        NetWorkService.sharedInstance.getTracksList(uid: "\(uid)", pageNum: "\(pageNum)")
            .subscribe(onNext: { (sections) in
//                self.tracks.value = (sections.tracks?.list)!
//                self.trackTop?.value = sections.album!
//                self.totalPage = (sections.tracks?.maxPageId)!
                
                
//                var temp : [AlbumModel] = []
//                temp.append(AlbumModel.init(top: sections.album, detail: nil))
//                for model in (sections.tracks?.list)! {
//                    temp.append(AlbumModel.init(top: nil, detail: model))
//                }
//                self.allList.value = temp
                
                // 音频列表
                self.tracks.value = (sections.tracks?.list)!
                
                var temp : [AlbumDetailModel] = []
                temp.append(AlbumDetailModel.topSection(items: [AlbumDetailSection.topItem(model: sections.album!)]))
                for model in (sections.tracks?.list)! {
                    temp.append(AlbumDetailModel.detailSection(items: [AlbumDetailSection.detailItem(model: model)]))
                }
                self.albumDetailModels.value = temp
                
            }, onError: { (error) in
                
            }).disposed(by: self.disposeBag)
        
    }
}

extension AlbumDetailViewModel {
    
    func getDataSources() -> RxTableViewSectionedReloadDataSource<AlbumDetailModel> {
        
        return RxTableViewSectionedReloadDataSource<AlbumDetailModel>.init(configureCell: { (datasource, tableV, indexPath, section) -> UITableViewCell in
            
            switch section {
            case .topItem(let model):
                let cell: AlbumDetailTopCell = tableV.dequeueReusableCell(withIdentifier: "AlbumDetailTopCell") as! AlbumDetailTopCell
                cell.setCell(model: model)
                return cell
            case .detailItem(let model):
                let cell: AlbumDetailCell = tableV.dequeueReusableCell(withIdentifier: "AlbumDetailCell") as! AlbumDetailCell
                cell.setCell(model: model)
                return cell
            }
        })
    }
    
}
