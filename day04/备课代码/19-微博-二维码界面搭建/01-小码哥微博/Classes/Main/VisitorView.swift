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
    /// 设置默认信息
    func setupVisitorInfo(imageName: String?, title: String){
        
        // 1.设置标题
        messageLabel.text = title
        
        // 2.判断是否是首页
        // 如果图片名称为 nil，说明是首页，直接返回
        guard let imgName = imageName else {
            // 显示遮罩
            iconView.hidden = false
            // 播放动画
            startAnimation()
            return
        }
        // 3.设置提示图标
        homeIconView.image = UIImage(named: imgName)
        
        // 4.隐藏遮罩
        iconView.hidden = true
    }
    
    /// 开始转盘动画
    private func startAnimation()
    {
        // 1.创建动画
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        
        // 2.设置动画属性
        anim.toValue = 2 * M_PI
        anim.repeatCount = MAXFLOAT
        anim.duration = 20
        
        // 用在不断重复的动画上，当动画绑定的图层对应的视图被销毁，动画会自动被销毁
        anim.removedOnCompletion = false
        
        // 添加到图层
        iconView.layer.addAnimation(anim, forKey: nil)
    }
    
    // MARK: - 懒加载
    /// 背景图标
    private lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
    /// 遮罩视图
    // 注意系统有一个叫做maskView的属性, 属性名称不能叫做maskView
    private lazy var maskIconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    
    /// 小房子
    private lazy var homeIconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
    /// 消息文字
    private lazy var messageLabel: UILabel = UILabel(title: "关注一些人，回这里看看有什么惊喜")
    
    /// 注册按钮
    lazy var registerButton: UIButton = UIButton(title: "注册", color: UIColor.orangeColor(), backImageName: "common_button_white_disable")
    
    /// 登录按钮
    lazy var loginButton: UIButton = UIButton(title: "登录", color: UIColor.darkGrayColor(), backImageName: "common_button_white_disable")

}

// MAKR: - 设置UI
extension VisitorView {
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
}
