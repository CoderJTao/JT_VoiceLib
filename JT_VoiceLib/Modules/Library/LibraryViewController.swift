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
    
    var dataSourceForTable : RxTableViewSectionedReloadDataSource<SectionOfCatalog>!
    var dataSourceForCollection : RxCollectionViewSectionedReloadDataSource<SectionOfCatalogDetail>!
    
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
        
        self.dataSourceForTable = LibraryViewController.getTableViewDataSource()
        
        self.viewModel.catalogs.asObservable()
            .bind(to: tableView.rx.items(dataSource: self.dataSourceForTable))
            .disposed(by: disposeBag)
        
//        self.tableView.delegate?tableView!(self.tableView, didSelectRowAt: IndexPath.init(row: 0, section: 0))
        
        // collectionView
        let (configureCollectionViewCell, configureSupplementaryView) =  LibraryViewController.getCollectionViewDataSource()
        let dataSourceT = RxCollectionViewSectionedReloadDataSource(configureCell: configureCollectionViewCell, configureSupplementaryView: configureSupplementaryView)
        self.dataSourceForCollection = dataSourceT
        
        self.viewModel.catalogDetail.asObservable()
            .bind(to: collectionView.rx.items(dataSource: self.dataSourceForCollection))
            .disposed(by: disposeBag)
        
        self.collectionView.rx.itemSelected
            .subscribe(onNext: { [unowned self] index in
                let cell = self.collectionView.cellForItem(at: index) as! LibraryRightCell
                self.collectionViewItemSelected(model: cell.jsonModel!)
            })
            .disposed(by: disposeBag)
    }
    
    private func collectionViewItemSelected(model: CatalogDetailJsonModel) {
        let storyboard = UIStoryboard(name: "FindStoryBoard", bundle: Bundle.main)
        if let controller = storyboard.instantiateViewController(withIdentifier: "AlbumDetailViewController") as? AlbumDetailViewController {
            
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
        self.viewModel.loadCatalogDetail(catalog: cell?.jsonModel?.aString)
    }
    
}


extension LibraryViewController {
    
    static func getTableViewDataSource() -> RxTableViewSectionedReloadDataSource<SectionOfCatalog> {
        return RxTableViewSectionedReloadDataSource<SectionOfCatalog>(
            configureCell: { (dataSource, table, idxPath, model) in
                let cell = table.dequeueReusableCell(withIdentifier: "LibraryLeftCell", for: idxPath) as! LibraryLeftCell
                cell.setCell(model: model)
                cell.titleLbl.text = "\(model.aString)"
                let view = UIView()
                view.backgroundColor = CellSelctedBackGroundColor
                cell.selectedBackgroundView = view
                table.selectRow(at: IndexPath.init(row: 0, section: 0), animated: true, scrollPosition: UITableViewScrollPosition.none)
                return cell
            }
        )
    }
    
    static func getCollectionViewDataSource() -> (
        CollectionViewSectionedDataSource<SectionOfCatalogDetail>.ConfigureCell,
        CollectionViewSectionedDataSource<SectionOfCatalogDetail>.ConfigureSupplementaryView
        ) {
            return (
                { (_, cv, ip, i) in
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "LibraryRightCell", for: ip) as! LibraryRightCell
                    cell.setCell(model: i)
                    cell.titleLbl.text = "\(i.aString)"
                    return cell
                    
            },
                { (ds ,cv, kind, ip) in
                    let section = UICollectionReusableView()
                    return section
            }
            )
    }
    
}

