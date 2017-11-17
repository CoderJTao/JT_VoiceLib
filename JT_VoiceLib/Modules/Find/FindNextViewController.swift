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

class FindNextViewController: UIViewController {

    var imageHeroId : String?
    
    @IBOutlet weak var showImg: UIImageView!
    
    @IBOutlet weak var showTitle: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource : RxCollectionViewSectionedReloadDataSource<SectionOfAlbums>!
    
    let disposeBag = DisposeBag()
    let viewModel = FindNextViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showImg.heroID = self.imageHeroId
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
        
        self.viewModel.loadData()
    }
    
    private func setUpCollectionView() {
//        self.collectionView.register(UINib(nibName: "FindNextCell", bundle: nil), forCellWithReuseIdentifier: "FindNextCell")
        
        let (configureCollectionViewCell, configureSupplementaryView) =  FindNextViewController.collectionViewDataSourceUI()
        let dataSourceT = RxCollectionViewSectionedReloadDataSource(configureCell: configureCollectionViewCell, configureSupplementaryView: configureSupplementaryView)
        self.dataSource = dataSourceT
        
        self.viewModel.albums.asObservable()
            .bind(to: collectionView.rx.items(dataSource: self.dataSource))
            .disposed(by: disposeBag)
        
        self.collectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] index in
                let cell = self?.collectionView.cellForItem(at: index) as! FindNextCell
                self?.itemSelected(model: cell.jsonModel!)
            })
            .disposed(by: disposeBag)
    }
    
    private func itemSelected(model:AlbumsJsonModel) {
        
        let storyboard = UIStoryboard(name: "FindStoryBoard", bundle: Bundle.main)
        if let controller = storyboard.instantiateViewController(withIdentifier: "AlbumDetailViewController") as? AlbumDetailViewController {
            
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

    static func collectionViewDataSourceUI() -> (
        CollectionViewSectionedDataSource<SectionOfAlbums>.ConfigureCell,
        CollectionViewSectionedDataSource<SectionOfAlbums>.ConfigureSupplementaryView
        ) {
            return (
                { (_, cv, ip, i) in
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "FindNextCell", for: ip) as! FindNextCell
                    cell.showTitle.text = "\(i.aString)"
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
