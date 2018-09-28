# TLCommon

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/ysCharles/TLCommon/master/LICENSE)
[![Pods Versions](https://img.shields.io/cocoapods/v/TLCommon.svg?style=flat)](http://cocoapods.org/pods/TLCommon)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/TLCommon.svg?style=flat)](https://github.com/ysCharles/TLCommon)
[![Build Status](https://travis-ci.org/ysCharles/TLCommon.svg?branch=master)](https://travis-ci.org/ysCharles/TLCommon)
[![Swift Version Compatibility](https://img.shields.io/badge/swift4-compatible-4BC51D.svg?style=flat)](https://developer.apple.com/swift)
[![swiftyness](https://img.shields.io/badge/pure-swift-ff3f26.svg?style=flat)](https://swift.org/)
[![Swift Version](https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat)](https://swift.org)
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
public let ST
