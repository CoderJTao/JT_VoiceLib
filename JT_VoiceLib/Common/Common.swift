//
//  Common.swift
//  JT_listenPro
//
//  Created by jiangT on 2017/9/24.
//  Copyright © 2017年 jiangT. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Moya
import RxCocoa
import Hero

let kScreenW : CGFloat = UIScreen.main.bounds.width
let kScreenH : CGFloat = UIScreen.main.bounds.height

let kAPIBaseURLString : String = "http://app.9nali.com/"

//导航栏颜色
let NavBarBgColor = UIColor(r: 212, g: 59, b: 51, a: 1)
//底部tabbar颜色
let TabBarBgColor = UIColor(r: 35, g: 35, b: 35, a: 0.8)

//cell选中颜色
let CellSelctedBackGroundColor = UIColor(r: 243, g: 243, b: 243, a: 1)

// 沙盒 Documents 文件夹路径
var DocDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]

// 缓存文件夹
let CachedFilePath = DocDir.appending("/CachedFile")

// 下载文件夹路径
let DownloadFilePath = DocDir.appending("/Download")

// MARK: - JsonModel
protocol BaseJsonModel {
    init(json: [String: Any]) throws
}
