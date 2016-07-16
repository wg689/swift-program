//
//  UIBarButtonItem+Extension.swift
//  新浪微博
//
//  Created by 李南江 on 15/10/18.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

extension UIBarButtonItem
{
    convenience init(imageName:String, target: AnyObject?, action: Selector)
    {
        // 1.创建按钮
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        // 2.创建BarButtonItem
        self.init(customView:btn)
    }
}