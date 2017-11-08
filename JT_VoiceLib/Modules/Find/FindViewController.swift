//
//  FindViewController.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/7.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit

class FindViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide navigation line
        self.hideNavigationBarHairLine()
        UINavigationController
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: kScreenW*0.8, height: kScreenW*0.8*1.5)
        layout.minimumInteritemSpacing = 30
        layout.minimumLineSpacing = 25
        
        collectionView.collectionViewLayout = layout
        collectionView.register(UINib.init(nibName: "FindCardCell", bundle: nil), forCellWithReuseIdentifier: "FindCardCell")
        collectionView.isDirectionalLockEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
extension FindViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FindCardCell", for: indexPath) as! FindCardCell
        
        cell.titleLbl.text = String(indexPath.row)
        cell.layer.cornerRadius = 8;
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 30, left: 5, bottom: 30, right: 5)
    }

    
    
//    /// 计算偏移
//    ///
//    /// - Parameter scrollView: collectionView
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let offsetX = kScreenW*0.75+25
//
//        let halfOffset = offsetX*0.5
//
//        let currentOffset = scrollView.contentOffset.x
//
//        let lastOffset = currentOffset.truncatingRemainder(dividingBy: offsetX)
//
//        if lastOffset > halfOffset { //向下一个cell偏移
//
//            let shouldOffset = offsetX-lastOffset
//            let point = CGPoint(x: currentOffset+shouldOffset, y: 0)
//
//            UIView.animate(withDuration: 0.2, animations: {
//                scrollView.contentOffset = point
//            })
//
//        } else { //向上一个cell偏移
//
//            let shouldOffset = lastOffset
//            let point = CGPoint(x: currentOffset-shouldOffset, y: 0)
//
//            UIView.animate(withDuration: 0.2, animations: {
//                scrollView.contentOffset = point
//            })
//        }
//    }
//
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        let offsetX = kScreenW*0.75+25
//
//        let halfOffset = offsetX*0.5
//
//        let currentOffset = scrollView.contentOffset.x
//
//        let lastOffset = currentOffset.truncatingRemainder(dividingBy: offsetX)
//
//        if lastOffset > halfOffset { //向下一个cell偏移
//
//            let shouldOffset = offsetX-lastOffset
//            let point = CGPoint(x: currentOffset+shouldOffset, y: 0)
//
//            UIView.animate(withDuration: 0.2, animations: {
//                scrollView.contentOffset = point
//            })
//
//        } else { //向上一个cell偏移
//
//            let shouldOffset = lastOffset
//            let point = CGPoint(x: currentOffset-shouldOffset, y: 0)
//
//            UIView.animate(withDuration: 0.2, animations: {
//                scrollView.contentOffset = point
//            })
//        }
//    }
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.x)
//    }
}
