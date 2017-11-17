//
//  AlbumDetailCell.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/16.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit

class AlbumDetailCell: UITableViewCell {
    
    var jsonModel : TracksJsonModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(model: TracksJsonModel) {
        self.jsonModel = model
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
