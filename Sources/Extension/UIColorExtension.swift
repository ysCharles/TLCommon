//
//  UIColorExtension.swift
//  wxsmk
//
//  Created by Charles on 21/02/2017.
//  Copyright © 2017 Matrix. All rights reserved.
//

import UIKit
extension UIColor {
    
    /// 16进制数字格式颜色转换成颜色
    ///
    /// - Parameter hex: 16进制数字 例如： 0xff0000 0xff00 0x3A
    /// - Returns: UIColor
    class public func color(hex: Int) -> UIColor {
        return color(hex: hex, alpha: 1.0)
    }
    
    /// 16进制数字格式颜色转换成颜色(透明度)
    ///
    /// - Parameters:
    ///   - hex: 16进制数字 例如： 0xff0000 0xff00 0x3A
    ///   - alpha: 透明度
    /// - Returns: UIColor
    class public func color(hex:Int, alpha: CGFloat) -> UIColor {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0xFF) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// 16进制字符串格式颜色转化成颜色(透明度)
    ///
    /// - Parameters:
    ///   - hexString: 16进制字符串格式颜色
    ///   - alpha: 透明度
    /// - Returns:  UIColor
    class public func color(hexString: String, alpha:CGFloat) -> UIColor {
        //删除字符串中的空格
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        //string should be 6 or 8 characters
        if cString.count < 6 {
            return UIColor.clear
        }
        
        //如果是0x 开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
        if cString.hasPrefix("0X") {
            cString = (cString as NSString).substring(from: 2)
        }
        
        //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
        if cString.hasPrefix("#") {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if cString.count != 6 {
            return UIColor.clear
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
    
    /// 16进制字符串格式颜色转化成颜色
    ///
    /// - Parameter hexString: 16进制字符串格式颜色
    /// - Returns:  UIColor
    class public func color(hexString: String) -> UIColor {
        return color(hexString: hexString, alpha: 1.0)
    }
}
