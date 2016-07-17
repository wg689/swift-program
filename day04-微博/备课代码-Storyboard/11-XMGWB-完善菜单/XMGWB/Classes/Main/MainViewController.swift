//
//  MainViewController.swift
//  XMGWB
//
//  Created by 李南江 on 15/9/6.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // 初始化加号按钮
        setupComposeBtn()
    }
    
    // MAKR: - 内部控制方法
    ///  监听加号按钮点击
    @objc private func composeBtnClick(){
        print(__FUNCTION__)
    }
    
    /// 设置加号按钮位置
    private func setupComposeBtn(){
        
        // 0.添加到tabBar上
        tabBar.addSubview(composeBtn)
        // 1.计算按钮宽度
        let width = tabBar.bounds.width / CGFloat(viewControllers!.count)
        // 2.创建按钮frame
        let rect = CGRect(x: 0, y: 0, width: width, height: tabBar.bounds.height)
        // 3.设置按钮frame和偏移位
        composeBtn.frame = CGRectOffset(rect, width * 2, 0)
    }
    
    // MARK: - 懒加载
    /// 加号按钮
    private lazy var composeBtn:UIButton = {
        // 1.创建按钮
        let button = UIButton(image: "tabbar_compose_icon_add", backgroundImage: "tabbar_compose_button")
        // 2.监听加号按钮点击
        button.addTarget(self, action: "composeBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        
        // 3.返回按钮
        return button
    }()
}
