//
//  PlayViewController.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/17.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import RxSwift
import PKHUD

class PlayViewController: UIViewController {
    
    private var disposeBag = DisposeBag()
    
    // 要播放的音频
    var playModel: TracksJsonModel? {
        didSet {
            if let model = playModel {
                PlayManager.sharedInstance.playModel = model
            }
        }
    }
    
    // 音频列表
    var listModel: [TracksJsonModel]? {
        didSet {
            if let list = listModel {
                PlayManager.sharedInstance.musicList = list
            }
        }
    }
    
    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var showImg: UIImageView!
    
    @IBOutlet weak var currentTimeLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    
    
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var listTableView: UITableView!
    
    
    
    
    
    
    
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

        setUI()
        
        // bind
        PlayManager.sharedInstance.progress.asObservable().observeOn(MainScheduler.instance)
            .subscribe(onNext: { (progress) in
                self.progressSlider.setValue(progress, animated: true)
            }).disposed(by: self.disposeBag)
        
        PlayManager.sharedInstance.currentTime.asObservable().observeOn(MainScheduler.instance)
            .subscribe(onNext: { (currentTime) in
                self.currentTimeLbl.text = self.changeToTime(time: currentTime)
            }).disposed(by: self.disposeBag)
        
        PlayManager.sharedInstance.duration.asObservable().observeOn(MainScheduler.instance)
            .subscribe(onNext: { (duration) in
                self.durationLbl.text = self.changeToTime(time: duration)
            }).disposed(by: self.disposeBag)
    }
    
    /// change int to time
    func changeToTime(time: Int) -> String {
        let str_minute = String.init(format: "%02d", time/60)
        let str_second = String.init(format: "%02d", time%60)
        let format_time = String.init(format: "%@:%@", str_minute, str_second)
        
        return format_time
    }
    
    private func setUI() {
        self.progressSlider.value = 0
        self.showImg.layer.cornerRadius = 125
        
        PlayManager.sharedInstance.progress.asObservable()
            .subscribe(onNext: { (progress) in
                self.progressSlider.value = progress
            }).disposed(by: self.disposeBag)
        
        self.progressSlider.thumbTintColor = UIColor.red
        self.progressSlider.minimumTrackTintColor = UIColor.red
        self.progressSlider.maximumTrackTintColor = UIColor.gray
    }
    
    /// 图片旋转
    private func startRotating() {
        
        let rotationAnimation = CABasicAnimation.init(keyPath: "transform.rotation")
        rotationAnimation.fromValue = NSNumber.init(value: 0)
        rotationAnimation.toValue = NSNumber.init(value: .pi * 2.0)
        rotationAnimation.duration = 20
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = MAXFLOAT
        
        showImg.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    /// 停止旋转
    private func stopRotation() {
        showImg.layer.removeAllAnimations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 上一曲
    @IBAction func preClick(_ sender: UIButton) {
        PlayManager.sharedInstance.pre()
    }
    
    // 下一曲
    @IBAction func nextClick(_ sender: UIButton) {
        PlayManager.sharedInstance.next()
    }
    
    // 播放类型
    @IBAction func playTypeClick(_ sender: UIButton) {
        
    }
    
    // 播放/暂停
    @IBAction func playAndPauseClick(_ sender: UIButton) {
        if sender.isSelected {
            PlayManager.sharedInstance.play()
            startRotating()
        } else {
            PlayManager.sharedInstance.pause()
            stopRotation()
        }
    }
    // 拖动时间
    @IBAction func dragTime(_ sender: UISlider) {
        PlayManager.sharedInstance.seekToTime(progress: sender.value)
    }
    
    
    
    // 歌曲列表
    @IBAction func musicListClick(_ sender: UIButton) {
        hideNavigationBar()
        self.listTableView.transform = CGAffineTransform.init(translationX: 0, y: 450)
        self.listView.isHidden = false
        UIView.animate(withDuration: 0.2) {
            self.listTableView.transform = CGAffineTransform.identity
        }
    }
    
    //
    @IBAction func listViewIsHidden(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            self.listTableView.transform = CGAffineTransform.init(translationX: 0, y: 450)
        }) { (finished) in
            self.listView.isHidden = true
            self.showNavigationBar()
        }
    }
}

extension PlayViewController {
    
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

