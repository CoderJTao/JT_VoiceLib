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
    
    let disposeBag = DisposeBag()
    let viewModel = FindViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideNavigationBarHairLine()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.collectionView.register(UINib(nibName: "FindCardCell", bundle: nil), forCellWithReuseIdentifier: "CardCell")
        
        let sections = [
            SectionOfAlbums(header: "First section", items: [AlbumsJsonModel(anInt: 0, aString: "zero", aCGPoint: CGPoint.zero), AlbumsJsonModel(anInt: 1, aString: "one", aCGPoint: CGPoint(x: 1, y: 1)), AlbumsJsonModel(anInt: 2, aString: "two", aCGPoint: CGPoint(x: 2, y: 2)), AlbumsJsonModel(anInt: 3, aString: "three", aCGPoint: CGPoint(x: 3, y: 3)) ])
        ]
        
        let (configureCollectionViewCell, configureSupplementaryView) =  FindViewController.collectionViewDataSourceUI()
        let dataSource = RxCollectionViewSectionedReloadDataSource(configureCell: configureCollectionViewCell, configureSupplementaryView: configureSupplementaryView)
        
        Observable.just(sections)
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kScreenW*0.8, height: kScreenW*0.8*1.5)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsetsMake(30, 0, 20, 0)
        self.collectionView.collectionViewLayout = layout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
extension FindViewController {
    
    
    
    static func collectionViewDataSourceUI() -> (
        CollectionViewSectionedDataSource<SectionOfAlbums>.ConfigureCell,
        CollectionViewSectionedDataSource<SectionOfAlbums>.ConfigureSupplementaryView
        ) {
            return (
                { (_, cv, ip, i) in
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "CardCell", for: ip) as! FindCardCell
                    cell.titleLbl.text = "\(i)"
                    return cell
                    
            },
                { (ds ,cv, kind, ip) in
                    let section = UICollectionReusableView()
                    return section
            }
            )
    }


}
