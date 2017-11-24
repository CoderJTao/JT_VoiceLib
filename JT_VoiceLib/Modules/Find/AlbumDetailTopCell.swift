//
//  AlbumDetailTopCell.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/16.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import Kingfisher

class AlbumDetailTopCell: UITableViewCell {

    @IBOutlet weak var bgView: UIImageView!
    
    @IBOutlet weak var showImg: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var countLbl: UILabel!
    
    @IBOutlet weak var detailBtn: UIButton!
    @IBOutlet weak var subscribeBtn: UIButton!
    
    var jsonModel : TrackTopJsonModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        addBlurEffect()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    nickname: "莱兮",
    //    uid: 1021189,
    //    smallLogo: "http://image.xmcdn.com/group29/M03/A2/75/wKgJWVlKAN6BlKjkAADuKE1lj5c066_mobile_small.jpg",
    //    albumId: 10076452,
    //    title: "头条星闻1",
    //    coverSmall: "http://image.xmcdn.com/group33/M00/4A/61/wKgJnVmarFTCZ-fiAAF1FxXUpug810_mobile_small.jpg",
    //    coverLarge: "http://image.xmcdn.com/group33/M00/4A/61/wKgJnVmarFTCZ-fiAAF1FxXUpug810_mobile_large.jpg",
    //    intro: "【内容简介】 关于她—— 她是30张唱片记录的乐坛衰人；她是除了梦想只剩一箱泡面...",
    //    richIntro: "",
    //    updatedAt: 1510842242000,
    //    playCount: 68423,
    //    tracks: 12
    func setCell(model: TrackTopJsonModel) {
        self.jsonModel = model
        
        self.bgView.kf.setImage(with: URL(string: (jsonModel?.coverLarge)!))
        self.showImg.kf.setImage(with: URL(string: (jsonModel?.coverSmall)!))
        self.descLbl.text = jsonModel?.intro
        self.countLbl.text = String(format: "节目数：%d", (jsonModel?.tracks)!)
    }
    
    // MARK: - 进入简介
    @IBAction func goToDetailClick(_ sender: Any) {
    }
    // MARK: - 订阅专辑
    @IBAction func subScribeClick(_ sender: Any) {
    }
    
    
    // MARK: - 添加毛玻璃
    func addBlurEffect() {
        //  创建显示图片
        /**  毛玻璃特效类型
         *  UIBlurEffectStyleExtraLight,
         *  UIBlurEffectStyleLight,
         *  UIBlurEffectStyleDark
         */
        let blurEffect = UIBlurEffect(style: .regular)
        
        //  毛玻璃视图
        let effectView = UIVisualEffectView.init(effect: blurEffect)
        
        //添加到要有毛玻璃特效的控件中
        effectView.frame = self.bounds;
        self.bgView.addSubview(effectView)
        
        //设置模糊透明度
        effectView.alpha = 1
    }
}
