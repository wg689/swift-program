//
//  TitleButton.swift
//  XMGWB
//
//  Created by 李南江 on 15/9/6.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class TitleButton: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 1.设置标题颜色
        self.setTitleColor(UIColor.darkTextColor(), forState: UIControlState.Normal)
        // 2.设置标题字体大小
        self.titleLabel?.font = UIFont.systemFontOfSize(17)
        // 3.设置图标
        self.setImage(UIImage(named: "navigationbar_arrow_down"), forState: UIControlState.Normal)
        self.setImage(UIImage(named: "navigationbar_arrow_up"), forState: UIControlState.Selected)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 写死坐标
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.size.width
    }
}
