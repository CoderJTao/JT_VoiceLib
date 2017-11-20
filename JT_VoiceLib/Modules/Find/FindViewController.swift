//
//  FindViewController.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/7.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class FindViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var refreshControl : UIRefreshControl?
    
    var pageNum : Int = 1
    
    let disposeBag = DisposeBag()
    let viewModel = FindViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showTabbar()
        self.showNavigationBar()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showTabbar()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.hideTabbar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNavigationBarHairLine()
        self.showNavigationLibraryButton()
        
        //初始化数据
        self.viewModel.loadData(pageNum, true)
        
        setUpCollectionView()
        
    }
    
    // refresh data
    @objc func refreshData() {
        self.viewModel.loadData(1, true)
    }
    
    // loadMore data
    func loadMoreData() {
        pageNum += 1
        self.viewModel.loadData(pageNum, false)
    }
    
    
    // MARK: -  cell selected
    private func itemSelected(model:GatherJsonModel) {
        let storyboard = UIStoryboard(name: "FindStoryBoard", bundle: Bundle.main)
        if let controller = storyboard.instantiateViewController(withIdentifier: "FindNextViewController") as? FindNextViewController {
            controller.imageHeroId = "AlbumShowImage+\(String(describing: model.uid))"
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

// MARK: -  setUp UI element
extension FindViewController {
    
    private func setUpCollectionView() {
        self.collectionView.register(UINib(nibName: "FindCardCell", bundle: nil), forCellWithReuseIdentifier: "CardCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kScreenW*0.85, height: kScreenW*0.8*1.33)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsetsMake(30, 0, 20, 0)
        self.collectionView.collectionViewLayout = layout
        
        // 设置代理  监测滑动   上拉加载更多数据
        self.collectionView.rx.setDelegate(self).disposed(by: self.disposeBag)
        
        self.viewModel.gathers.asObservable().observeOn(MainScheduler.instance)
            .bind(to: self.collectionView.rx.items(cellIdentifier: "CardCell", cellType: FindCardCell.self)) { (index: Int, model: GatherJsonModel, cell: FindCardCell) in
                cell.setCell(model: model)
            }.disposed(by: self.disposeBag)
        
        self.collectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] index in
                let cell = self?.collectionView.cellForItem(at: index) as! FindCardCell
                self?.itemSelected(model: cell.jsonModel!)
            })
            .disposed(by: disposeBag)
    }
    
    private func setRefreshControl () {
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        self.collectionView.addSubview(self.refreshControl!)
    }
}

extension FindViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if collectionView.contentSize.height < collectionView.height { return }
        if scrollView.contentOffset.y + (scrollView.frame.size.height) > scrollView.contentSize.height+60 {
            self.loadMoreData()
        }
    }
}
