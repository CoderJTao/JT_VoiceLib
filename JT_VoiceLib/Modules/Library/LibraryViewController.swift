//
//  LibraryViewController.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/7.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa

class LibraryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var pageNum = 1
    
    let disposeBag = DisposeBag()
    let viewModel = LibraryViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.showNavigationBackButton()
        self.showNavigationSearchButton()
        self.title = "音库"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableAndCollectionView()
        self.viewModel.loadCatalogs()
    }
    
    // MARK: - set TableView and collectionView
    func setUpTableAndCollectionView() {
        // tableView
        self.tableView.rx.setDelegate(self).disposed(by: self.disposeBag)
        
        self.viewModel.categorys.asObservable().observeOn(MainScheduler.instance)
            .bind(to: self.tableView.rx.items(cellIdentifier: "LibraryLeftCell", cellType: LibraryLeftCell.self)) {[unowned self] (index: Int, model: CategoryJsonModel, cell: LibraryLeftCell) in
                cell.setCell(model: model)
                
                self.tableView.selectRow(at: IndexPath.init(row: 0, section: 0), animated: true, scrollPosition: UITableViewScrollPosition.none)
                if index == 0 {
                    self.viewModel.loadCatalogDetail(catalog: model.name!, pageNum: self.pageNum)
                }
            }.disposed(by: self.disposeBag)
        
        // collectionView
        
        self.collectionView.rx.setDelegate(self).disposed(by: self.disposeBag)
        
        self.viewModel.catelogDetailList.asObservable().observeOn(MainScheduler.instance)
            .bind(to: self.collectionView.rx.items(cellIdentifier: "LibraryRightCell", cellType: LibraryRightCell.self)) { (index: Int, model: CategoryDetailListJsonModel, cell: LibraryRightCell) in
                cell.setCell(model: model)
            }.disposed(by: self.disposeBag)
        
        self.collectionView.rx.itemSelected
            .subscribe(onNext: { [unowned self] index in
                let cell = self.collectionView.cellForItem(at: index) as! LibraryRightCell
                self.collectionViewItemSelected(model: cell.jsonModel ?? (try! CategoryDetailListJsonModel(json: [:])))
            })
            .disposed(by: disposeBag)
    }
    
    private func collectionViewItemSelected(model: CategoryDetailListJsonModel) {
        let storyboard = UIStoryboard(name: "FindStoryBoard", bundle: Bundle.main)
        if let controller = storyboard.instantiateViewController(withIdentifier: "AlbumDetailViewController") as? AlbumDetailViewController {
            controller.passAlbumId = model.id
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LibraryViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? LibraryLeftCell
        self.viewModel.loadCatalogDetail(catalog: (cell?.jsonModel?.name)!, pageNum: pageNum)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if collectionView == scrollView {
            if collectionView.contentSize.width < collectionView.width { return }
            if scrollView.contentOffset.x + (scrollView.frame.size.width) > scrollView.contentSize.width+60 {
//                self.loadMoreData()
            }
        }
    }
}

