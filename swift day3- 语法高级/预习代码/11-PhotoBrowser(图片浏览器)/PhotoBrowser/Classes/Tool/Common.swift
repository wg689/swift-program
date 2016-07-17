//
//  Common.swift
//  PhotoBrowser
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

/// 计算imageView的frame
func calculateImageViewFrame(image : UIImage) -> CGRect {
    // 1.计算imageView的frame
    let imageViewW = UIScreen.mainScreen().bounds.width
    let imageViewH = imageViewW / image.size.width * image.size.height
    let x : CGFloat = 0
    var y : CGFloat = 0
    
    // 2.判断是长图还是短图
    if imageViewH <= UIScreen.mainScreen().bounds.height {
        y = (UIScreen.mainScreen().bounds.height - imageViewH) * 0.5
    } else {
        y = 0
    }
    
    return CGRect(x: x, y: y, width: imageViewW, height: imageViewH)
}