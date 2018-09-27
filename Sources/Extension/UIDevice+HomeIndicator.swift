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
            return isIphoneX || isIphoneXS || isIphoneXR || isIphoneXSMax
        }
    }
    
    
    public static var isIphoneX : Bool {
        return UIScreen.main.bounds.size == CGSize(width: 375, height: 812)
    }
    
    public static var isIphoneXS : Bool {
        return UIScreen.main.bounds.size == CGSize(width: 375, height: 812)
    }
    
    public static var isIphoneXR : Bool {
        return UIScreen.main.bounds.size == CGSize(width: 414, height: 896)
    }
    
    public static var isIphoneXSMax : Bool {
        return UIScreen.main.bounds.size == CGSize(width: 414, height: 896)
    }
}
