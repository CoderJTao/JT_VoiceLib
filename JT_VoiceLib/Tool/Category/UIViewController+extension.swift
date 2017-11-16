//
//  UIViewController+extension.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/8.
//  Copyright © 2017年 江涛. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    // MARK: - hide navigation bar hair line
    func hideNavigationBarHairLine() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    // MARK: - hide navigation bar
    func hideNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    // MARK: - show navigation bar
    func showNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - hide tabbar
    func hideTabbar() {
        self.tabBarController?.tabBar.isHidden = true
    }
    // MARK: - show tabbar
    func showTabbar() {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - show custom navigation back button
    func showNavigationBackButton() {
        self.navigationItem.hidesBackButton = true
        
        let item = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(onNavigationBackPressed(_:)))
        self.navigationItem.leftBarButtonItem = item
    }
    
    @objc func onNavigationBackPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    // MARK: - show custom navigation library button
    func showNavigationLibraryButton() {
        let item = UIBarButtonItem(title: "音库", style: UIBarButtonItemStyle.plain, target: self, action: #selector(onNavigationLibraryPressed(_:)))
        self.navigationItem.rightBarButtonItem = item
    }
    
    @objc func onNavigationLibraryPressed(_ sender: Any) {
        let vc = LibraryViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
