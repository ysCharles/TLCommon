//
//  UIImageExtension.swift
//  TLCommon
//
//  Created by Charles on 2018/6/28.
//  Copyright © 2018 Charles. All rights reserved.
//

import UIKit

extension UIImage {
    /// 调整图像尺寸大小
    ///
    /// - Parameter size: 尺寸
    /// - Returns: UIImage
    public func resize(_ size: CGSize) -> UIImage? {
        guard let data = UIImagePNGRepresentation(self) else { return nil }
        
        let maxPixelSize = max(size.width, size.height)
        
        guard let imageSource = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }
        
        //kCGImageSourceThumbnailMaxPixelSize为生成缩略图的大小。
        //当设置为800，如果图片本身大于800*600，则生成后图片大小为800*600，
        //如果源图片为700*500，则生成图片为800*500
        let options: [NSString: Any] = [
            kCGImageSourceThumbnailMaxPixelSize: maxPixelSize,
            kCGImageSourceCreateThumbnailFromImageAlways: true
        ]
        
        let resizedImage = CGImageSourceCreateImageAtIndex(imageSource, 0, options as CFDictionary).flatMap {
            UIImage(cgImage: $0)
        }
        
        return resizedImage
    }
}
