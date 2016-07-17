//
//  UIButton-Extension.swift
//  PhotoBrowser
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(title : String, bgColor : UIColor, fontSize : CGFloat) {
        self.init()
        
        setTitle(title, forState: .Normal)
        backgroundColor = bgColor
        titleLabel?.font = UIFont.systemFontOfSize(fontSize)
    }
}
