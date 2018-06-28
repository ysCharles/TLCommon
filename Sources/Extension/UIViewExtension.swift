//
//  UIViewExtension.swift
//  BaseTools
//
//  Created by Charles on 16/11/2017.
//  Copyright © 2017 Charles. All rights reserved.
//

import UIKit

public extension UIView {
    
    /// x
    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            var tempFrame = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    /// y
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            var tempFrame = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    /// height
    public var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            var tempFrame = frame
            tempFrame.size.height = newValue
            frame = tempFrame
        }
    }
    
    /// width
    public var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            var tempFrame = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    /// size
    public var size: CGSize {
        get {
            return frame.size
        }
        set {
            var tempFrame = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    /// centerX
    public var centerX: CGFloat {
        get {
            return center.x
        }
        set {
            var tempCenter = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    /// centerY
    public var centerY: CGFloat {
        get {
            return center.y
        }
        set {
            var tempCenter = center
            tempCenter.y = newValue
            center = tempCenter
        }
    }
}
