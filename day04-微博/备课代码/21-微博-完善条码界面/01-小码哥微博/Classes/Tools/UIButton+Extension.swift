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
    /*
    在初始化构造方法前面加上convenience就是便利构造方法
    * 便利构造方法和初始化方法的区别在于:
        * 初始化构造方法中必须能够给所有属性初始化
        * 便利构造方法不用, 因为便利构造方法依赖于初始化构造方法
    
    * 便利构造方法的作用:
        *用于快速构造一个对象, 一般用于给系统类新增快速创建方法
    */
    convenience init(image: String?, backgroundImage: String?)
    {
        // 1.利用父类构造器初始化所有属性
        self.init()
        
        // 2.设置图片
        if let imageName = image where imageName != "" {
            setImage(UIImage(named: imageName), forState: UIControlState.Normal)
            setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        }
        
        // 3.设置背景图片
        if let backgroundImageName = backgroundImage where backgroundImageName != "" {
            setBackgroundImage(UIImage(named: backgroundImageName), forState: UIControlState.Normal)
            setBackgroundImage(UIImage(named: backgroundImageName + "_highlighted"), forState: UIControlState.Highlighted)
        }
        
        // 4.调整按钮大小
        sizeToFit()
    }
    
    /// 便利构造函数
    ///
    /// - parameter title:          title
    /// - parameter color:          color
    /// - parameter backImageName:  背景图像
    ///
    /// - returns: UIButton
    convenience init(title: String, color: UIColor, backImageName: String) {
        self.init()
        
        setTitle(title, forState: .Normal)
        setTitleColor(color, forState: .Normal)
        setBackgroundImage(UIImage(named: backImageName), forState: .Normal)
        sizeToFit()
    }
}