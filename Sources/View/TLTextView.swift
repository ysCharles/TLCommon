//
//  TLTextView.swift
//  BaseTools
//
//  Created by Charles on 26/10/2017.
//  Copyright © 2017 Charles. All rights reserved.
//

import UIKit

/// 自定义 TextView 带有占位文字
public class TLTextView: UITextView {
    /// 占位文字展示 label
    private var placeholderLabel: UILabel!
    
    // MARK:- 初始化
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupView()
    }
    
    public init(frame: CGRect) {
        super.init(frame: frame, textContainer: nil)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    /// left padding
    public var placeholderPaddingLeft : CGFloat = 0
    /// top padding
    public var placeholderPaddingTop : CGFloat = 0
}

extension TLTextView {
    /// 文本内容发生变化时的操作
    @objc private func textDidChange() {
        placeholderLabel.isHidden = hasText
    }
    
    private func setupView() {
        placeholderLabel = UILabel()
        placeholderLabel.backgroundColor = UIColor.clear
        placeholderLabel.numberOfLines = 0 //设置为0可以自动换行
        addSubview(placeholderLabel)
        placeholderLabel.textColor = UIColor.lightGray //默认占位文字颜色
        font = UIFont.systemFont(ofSize: 16) //默认字体
        
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: NSNotification.Name.UITextViewTextDidChange, object: self)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        let lineFragementPadding = max(textContainer.lineFragmentPadding, placeholderPaddingLeft)
        let contenInset = textContainerInset
        
        let labelX = lineFragementPadding + contenInset.left
        let labelY = max(contenInset.top, placeholderPaddingTop)
        
        let labelW = bounds.size.width - contenInset.right - labelX - lineFragementPadding
        let labelH = placeholderLabel.sizeThatFits(CGSize(width: labelW, height: CGFloat(MAXFLOAT))).height
        placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
    }
}

// MARK:- 文本属性设置
extension TLTextView {
    /// 设置占位文字
    public var placeholder: String? {
        set {
            placeholderLabel.text = newValue
            setNeedsLayout()
        }
        
        get {
            return placeholderLabel.text
        }
    }
    
    /// 设置占位文字颜色
    public var placeholderColor: UIColor? {
        set {
            placeholderLabel.textColor = newValue
        }
        
        get {
            return placeholderLabel.textColor
        }
    }
    
    /// 设置文本字体
    public override var font: UIFont? {
        get {
            return super.font
        }
        set {
            super.font = newValue
            placeholderLabel.font = newValue
            setNeedsLayout()
        }
    }
    
    /// 设置文本内容
    public override var text: String! {
        get {
            return super.text
        }
        
        set {
            super.text = newValue
            textDidChange()
        }
    }
    
    /// 设置带样式文本内容
    public override var attributedText: NSAttributedString! {
        get {
            return super.attributedText
        }
        
        set {
            super.attributedText = newValue
            textDidChange()
        }
    }
}
