//
//  FindNextViewController.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/14.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import RxCocoa
import Kingfisher

class FindNextViewController: UIViewController {

    var imageHeroId : String?
    var passModel : GatherJsonModel? {
        didSet {
            self.viewModel.loadData(uid: (passModel?.uid)!, pageNum)
        }
    }
    var passImg : UIImage?
    var pageNum : Int = 1
    
    @IBOutlet weak var showImg: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!

    
    let disposeBag = DisposeBag()
    let viewModel = FindNextViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showImg.hero.id = self.imageHeroId
        self.showImg.image = passImg
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.showNavigationBackButton()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        
        
    }
    
    // MARK: - 加载数据
    func loadMoreData() {
        pageNum += 1
        self.viewModel.loadData(uid: (passModel?.uid)!, pageNum)
    }
    
    // MARK: - cell 点击事件
    private func itemSelected(model:AlbumsJsonModel) {
        
        let storyboard = UIStoryboard(name: "FindStoryBoard", bundle: Bundle.main)
        if let controller = storyboard.instantiateViewController(withIdentifier: "AlbumDetailViewController") as? AlbumDetailViewController {
            controller.passAlbumId = model.albumId
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeClick(_ sender: UIButton) {
        self.collectionView.isHidden = true
        self.navigationController?.popViewController(animated: true)
    }
}

extension FindNextViewController {
    
    private func setUpCollectionView() {
        
        self.viewModel.albums.asObservable().observeOn(MainScheduler.instance)
            .bind(to: self.collectionView.rx.items(cellIdentifier: "FindNextCell", cellType: FindNextCell.self)) { (index: Int, model: AlbumsJsonModel, cell: FindNextCell) in
                cell.setCell(model: model)
            }.disposed(by: self.disposeBag)
        
        // 设置代理  监测滑动   上拉加载更多数据
        self.collectionView.rx.setDelegate(self).disposed(by: self.disposeBag)
        
        self.collectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] index in
                let cell = self?.collectionView.cellForItem(at: index) as! FindNextCell
                self?.itemSelected(model: cell.jsonModel!)
            })
            .disposed(by: disposeBag)
    }
    
}

extension FindNextViewController : UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if collectionView.contentSize.width < collectionView.width { return }
        if scrollView.contentOffset.x + (scrollView.frame.size.width) > scrollView.contentSize.width+60 {
            self.loadMoreData()
        }
    }
}
