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
            if #available(iOS 11.0, *) {
                if let win = UIApplication.shared.delegate?.window, let insets = win?.safeAreaInsets {
                    if insets.bottom == 34 {
                        return true
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            } else {  // iOS 11以下 不可能有 iPhone X
                return false
            }
        }
    }
}
