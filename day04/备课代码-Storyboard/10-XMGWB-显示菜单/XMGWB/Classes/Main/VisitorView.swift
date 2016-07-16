//
//  VisitorView.swift
//  XMGWB
//
//  Created by 李南江 on 15/9/6.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit


class VisitorView: UIView {
    
    /// 注册按钮
    @IBOutlet weak var registerBtn: UIButton!
    /// 登录按钮
    @IBOutlet weak var loginBtn: UIButton!
    
    /// 旋转视图
    @IBOutlet weak var rotationView: UIImageView!
    /// 大图标视图
    @IBOutlet weak var iconView: UIImageView!
    /// 标题视图
    @IBOutlet weak var titleView: UILabel!
    
    class func visitorView() -> VisitorView {
        return NSBundle.mainBundle().loadNibNamed("VisitorView", owner: nil, options: nil).last as! VisitorView
    }
    
    // MARK: - 外部控制方法
    func setupVisitorInfo(imageName: String?, title: String)
    {
        // 1.设置标题
        titleView.text = title
        
        // 2.判断是否是首页
        guard let name = imageName else{
            startAnimation()
            return
        }
        
        // 3.设置中间图标
        iconView.image = UIImage(named: name)
        
        // 4.隐藏转盘
        rotationView.hidden = true
    }
    
    // MAKR: - 内部控制好案发
    /// 执行转盘旋转动画
    private func startAnimation()
    {
        // 1.创建动画对象
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        
        // 2.设置动画属性
        anim.toValue = 2 * M_PI
        anim.repeatCount = MAXFLOAT
        anim.duration = 10.0
        
        // 设置动画不自动移除, 等到view销毁的时候才移除
        anim.removedOnCompletion = false
        
        // 3.将动画添加到图层上
        rotationView.layer.addAnimation(anim, forKey: nil)
    }
}
