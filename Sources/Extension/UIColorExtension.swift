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

public enum UIGradientStyle {
    case left2Right
    case radial //雷达
    case top2Bottom
    case diagonal //斜线
}

extension UIColor {
    static public func gradient(style: UIGradientStyle = .left2Right, frame: CGRect, colors: [UIColor]) -> UIColor? {
        let backgroundGradientLayer = CAGradientLayer()
        backgroundGradientLayer.frame = frame
        
        var cgColors = [CGColor]()
        for color in colors {
            cgColors.append(color.cgColor)
        }
        
        switch style {
        case .left2Right:
            backgroundGradientLayer.colors = cgColors
            backgroundGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            backgroundGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
            
            //Convert our CALayer to a UIImage object
            UIGraphicsBeginImageContextWithOptions(frame.size, false, UIScreen.main.scale)
            guard let context = UIGraphicsGetCurrentContext() else {
                return nil
            }
            backgroundGradientLayer.render(in: context)
            guard let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext() else {
                return nil
            }
            UIGraphicsEndImageContext()
            return UIColor(patternImage: backgroundColorImage)
            
        case .radial:
            UIGraphicsBeginImageContextWithOptions(frame.size, false, UIScreen.main.scale)
            
            let locations: [CGFloat] = [0, 1]
            
            //Default to the RGB Colorspace
            let myColorspace = CGColorSpaceCreateDeviceRGB()
            //Create our Gradient
            guard let myGradient = CGGradient(colorsSpace: myColorspace, colors: cgColors as CFArray, locations: locations) else {
                return nil
            }
            
            let myCentrePoint = CGPoint(x: 0.5 * frame.size.width, y: 0.5 * frame.size.height)
            
            let myRadius = min(frame.size.width, frame.size.height) * 0.5
            
            // Draw our Gradient
            guard let context = UIGraphicsGetCurrentContext() else {
                return nil
            }
            context.drawRadialGradient(myGradient, startCenter: myCentrePoint, startRadius: 0, endCenter: myCentrePoint, endRadius: myRadius, options: CGGradientDrawingOptions.drawsAfterEndLocation)
            
            guard let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext() else {
                return nil
            }
            
            UIGraphicsEndImageContext()
            
            return UIColor(patternImage: backgroundColorImage)
            
        case .diagonal:
            //Set out gradient's colors
            backgroundGradientLayer.colors = cgColors;
            
            //Specify the direction our gradient will take
            backgroundGradientLayer.startPoint = CGPoint(x: 0, y: 1)
            backgroundGradientLayer.endPoint = CGPoint(x: 1, y: 0)
            
            //Convert our CALayer to a UIImage object
            UIGraphicsBeginImageContextWithOptions(frame.size, false, UIScreen.main.scale)
            guard let context = UIGraphicsGetCurrentContext() else {
                return nil
            }
            backgroundGradientLayer.render(in: context)
            guard let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext() else {
                return nil
            }
            UIGraphicsEndImageContext()
            return UIColor(patternImage: backgroundColorImage)
            
        case .top2Bottom:
            //Set out gradient's colors
            backgroundGradientLayer.colors = cgColors;
            
            //Specify the direction our gradient will take
            backgroundGradientLayer.startPoint = CGPoint(x: 0, y: 0)
            backgroundGradientLayer.endPoint = CGPoint(x: 0, y: 1)
            
            //Convert our CALayer to a UIImage object
            UIGraphicsBeginImageContextWithOptions(frame.size, false, UIScreen.main.scale)
            guard let context = UIGraphicsGetCurrentContext() else {
                return nil
            }
            backgroundGradientLayer.render(in: context)
            guard let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext() else {
                return nil
            }
            UIGraphicsEndImageContext()
            return UIColor(patternImage: backgroundColorImage)
        }
    }
    
    
    ///  水平线性渐变
    ///
    /// - Parameters:
    ///   - size: 渐变大小
    ///   - colors: 渐变色
    ///   - locations: 渐变位置
    /// - Returns: UIColor
    static func lineGradient(size: CGSize, colors: [UIColor], locations: [CGFloat]) -> UIColor? {
        // Turn the colors into CGColors
        let cgcolors = colors.map { $0.cgColor }
        
        // Begin the graphics context
        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
        
        // If no context was retrieved, then it failed
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        // From now on, the context gets ended if any return happens
        defer { UIGraphicsEndImageContext() }
        
        // Create the Coregraphics gradient
        var locations = locations
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: cgcolors as NSArray as CFArray, locations: &locations) else { return nil }
        
        // Draw the gradient
        context.drawLinearGradient(gradient, start: CGPoint(x: 0.0, y: size.height), end: CGPoint(x: size.width, y: 0.0), options: [])
        
        // Generate the image (the defer takes care of closing the context)
        guard let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        
        return UIColor(patternImage: backgroundColorImage)
    }
}
