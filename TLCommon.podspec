#
#  Be sure to run `pod spec lint TLCommon.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "TLCommon"
  s.version      = "0.3"
  s.summary      = "Common组件，包含常用方法，常用 Extension，常量等"

  s.homepage     = "https://github.com/ysCharles/TLCommon"

  s.license      = "MIT"

  s.author       = { "Charles" => "ystanglei@gmail.com" }

  s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/ysCharles/TLCommon.git", :tag => "#{s.version}" }


  s.source_files  = "Sources/**/*.swift"

  s.frameworks = "UIKit", "StoreKit"
  s.swift_version = '4.1'
end
