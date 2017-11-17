//
//  LibraryRightCell.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/17.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit

class LibraryRightCell: UICollectionViewCell {
    var jsonModel : CatalogDetailJsonModel?
    
    @IBOutlet weak var showImg: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setCell(model: CatalogDetailJsonModel) {
        self.jsonModel = model
        
    }
}
