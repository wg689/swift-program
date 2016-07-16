//
//  UILabel+Extension.swift
//  01-小码哥微博
//
//  Created by 李南江 on 16/1/22.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit


extension UILabel {
    
    /// 便利构造函数
    ///
    /// - parameter title:          title
    /// - parameter fontSize:       fontSize，默认 14 号字
    /// - parameter color:          color，默认深灰色
    /// - parameter screenInset:    相对与屏幕左右的缩紧，默认为0，局中显示，如果设置，则左对齐
    ///
    /// - returns: UILabel
    /// 参数后面的值是参数的默认值，如果不传递，就使用默认值
    convenience init(title: String,
        fontSize: CGFloat = 14,
        color: UIColor = UIColor.darkGrayColor(),
        screenInset: CGFloat = 0) {
            
            self.init()
            
            text = title
            textColor = color
            font = UIFont.systemFontOfSize(fontSize)
            numberOfLines = 0
            
            if screenInset == 0 {
                textAlignment = .Center
            } else {
                // 设置换行宽度
                preferredMaxLayoutWidth = UIScreen.mainScreen().bounds.width - 2 * screenInset
                textAlignment = .Left
            }
            
            sizeToFit()
    }
}
