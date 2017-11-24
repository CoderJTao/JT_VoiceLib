//
//  AlbumDetailCell.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/16.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import Kingfisher

class AlbumDetailCell: UITableViewCell {
    
    var jsonModel : TracksJsonModel?
    
    
    @IBOutlet weak var showImg: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var playTimesLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    @IBOutlet weak var downloadBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(model: TracksJsonModel) {
        self.jsonModel = model
        
        //    trackId: 48117988,
        //    title: "【头条星闻1】预告片花",
        //    coverSmall: "http://image.xmcdn.com/group33/M06/4A/95/wKgJnVmar0uQkqTGAAF1FxXUpug676_mobile_small.jpg",
        //    coverLarge: "http://image.xmcdn.com/group33/M06/4A/95/wKgJnVmar0uQkqTGAAF1FxXUpug676_mobile_large.jpg",
        //    playtimes: 8558,
        //    playUrl32: "http://aod.tx.xmcdn.com/group32/M01/4A/F3/wKgJnFmaseiCWdbpACWhtkcMvSQ517.mp3",
        //    playUrl64: "http://aod.tx.xmcdn.com/group32/M02/4A/73/wKgJS1mar_fxzaw9AEtDLvG1zKk670.mp3",
        //    mp3size_32: 2466230,
        //    mp3size_64: 4932398,
        //    albumId: 10076452,
        //    albumUid: 1021189,
        //    duration: 616.516,
        //    createdAt: 1503309893000,
        //    updatedAt: 1503325520000
        self.showImg.kf.setImage(with: URL(string: model.coverSmall!))
        self.descLbl.text = model.title
        self.playTimesLbl.text = String(format: "%d", model.playtimes!)
        self.durationLbl.text = self.getDuration()
        self.sizeLbl.text = self.getSize()
    }
    
    func getDuration() -> String {
        
        let m = (jsonModel?.duration)! / 60
        let s = (jsonModel?.duration)! - m*60
        
        return String(format: "%0d:%0d", m, s)
    }
    
    func getSize() -> String {
        
        let a : Float = Float((jsonModel?.mp3size_64)!)
        let b = a / 1024
        let c = b / 1024
        
        return String(format: "%.2f", c)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func downloadClick(_ sender: Any) {
    }
    
}
