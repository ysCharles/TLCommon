//
//  Constant.swift
//  TLCommon
//
//  Created by Charles on 2018/6/28.
//  Copyright © 2018 Charles. All rights reserved.
//

import UIKit

// MARK: 屏幕相关参数
public let SCREEN_WIDTH = UIScreen.main.bounds.size.width
public let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
public let SCREEN_SCALE = UIScreen.main.scale

public let STATUS_BAR_HEIGHT: CGFloat = UIDevice.statusBarHeight

public let NAV_BAR_HEIGHT: CGFloat = STATUS_BAR_HEIGHT + 44



/// RGBA 颜色简便获取方法
public let RGBA: (_ red: Int,_ green: Int, _ blue: Int, _ aplpa: CGFloat) -> UIColor = {(red: Int,green: Int, blue: Int, aplpa: CGFloat) -> UIColor in
    UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: aplpa)
}

/// RGB 颜色简便获取方法
public let RGB: (_ red: Int,_ green: Int, _ blue: Int) -> UIColor = {(red: Int,green: Int, blue: Int) -> UIColor in
    RGBA(red, green, blue, 1.0)
}
