//
//  PlayViewController.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/17.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    var playModel: TracksJsonModel? {
        didSet {
            if let model = playModel {
                PlayCacheHandler.sharedInstance.playModel = model
            }
        }
    }
    
    @IBOutlet weak var bgImg: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addBlurEffect()
        self.hideNavigationBarHairLine()
        self.showNavigationBackButton()
        self.bgImg.layer.masksToBounds = true
        
        AppDelegate.sharedInstance.hidePlayBtn()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        AppDelegate.sharedInstance.showPlayBtn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        effectView.frame = UIScreen.main.bounds;
        self.bgImg.addSubview(effectView)
        
        //设置模糊透明度
        effectView.alpha = 1
    }

}
