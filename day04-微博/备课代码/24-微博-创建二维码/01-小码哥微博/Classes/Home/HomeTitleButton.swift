//
//  TitleButton.swift
//  XMGWB
//
//  Created by 李南江 on 15/9/6.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class HomeTitleButton: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 1.设置标题颜色
        self.setTitleColor(UIColor.darkTextColor(), forState: UIControlState.Normal)
        
        // 2.设置标题字体大小
        self.titleLabel?.font = UIFont.systemFontOfSize(17)
        
        // 3.设置图标
        self.setImage(UIImage(named: "navigationbar_arrow_down"), forState: UIControlState.Normal)
        self.setImage(UIImage(named: "navigationbar_arrow_up"), forState: UIControlState.Selected)
        
        // 4.设置图片不调整
        adjustsImageWhenHighlighted = false
        
        // 5.调整按钮尺寸
        sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        /*
        // 设置偏移位
        titleLabel?.frame.offsetInPlace(dx: -imageView!.bounds.width * CGFloat(0.5), dy: 0)
        imageView?.frame.offsetInPlace(dx: titleLabel!.bounds.width * CGFloat(0.5), dy: 0)
        */
        
        // 写死坐标
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.size.width
    }
}
