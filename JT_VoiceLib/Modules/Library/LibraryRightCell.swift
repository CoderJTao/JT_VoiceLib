//
//  LibraryRightCell.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/17.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import Kingfisher

class LibraryRightCell: UICollectionViewCell {
    var jsonModel : CategoryDetailListJsonModel?
    
    @IBOutlet weak var showImg: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setCell(model: CategoryDetailListJsonModel) {
        self.jsonModel = model
        
        self.titleLbl.text = model.title
        self.showImg.kf.setImage(with: URL(string: model.coverSmall!))
    }
}
