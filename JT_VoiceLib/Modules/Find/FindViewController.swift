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
    
    var dataSource : RxCollectionViewSectionedReloadDataSource<SectionOfGather>!
    
    let disposeBag = DisposeBag()
    let viewModel = FindViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showTabbar()
        self.showNavigationBar()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNavigationBarHairLine()
        setUpCollectionView()
        self.showNavigationLibraryButton()
        self.viewModel.loadData()
    }

    
    private func setUpCollectionView() {
        self.collectionView.register(UINib(nibName: "FindCardCell", bundle: nil), forCellWithReuseIdentifier: "CardCell")
        
        let (configureCollectionViewCell, configureSupplementaryView) =  FindViewController.collectionViewDataSourceUI()
        let dataSourceT = RxCollectionViewSectionedReloadDataSource(configureCell: configureCollectionViewCell, configureSupplementaryView: configureSupplementaryView)
        self.dataSource = dataSourceT
        
        self.viewModel.gatherAlbums.asObservable()
            .bind(to: collectionView.rx.items(dataSource: self.dataSource))
            .disposed(by: disposeBag)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kScreenW*0.85, height: kScreenW*0.8*1.33)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsetsMake(30, 0, 20, 0)
        self.collectionView.collectionViewLayout = layout
        
        self.collectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] index in
                let cell = self?.collectionView.cellForItem(at: index) as! FindCardCell
                self?.itemSelected(model: cell.jsonModel!)
            })
            .disposed(by: disposeBag)
    }
    
    private func itemSelected(model:GatherJsonModel) {
        let storyboard = UIStoryboard(name: "FindStoryBoard", bundle: Bundle.main)
        if let controller = storyboard.instantiateViewController(withIdentifier: "FindNextViewController") as? FindNextViewController {
            controller.imageHeroId = "AlbumShowImage"+"\(model.anInt)"
//            DispatchQueue.main.async {
                self.navigationController?.pushViewController(controller, animated: true)
//            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
extension FindViewController {
    
    
    
    static func collectionViewDataSourceUI() -> (
        CollectionViewSectionedDataSource<SectionOfGather>.ConfigureCell,
        CollectionViewSectionedDataSource<SectionOfGather>.ConfigureSupplementaryView
        ) {
            return (
                { (_, cv, ip, i) in
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "CardCell", for: ip) as! FindCardCell
                    cell.titleLbl.text = "\(i.aString)"
                    cell.setCell(model: i)
                    return cell
                    
            },
                { (ds ,cv, kind, ip) in
                    let section = UICollectionReusableView()
                    return section
            }
            )
    }


}
