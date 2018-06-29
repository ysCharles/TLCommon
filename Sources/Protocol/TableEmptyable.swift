//
//  TableEmptyable.swift
//  BaseProject
//
//  Created by Charles on 05/09/2017.
//  Copyright © 2017 Charles. All rights reserved.
//

import UIKit

public protocol TableEmptyViewDelegate : class {
    /// 提供占位view,该view将占据tableView的tableFooterView
    var placeHolderView: UIView {get}
}

// MARK: - 扩展默认实现
//extension TableEmptyViewDelegate where Self: BaseTableViewController {
//
//    public var placeHolderView: UIView {
//        get {
//            let imgView = UIImageView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64))
//
//            imgView.image = UIImage(named: "00xx")
//
//            imgView.backgroundColor = UIColor.blue
//            return imgView
//        }
//    }
//}

extension UITableView {
    
    public weak var emptyViewDelegate : TableEmptyViewDelegate? {
        set {
            objc_setAssociatedObject(self, UITableView.RunTimeKey.EmptyViewDelegateKey!, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            return objc_getAssociatedObject(self, UITableView.RunTimeKey.EmptyViewDelegateKey!) as? TableEmptyViewDelegate
        }
    }
    
    struct RunTimeKey {
        static let EmptyViewDelegateKey = UnsafeRawPointer.init(bitPattern: "EmptyViewDelegateKey".hashValue)
    }
    
    /// 列表是否为空
    private var isEmptyData: Bool {
        let sectionCount : Int = numberOfSections
        if sectionCount == 0 {
            return true
        }
        
        for section in 0 ..< sectionCount {
            if numberOfRows(inSection: section) != 0 {
                return false
            }
        }
        
        return true
    }
    
    public  func tlReloadData() {
        reloadData()
        tlCheckEmpty()
    }
    
    private func tlCheckEmpty() {
        if isEmptyData {
            if let del = emptyViewDelegate {
                tableFooterView = del.placeHolderView
            } else {
                tableFooterView = UIView()
            }
        } else {
            tableFooterView = UIView()
        }
    }
}
