//
//  FindCardCell.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/8.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit

class FindCardCell: UICollectionViewCell {
    
    var jsonModel : GatherJsonModel?
    
    @IBOutlet weak var containView: UIView!
    @IBOutlet var showImg: UIImageView!
    
    @IBOutlet var titleLbl: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containView.layer.masksToBounds = true
        containView.layer.cornerRadius = 8
        
        self.addPathShadow()
    }
    
    func setCell(model: GatherJsonModel) {
        self.jsonModel = model
        
        self.showImg.heroID = "AlbumShowImage"+"\(model.anInt)"
    }
    
    
    /// 为cell加上阴影
    ///
    /// - Parameter view: cell
    func addPathShadow() {
        //用路径定义shadow位置和形状
        let size = self.bounds.size
        let width = size.width
        let height = size.height
        //        let depth = CGFloat(11.0)
        //        let lessDepth = 0.8 * depth
        let curvyness = CGFloat(3)
        //        let radius = CGFloat(1)
        
        let path = UIBezierPath()
        
        // top left
        path.move(to: CGPoint(x: -curvyness, y: -curvyness))
        
        // top right
        path.addLine(to: CGPoint(x:width + curvyness, y:-curvyness))
        
        // bottom right + a little extra
        path.addLine(to: CGPoint(x: width + curvyness, y: height + curvyness))
        
        // path to bottom left via curve
        path.addLine(to: CGPoint(x: -curvyness, y: height + curvyness))
        
        
        let layer = self.layer
        layer.shadowPath = path.cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 2, height: 2)
    }

}
