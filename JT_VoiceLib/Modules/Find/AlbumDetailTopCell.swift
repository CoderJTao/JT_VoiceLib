//
//  AlbumDetailTopCell.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/16.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit

class AlbumDetailTopCell: UITableViewCell {

    @IBOutlet weak var bgView: UIImageView!
    
    @IBOutlet weak var showImg: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var countLbl: UILabel!
    
    @IBOutlet weak var detailBtn: UIButton!
    @IBOutlet weak var subscribeBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        addBlurEffect()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
