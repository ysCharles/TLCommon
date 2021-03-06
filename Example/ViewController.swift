//
//  ViewController.swift
//  Example
//
//  Created by Charles on 2018/6/29.
//  Copyright © 2018 Charles. All rights reserved.
//

import UIKit
import TLCommon

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftBtn = UIButton(type: .custom)
        leftBtn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        leftBtn.setTitleColor(.black, for: .normal)
        leftBtn.setTitle("提交", for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        
        let textView = TLTextView(frame: CGRect(x: 0, y: 100, width: 375, height: 100))
        
        textView.font = UIFont.systemFont(ofSize: 24)
//        textView.text = "hello"
        textView.placeholder = "爱谁谁爱谁谁爱谁谁爱谁谁爱谁谁爱谁谁爱谁谁爱谁谁爱谁谁爱谁谁爱谁谁爱谁谁"
        textView.placeholderPaddingLeft = 8
        textView.placeholderPaddingTop = 10
        
        
        view.addSubview(textView)
        print("有没有home indicator: \(UIDevice.haveHomeIndicator)")
        
        print(UIScreen.main.bounds.size)
        print("isIphoneX:\(UIDevice.isIphoneX)")
        print("isIphoneXR:\(UIDevice.isIphoneXR)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

