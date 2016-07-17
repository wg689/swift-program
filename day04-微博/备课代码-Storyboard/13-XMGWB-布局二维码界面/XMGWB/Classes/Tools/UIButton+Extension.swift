//
//  UIButton+Extension.swift
//  XMGWB
//
//  Created by 李南江 on 15/11/5.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

extension UIButton
{
    /// 便利构造方法
    convenience init(image: String, backgroundImage: String)
    {
        self.init()
        
        // 2.设置图片
        setImage(UIImage(named: image), forState: UIControlState.Normal)
        setImage(UIImage(named: image + "_highlighted"), forState: UIControlState.Highlighted)
        // 3.设置背景图片
        setBackgroundImage(UIImage(named: backgroundImage), forState: UIControlState.Normal)
        setBackgroundImage(UIImage(named: backgroundImage + "_highlighted"), forState: UIControlState.Highlighted)
    }
}