//
//  Utils.swift
//  smk
//
//  Created by Charles on 23/02/2017.
//  Copyright © 2017 Matrix. All rights reserved.
//

import UIKit
import StoreKit

public struct Utils {
    
    /// 检查是否是手机号 默认只做1开头的十一位验证
    ///
    /// - Parameters:
    ///   - mobile: 手机号
    ///   - regx: 默认nil 验证规则： "^1\\d{10}$"
    /// - Returns: true: 是 false: 否
    public static func isMobile(_ mobile: String?, regx: String? = nil) -> Bool {
        guard let m = mobile else {
            return false
        }
        
        let reg = regx ?? "^1\\d{10}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reg)
        return predicate.evaluate(with:m)
    }
    
    /// 判断字符串是否为空
    ///
    /// - Parameter string: 字符串
    /// - Returns: 是否
    public static func isEmpty(string : String?) -> Bool {
        guard let str = string else {
            return true
        }
        
        if str.count > 0 {
            return false
        }
        return true
    }
    
    /// 检查是否是身份证号
    ///
    /// - Parameter idCard: 身份证号
    /// - Returns: true:是 false:不是
    public static func isIDCard(_ idCard : String?) -> Bool {
        guard let id = idCard else {
            return false
        }
        return id.uppercased().validateIDCardNumber()
    }
    
    /// 检查是否是电子邮箱
    ///
    /// - Parameter email: 邮箱
    /// - Returns: true:是 false:不是
    public static func isEmail(_ email: String?) -> Bool {
        guard let e = email else {
            return false
        }
        
        return e.isEmail
    }
    
    
    // MARK: - 时间 字符串 转化
    /// 转化时间字符串为 Date
    ///
    /// - Parameters:
    ///   - dateString: 时间字符串
    ///   - formatter: 时间格式
    /// - Returns: Date
    public static func date(from dateString: String, formatter: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let f = DateFormatter()
        f.dateFormat = formatter
        return f.date(from: dateString)
    }
    
    /// 格式化Date 为 String
    ///
    /// - Parameters:
    ///   - date: 时间
    ///   - formatter: 时间格式
    /// - Returns: String
    public static func format(date: Date?, formatter: String = "yyyy年MM月dd日") -> String {
        guard let d = date else { return "" }
        
        let f = DateFormatter()
        f.dateFormat = formatter
        return f.string(from: d)
    }
    
    
    // MARK:- 从 storyboard 中唤醒 viewcontroller
    /// 从 storyboard 中唤醒 viewcontroller
    ///
    /// - Parameters:
    ///   - storyboardID: viewcontroller 在 storyboard 中的 id
    ///   - fromStoryboard: storyboard 名称
    ///   - bundle: Bundle  默认为 main
    /// - Returns: UIviewcontroller
    public static func getViewController(storyboardID: String, fromStoryboard: String, bundle: Bundle? = nil) -> UIViewController {
        let sBundle = bundle ?? Bundle.main
        let story = UIStoryboard(name: fromStoryboard, bundle: sBundle)
        return story.instantiateViewController(withIdentifier: storyboardID)
    }
    
    // MARK:- 应用跳转
    /// 跳转到App Store，记得将 http:// 替换为 itms:// 或者 itms-apps://：  需要真机调试
    ///
    /// - Parameters:
    ///   - vc: 跳转时所在控制器
    ///   - url: url
    /// - Returns: 打开是否成功
    @discardableResult
    public static func openAppStore(vc: UIViewController, url: String) -> Bool {
        //在 url 内查找 appid
        if let number = url.range(of: "[0-9]{9}",options: String.CompareOptions.regularExpression) {
            let appId = String(url[number])
            let productView = SKStoreProductViewController()
            //productView.delegate = vc
            productView.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier : appId], completionBlock: { (result, error) in
                if !result {
                    //点击取消
                    productView.dismiss(animated: true, completion: nil)
                }
            })
            vc.showDetailViewController(productView, sender: vc)
            return true
        } else {
            return openBrowser(url: url)
        }
    }
    
    /// 拨打电话 ,里面会判断是否需要拨打号码 外部不需要调用判断 需要真机调试
    ///
    /// - Parameters:
    ///   - vc: 拨打电话时所在的控制器
    ///   - number: 电话号码
    /// - Returns: 打开是否成功
    @discardableResult
    public static  func callPhone(number: String) -> Bool {
        
        guard let telUrl = String(format: "tel:%@", number).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
            let url = URL(string: telUrl) else {
                return false
        }
        
        if !UIApplication.shared.canOpenURL(url) {
            return false
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
        
        return true
    }
    
    /// 打开浏览器 真机调试
    ///
    /// - Parameter url: 需要打开的 url
    /// - Returns: 打开是否成功
    @discardableResult
    public static func openBrowser(url: String) -> Bool {
        if let u = URL(string: url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(u)
            } else {
                UIApplication.shared.openURL(u)
            }
            return true
        } else {
            return false
        }
    }
    
    // MARK:获取版本信息
    /// 获取 app 版本
    ///
    /// - Parameter type: 类型0 = CFBundleShortVersionString   1 = CFBundleVersion 默认获取0
    /// - Returns: 版本信息字符串
    public static func getVersion(type: Int = 0) -> String {
        let infoDictionary = Bundle.main.infoDictionary
        var version: String = ""
        if type == 0 {
            let majorVersion: AnyObject? = infoDictionary!["CFBundleShortVersionString"] as AnyObject?
            version = majorVersion as! String
        }
        if type == 1 {
            let majorVersion: AnyObject? = infoDictionary!["CFBundleVersion"] as AnyObject?
            version = majorVersion as! String
        }
        return version
    }
}
