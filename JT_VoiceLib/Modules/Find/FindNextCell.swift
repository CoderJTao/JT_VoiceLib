//
//  FindNextCell.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/14.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit

class FindNextCell: UICollectionViewCell {
    
    var jsonModel : AlbumsJsonModel?
    
    @IBOutlet weak var showImg: UIImageView!
    
    @IBOutlet weak var showTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setCell(model: AlbumsJsonModel) {
        self.jsonModel = model
        self.showImg.heroID = "DetailBg"+"\(model.anInt)"
    }
}
