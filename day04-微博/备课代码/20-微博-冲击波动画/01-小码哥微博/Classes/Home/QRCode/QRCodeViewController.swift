//
//  QRCodeViewController.swift
//  XMGWB
//
//  Created by 李南江 on 15/9/8.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController {
    // 底部视图
    @IBOutlet weak var customTabBar: UITabBar!
    // 容器视图高度
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    // 容器视图宽度
    @IBOutlet weak var containerWidth: NSLayoutConstraint!
    // 冲击波顶部约束
    @IBOutlet weak var scanlineCons: NSLayoutConstraint!
    
    /**
    关闭按钮监听
    */
    @IBAction func closeItemClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.设置默认选中第1项
        customTabBar.selectedItem = customTabBar.items![0]
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        startAnimation()
    }
    
    private func startAnimation(){
        
        // 1.重新设置冲击波顶部约束
        // 一定要加上这一句, 否则会混乱
        scanlineCons.constant = -containerHeight.constant
        view.layoutIfNeeded()
        
        UIView.animateWithDuration(2.0) { () -> Void in
            // 0.设置动画重复次数
            UIView.setAnimationRepeatCount(MAXFLOAT)
            // 1.修改约束
            self.scanlineCons.constant = self.containerHeight.constant
            // 2.执行动画
            self.view.layoutIfNeeded()
        }
    }
}
