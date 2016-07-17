//
//  UIImage+Extension.swift
//  XMGWB
//
//  Created by 李南江 on 15/11/9.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

typealias MyCIImage = CIImage
extension UIImage
{
    func detectorQRCode() -> [String]
    {
        // 1.创建CIImage
        let ciImage = MyCIImage(image: self)!
        
        // 2.创建探测器
        let dict = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: dict)
        // 3.检查图片特性
        let features = detector.featuresInImage(ciImage)
        // 4.取出结果
        var arrM = [String]()
        for obj in features {
            let res = (obj as! CIQRCodeFeature).messageString
            arrM.append(res)
        }
        return arrM
    }
}
