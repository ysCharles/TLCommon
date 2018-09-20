# TLCommon

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/ysCharles/TLCommon/master/LICENSE)
[![Pods Versions](https://img.shields.io/cocoapods/v/TLCommon.svg?style=flat)](http://cocoapods.org/pods/TLCommon)
[![Build Status](https://travis-ci.org/ysCharles/TLCommon.svg?branch=master)](https://travis-ci.org/ysCharles/TLCommon)
[![Swift Version Compatibility](https://img.shields.io/badge/swift4-compatible-4BC51D.svg?style=flat-square)](https://developer.apple.com/swift)
[![swiftyness](https://img.shields.io/badge/pure-swift-ff3f26.svg?style=flat)](https://swift.org/)
[![Swift Version](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)](https://swift.org)
[![GitHub stars](https://img.shields.io/github/stars/ysCharles/TLCommon.svg)](https://github.com/ysCharles/TLCommon/stargazers)



## Installation

### Manually

* clone this repo.
* Simply drop the `Sources` folder into your project.
* Enjoy！ 

### Cocoapods

`TLCommon` is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'TLCommon'
```

### Carthage

```ruby
github "ysCharles/TLCommon"
```

## Usage

* Constant

```swift
import TLCommon
// 屏幕宽度
public let SCREEN_WIDTH : CGFloat
// 屏幕高度
public let SCREEN_HEIGHT : CGFloat
// 屏幕比例
public let SCREEN_SCALE : CGFloat
// 导航条高度
public let NAV_BAR_HEIGHT: CGFloat = SCREEN_HEIGHT == 812 ? 88 : 64
// 状态栏高度
public let STATUS_BAR_HEIGHT: CGFloat = SCREEN_HEIGHT == 812 ? 44 : 20
// 是否是 iPhoneX
public let isiPhoneX : Bool

/// RGBA 颜色简便获取方法
public let RGBA: (_ red: Int,_ green: Int, _ blue: Int, _ aplpa: CGFloat) -> UIColor

/// RGB 颜色简便获取方法
public let RGB: (_ red: Int,_ green: Int, _ blue: Int) -> UIColor


```

* BaseController

  `BaseNavigationController ` 继承这个类，解决了修改`leftBarButtonItem `之后系统自带的侧滑返回功能消失的问题。

  `BaseViewController `继承这个类，override `preferredStatusBarStyle` 改变状态栏颜色

* Utils 

  * LogUtils

    ```swift
    public func proLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line)
    // eg: 
    proLog("Hello World")
    ```

    

  * SandBoxUtils 

    ```swift
    	/// 沙盒中的 Temp 路径
    	/// 该文件夹下的文件会在 app 退出后自动清除，可用于存放一次性文件
    	/// - Returns: 目录路径
    	public static func getTempPath() -> String
    
        /// 沙盒跟目录
        ///
        /// - Returns: 目录路径
        public static func getSandBoxRoot() -> String
    
        /// 沙盒Documents路径
        /// 苹果建议将程序中建立的或在程序中浏览到的文件数据保存在该目录下，iTunes备份和恢复的时候会包括此目录,如用户信息等永久性文件;
        /// - Returns: 目录路径
        public static func getDocumentPath() -> String
    
        /// 沙盒中Library路径
        /// 它包含两个文件夹 caches 和 preferences
        /// - Returns: 目录路径
        public static func getLibraryPath() -> String
    
        /// 沙盒中Library/Caches路径
        /// 存放缓存文件，iTunes不会备份此目录，此目录下文件不会在应用退出删除，如图片、视频缓存
        /// - Returns: 目录路径
        public static func getCachesPath() -> String
    
    ```

    

  * Utils

    ```swift
    public struct Utils {
        
        /// 检查是否是手机号 默认只做1开头的十一位验证
        ///
        /// - Parameters:
        ///   - mobile: 手机号
        ///   - regx: 默认nil 验证规则： "^1\\d{10}$"
        /// - Returns: true: 是 false: 否
        public static func isMobile(_ mobile: String?, regx: String? = nil) -> Bool
        
        /// 判断字符串是否为空
        ///
        /// - Parameter string: 字符串
        /// - Returns: 是否
        public static func isEmpty(string : String?) -> Bool 
        
        /// 检查是否是身份证号
        ///
        /// - Parameter idCard: 身份证号
        /// - Returns: true:是 false:不是
        public static func isIDCard(_ idCard : String?) -> Bool
        
        /// 检查是否是电子邮箱
        ///
        /// - Parameter email: 邮箱
        /// - Returns: true:是 false:不是
        public static func isEmail(_ email: String?) -> Bool 
        
        
        // MARK: - 时间 字符串 转化
        /// 转化时间字符串为 Date
        ///
        /// - Parameters:
        ///   - dateString: 时间字符串
        ///   - formatter: 时间格式
        /// - Returns: Date
        public static func date(from dateString: String, formatter: String = "yyyy-MM-dd HH:mm:ss") -> Date? 
        
        /// 格式化Date 为 String
        ///
        /// - Parameters:
        ///   - date: 时间
        ///   - formatter: 时间格式
        /// - Returns: String
        public static func format(date: Date?, formatter: String = "yyyy年MM月dd日") -> String
        
        
        // MARK:- 从 storyboard 中唤醒 viewcontroller
        /// 从 storyboard 中唤醒 viewcontroller
        ///
        /// - Parameters:
        ///   - storyboardID: viewcontroller 在 storyboard 中的 id
        ///   - fromStoryboard: storyboard 名称
        ///   - bundle: Bundle  默认为 main
        /// - Returns: UIviewcontroller
        public static func getViewController(storyboardID: String, fromStoryboard: String, bundle: Bundle? = nil) -> UIViewController
        
        // MARK:- 应用跳转
        /// 跳转到App Store，记得将 http:// 替换为 itms:// 或者 itms-apps://：  需要真机调试
        ///
        /// - Parameters:
        ///   - vc: 跳转时所在控制器
        ///   - url: url
        /// - Returns: 打开是否成功
        @discardableResult
        public static func openAppStore(vc: UIViewController, url: String) -> Bool
        
        /// 拨打电话 ,里面会判断是否需要拨打号码 外部不需要调用判断 需要真机调试
        ///
        /// - Parameters:
        ///   - vc: 拨打电话时所在的控制器
        ///   - number: 电话号码
        /// - Returns: 打开是否成功
        @discardableResult
        public static  func callPhone(number: String) -> Bool
        
        /// 打开浏览器 真机调试
        ///
        /// - Parameter url: 需要打开的 url
        /// - Returns: 打开是否成功
        @discardableResult
        public static func openBrowser(url: String) -> Bool
        
        // MARK:获取版本信息
        /// 获取 app 版本
        ///
        /// - Parameter type: 类型0 = CFBundleShortVersionString   1 = CFBundleVersion 默认获取0
        /// - Returns: 版本信息字符串
        public static func getVersion(type: Int = 0) -> String 
    ```

    

* Extension

  * String

    ```swift
    extension String {
        /// trim 去掉字符串前后的空白字符
        public func trim() -> String 
        
        /// 是否为空（trim 处理后）
        public var isEmptyByTrim: Bool 
        
        /// 是否是邮件
        public var isEmail: Bool 
    }
    ```

  * UIImage

    ```swift
    extension UIImage {
        /// 调整图像尺寸大小
        ///
        /// - Parameter size: 尺寸
        /// - Returns: UIImage
        public func resize(_ size: CGSize) -> UIImage? 
    }
    
    ```

    

  * UIView

    ```swift
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
    ```

    

* Custom View

  ```swift
  class TLTextView : UITextView {
      /// 设置占位文字
      public var placeholder: String? 
      
      /// 设置占位文字颜色
      public var placeholderColor: UIColor? 
      
      /// 设置文本字体
      public override var font: UIFont? 
      
      /// 设置文本内容
      public override var text: String! 
      
      /// 设置带样式文本内容
      public override var attributedText: NSAttributedString!
  }
  ```

  

  

  

  

## License

`TLCommon` is available under the MIT license. See the `LICENSE` file for more info.


