//
//  AppDelegate.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/7.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static let playBtn = UIButton(frame: CGRect(x: kScreenW-45, y: kScreenH-100, width: 40, height: 40))
    
    static let sharedInstance = AppDelegate()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setUpPlayBtn()
        
        
        let bar = UITabBar.appearance()
        bar.barTintColor = UIColor.white
        
        return true
    }
    
    // MARK: - 设置悬浮按钮
    func setUpPlayBtn() {
        AppDelegate.playBtn.setImage(UIImage(named: "音符"), for: .normal)
        
        AppDelegate.playBtn.addTarget(self, action: #selector(playBtnClick(_:)), for: .touchUpInside)
        
        self.window?.rootViewController?.view.addSubview(AppDelegate.playBtn)
        self.window?.rootViewController?.view.bringSubview(toFront: AppDelegate.playBtn)
    }
    func hidePlayBtn() {
        AppDelegate.playBtn.isHidden = true
    }
    func showPlayBtn() {
        AppDelegate.playBtn.isHidden = false
    }
    
    @objc func playBtnClick(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Play", bundle: Bundle.main)
        if let pushController = storyboard.instantiateViewController(withIdentifier: "PlayViewController") as? PlayViewController {
            let tab = self.window?.rootViewController as? UITabBarController
            let nav = tab?.viewControllers![(tab?.selectedIndex)!] as? UINavigationController
            nav?.pushViewController(pushController, animated: true)
        }
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

