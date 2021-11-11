//
//  BaseViewController.swift
//  wxsmk
//
//  Created by Charles on 21/02/2017.
//  Copyright © 2017 Matrix. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {

        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc open func popBack() {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        }
    }

}
