//
//  LibraryLeftCell.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/17.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit


class LibraryLeftCell: UITableViewCell {
    
    var jsonModel: CategoryJsonModel?
    
    @IBOutlet weak var titleLbl: UILabel!
    
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(model: CategoryJsonModel) {
        self.jsonModel = model
        
        self.titleLbl.text = model.name
    }
    
}
