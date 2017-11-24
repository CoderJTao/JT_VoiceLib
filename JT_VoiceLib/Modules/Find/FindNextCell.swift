//
//  FindNextCell.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/14.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import Kingfisher

class FindNextCell: UICollectionViewCell {
    
    var jsonModel : AlbumsJsonModel?
    
    @IBOutlet weak var showImg: UIImageView!
    
    @IBOutlet weak var showTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setCell(model: AlbumsJsonModel) {
        self.jsonModel = model
        
        let str = NSMutableString.init(string: (jsonModel?.coverSmall)!)
        str.replaceCharacters(in: NSRange.init(location: str.length-9, length: 5), with: "large")
        
        self.showImg.kf.setImage(with: URL(string: str as String), placeholder: UIImage(named:"default"))
        self.showTitle.text = model.title
        
    }
}
