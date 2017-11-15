//
//  AlbumDetailViewController.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/15.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {

    var imageHeroId : String?
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var containView: UIView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.bgImageView.heroID = self.imageHeroId
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.containView.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBlurEffect()
    }

    
    // MARK: - 添加毛玻璃
    func addBlurEffect() {
        //  创建显示图片
        /**  毛玻璃特效类型
         *  UIBlurEffectStyleExtraLight,
         *  UIBlurEffectStyleLight,
         *  UIBlurEffectStyleDark
         */
        let blurEffect = UIBlurEffect(style: .light)
        
        //  毛玻璃视图
        let effectView = UIVisualEffectView.init(effect: blurEffect)
        
        //添加到要有毛玻璃特效的控件中
        effectView.frame = UIScreen.main.bounds;
        bgImageView.addSubview(effectView)
        
        //设置模糊透明度
        effectView.alpha = 1
    }
    
    @IBAction func backClick(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
