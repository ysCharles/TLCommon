//
//  StringExtension.swift
//  TLCommon
//
//  Created by Charles on 2018/6/28.
//  Copyright © 2018 Charles. All rights reserved.
//

import Foundation
//import CommonCrypto

extension String {
    /// trim 去掉字符串前后的空白字符
    public func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// 是否为空（trim 处理后）
    public var isEmptyByTrim: Bool {
        return trim().isEmpty
    }
    
    /// 是否是邮件
    public var isEmail: Bool {
        if let _ = trim().range(of: "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$", options: .regularExpression, range: nil, locale: nil) {
            return true
        }
        return false
    }
}
