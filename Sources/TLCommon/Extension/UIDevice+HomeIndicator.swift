//
//  UIDevice+HomeIndicator.swift
//  TLCommon
//
//  Created by Charles on 2018/9/19.
//  Copyright © 2018 Charles. All rights reserved.
//

import UIKit

extension UIDevice {
    public static var haveHomeIndicator : Bool {
        get {
            var isHave = false
            
            if #available(iOS 11.0, *) { //  11 以下的系统  没有刘海 从 iOS11开始有刘海
                print("safeAreaInsets", UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets.zero)
                isHave = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0 > 0
            }
            return isHave
        }
    }
    
    
    /// 状态栏高度  - 顶部安全距离就是状态栏高度
    public static var statusBarHeight: CGFloat {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20
        }

        return 20
    }
    
//    public static var isIphoneX : Bool {
//        return UIScreen.main.bounds.size == CGSize(width: 375, height: 812)
//    }
//    
//    public static var isIphoneXS : Bool {
//        return UIScreen.main.bounds.size == CGSize(width: 375, height: 812)
//    }
//    
//    public static var isIphoneXR : Bool {
//        return UIScreen.main.bounds.size == CGSize(width: 414, height: 896)
//    }
//    
//    public static var isIphoneXSMax : Bool {
//        return UIScreen.main.bounds.size == CGSize(width: 414, height: 896)
//    }
}

