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
    
    // MARK: - show custom navigation back button
    func showNavigationBackButton() {
        self.navigationItem.hidesBackButton = true
        
//        let item = UIBarButtonItem(image: UIImage(named: "Back"), style: .plain, target: self, action: #selector(onNavigationBackPressed(_:)))
//        self.navigationItem.leftBarButtonItem = item
//        item.accessibilityIdentifier = "Navigation_UIBarButtonItem_back"
    }
    
    @objc func onNavigationBackPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
