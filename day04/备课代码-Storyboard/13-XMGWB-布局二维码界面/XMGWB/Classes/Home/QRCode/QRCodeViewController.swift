//
//  QRCodeViewController.swift
//  Weibo
//
//  Created by xiaomage on 15/10/21.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeViewController: UIViewController {

    
    /// 容器视图
    @IBOutlet weak var containerView: UIView!
    /// 自定义UITabBar
    @IBOutlet weak var customTabbar: UITabBar!
    /// 冲击波顶部约束
    @IBOutlet weak var scanLineTopCons: NSLayoutConstraint!
    /// 容器高度
    @IBOutlet weak var containerHeightCons: NSLayoutConstraint!
    /// 冲击波
    @IBOutlet weak var scanLineView: UIImageView!

    // MARK: - 生命周期方法
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1.设置默认选中
        customTabbar.selectedItem = customTabbar.items![0]
        customTabbar.delegate = self
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
       startAnimation()
    }
    
    // MARK: - 内部控制方法
    /// 监听关闭按钮点击
    @IBAction func closeBtnClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /// 开始冲击波动画
    private func startAnimation()
    {
        
        // 1.初始化冲击波位置
        scanLineTopCons.constant = -containerHeightCons.constant
        view.layoutIfNeeded()
        
        // 2.执行动画
        UIView.animateWithDuration(1.0, animations: { () -> Void in
        
        // 告诉系统该动画需要重复
        UIView.setAnimationRepeatCount(MAXFLOAT)
        self.scanLineTopCons.constant = self.containerHeightCons.constant
        self.view.layoutIfNeeded()
        })
    }
    
}

// MAKR: - UITabBarDelegate
extension QRCodeViewController: UITabBarDelegate
{
    // 监听tabBar点击
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {

        // 1.调整容器高度
        containerHeightCons.constant = (item.tag == 0) ? 300 : 150
        view.layoutIfNeeded()
        
        // 2.先移除图层上所有的动画
        scanLineView.layer.removeAllAnimations()
        
        // 3.再重新开启动画
        startAnimation()
    }
}
