//
//  SandBoxUtils.swift
//  BaseTools
//
//  Created by Charles on 09/11/2017.
//  Copyright © 2017 Charles. All rights reserved.
//

import Foundation

/// 沙盒路径工具
public struct SandBoxUtils {
    /// 沙盒中的 Temp 路径
    /// 该文件夹下的文件会在 app 退出后自动清除，可用于存放一次性文件
    /// - Returns: 目录路径
    public static func getTempPath() -> String {
        return NSTemporaryDirectory()
    }
    
    /// 沙盒跟目录
    ///
    /// - Returns: 目录路径
    public static func getSandBoxRoot() -> String {
        return NSHomeDirectory()
    }
    
    /// 沙盒Documents路径
    /// 苹果建议将程序中建立的或在程序中浏览到的文件数据保存在该目录下，iTunes备份和恢复的时候会包括此目录,如用户信息等永久性文件;
    /// - Returns: 目录路径
    public static func getDocumentPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        return paths.last!
    }
    
    /// 沙盒中Library路径
    /// 它包含两个文件夹 caches 和 preferences
    /// - Returns: 目录路径
    public static func getLibraryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        return paths.last!
    }
    
    /// 沙盒中Library/Caches路径
    /// 存放缓存文件，iTunes不会备份此目录，此目录下文件不会在应用退出删除，如图片、视频缓存
    /// - Returns: 目录路径
    public static func getCachesPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        return paths.last!
    }
    
}
