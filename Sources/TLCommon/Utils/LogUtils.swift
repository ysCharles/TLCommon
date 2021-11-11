//
//  LogUtils.swift
//  BaseTools
//
//  Created by Charles on 20/10/2017.
//  Copyright © 2017 Charles. All rights reserved.
//

import Foundation
// MARK:- 日志
public func proLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}
