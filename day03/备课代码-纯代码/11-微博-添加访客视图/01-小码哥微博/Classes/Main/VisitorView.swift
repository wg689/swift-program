//
//  VisitorView.swift
//  01-小码哥微博
//
//  Created by 李南江 on 16/1/22.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit
import SnapKit

class VisitorView: UIView {

    // MAKR: - 生命周期方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 初始化UI
        setupUI()
    }
    
    // 必须重写这个方法, Swift推荐我们要么支持纯代码, 要么支持XIB
    // 这样可以简化代码的复杂度
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MAKR: - 内部控制方法
    private func setupUI() {
        // 1. 添加控件
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(homeIconView)
        addSubview(messageLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        // 2.布局子控件
        // 2. 设置自动布局
        // 1> 图标
        // make 理解为要添加的约束对象
        iconView.snp_makeConstraints { (make) -> Void in
            // 指定 centerX 属性 等于 `参照对象`.`snp_`参照属性值
            // offset 就是指定相对视图约束的偏移量
            make.centerX.equalTo(self.snp_centerX)
            make.centerY.equalTo(self.snp_centerY).offset(-60)
        }
        
        // 2> 小房子
        homeIconView.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(iconView.snp_center)
        }
        
        // 3> 消息文字
        messageLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(iconView.snp_centerX)
            make.top.equalTo(iconView.snp_bottom).offset(16)
            make.width.equalTo(224)
            make.height.equalTo(36)
        }
        
        // 4> 注册按钮
        registerButton.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(messageLabel.snp_left)
            make.top.equalTo(messageLabel.snp_bottom).offset(16)
            make.width.equalTo(100)
            make.height.equalTo(36)
        }
        
        // 5> 登录按钮
        loginButton.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(messageLabel.snp_right)
            make.top.equalTo(registerButton.snp_top)
            make.width.equalTo(registerButton.snp_width)
            make.height.equalTo(registerButton.snp_height)
        }
        
        // 6. 遮罩图像
        maskIconView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_top)
            make.left.equalTo(self.snp_left)
            make.right.equalTo(self.snp_right)
            make.bottom.equalTo(registerButton.snp_bottom)
        }
        
        // 设置背景颜色 - 灰度图 R = G = B，在 UI 元素中，大多数都使用灰度图，或者纯色图(安全色)
        backgroundColor = UIColor(white: 237.0 / 255.0, alpha: 1.0)
    }
    
    // MARK: - 懒加载
    /// 背景图标
    private lazy var iconView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return iv
    }()
    
    /// 遮罩视图
    // 注意系统有一个叫做maskView的属性, 属性名称不能叫做maskView
    private lazy var maskIconView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return iv
    }()
    
    /// 小房子
    private lazy var homeIconView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return iv
    }()
    
    /// 消息文字
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "关注一些人，回这里看看有什么惊喜"
        label.textColor = UIColor.darkGrayColor()
        label.font = UIFont.systemFontOfSize(14)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    /// 注册按钮
    private lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("注册", forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        return btn
    }()
    
    /// 登录按钮
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("登录", forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        return btn
    }()

}
