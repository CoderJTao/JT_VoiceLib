//
//  UIColor+category.swift
//  JTReader
//
//  Created by jiangT on 2017/5/3.
//  Copyright © 2017年 jiangT. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    
    /// RGBA  显示颜色
    ///
    /// - Parameters:
    ///   - r: red值
    ///   - g: grenn值
    ///   - b: blue值
    ///   - a: alpha值
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    /// 用十六进制颜色创建UIColor
    ///
    /// - Parameter hexColor: 十六进制颜色 (0F0F0F)
    convenience init(hexString : String) {
        //处理数值
        var cString = hexString.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        let length = (cString as NSString).length
        //错误处理
        if (length < 6 || length > 7 || (!cString.hasPrefix("#") && length == 7)){
            //返回whiteColor
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            return
        }
        
        if cString.hasPrefix("#"){
            cString = (cString as NSString).substring(from: 1)
        }
        
        //字符chuan截取
        var range = NSRange()
        range.location = 0
        range.length = 2
        
        let rString = (cString as NSString).substring(with: range)
        
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        //存储转换后的数值
        var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0
        //进行转换
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        //根据颜色值创建UIColor
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
    
    
    ///扩展的实例方法
//    public func hexStringToColor(hexString: String) -> UIColor{
//        
//        var cString: String = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
//        
//        if cString.characters.count < 6 {
//            return UIColor.black
//        }
//        if cString.hasPrefix("0X") {
//            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 2))
//        }
//        if cString.hasPrefix("#") {
//            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 1))
//        }
//        if cString.characters.count != 6 {
//            return UIColor.black
//        }
//        
//        var range: NSRange = NSMakeRange(0, 2)
//        let rString = (cString as NSString).substring(with: range)
//        range.location = 2
//        let gString = (cString as NSString).substring(with: range)
//        range.location = 4
//        let bString = (cString as NSString).substring(with: range)
//        
//        var r: UInt32 = 0x0
//        var g: UInt32 = 0x0
//        var b: UInt32 = 0x0
//        Scanner.init(string: rString).scanHexInt32(&r)
//        Scanner.init(string: gString).scanHexInt32(&g)
//        Scanner.init(string: bString).scanHexInt32(&b)
//        
//        return UIColor(displayP3Red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(1))
//        
//    }
}
