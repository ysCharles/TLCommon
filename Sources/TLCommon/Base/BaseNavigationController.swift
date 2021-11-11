//
//  BaseNavigationController.swift
//  wxsmk
//
//  Created by Charles on 21/02/2017.
//  Copyright © 2017 Matrix. All rights reserved.
//

import UIKit

open class BaseNavigationController: UINavigationController {

    override open func viewDidLoad() {
        super.viewDidLoad()

        // 解决修改 leftBarButtonItem后系统自带的侧滑返回功能消失的问题
        self.interactivePopGestureRecognizer?.delegate = self
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
    
    open override var childForStatusBarHidden: UIViewController? {
        return topViewController
    }
    
}
// MARK: 解决修改 leftBarButtonItem后系统自带的侧滑返回功能消失的问题
extension BaseNavigationController: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.children.count > 1
    }
}
