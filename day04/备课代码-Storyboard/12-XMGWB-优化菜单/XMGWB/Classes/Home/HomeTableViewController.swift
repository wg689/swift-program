//
//  HomeTableViewController.swift
//  XMGWB
//
//  Created by 李南江 on 15/9/6.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.判断是否登录
        if !login{
            visitorView?.setupVisitorInfo(nil, title: "关注一些人，回这里看看有什么惊喜")
            return
        }
        
        // 2.初始化导航条按钮
        setupNavgationItem()
    }
    
    // MARK: - 内部控制方法
    /// 初始化导航条按钮
    private func setupNavgationItem()
    {
        // 1.添加左右按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: Selector("leftBtnClick"))
        navigationItem.rightBarButtonItem =  UIBarButtonItem(imageName: "navigationbar_pop", target: self, action: Selector("rigthBtnClick"))
        
        // 2.添加标题按钮
        let titleBtn = TitleButton()
        titleBtn.setTitle("极客江南 ", forState: UIControlState.Normal)
        titleBtn.sizeToFit()
        titleBtn.addTarget(self, action: "titleBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.titleView = titleBtn
        
    }
    
    /// 监听标题按钮点击
    func titleBtnClick(btn: TitleButton){
        btn.selected = !btn.selected
        
        // 1.创建菜单
        let sb = UIStoryboard(name: "PopoverViewController", bundle: nil)
        
        if let menuVC = sb.instantiateInitialViewController()
        {
            // 2.1设置负责自定义转场的代理
            menuVC.transitioningDelegate = popoverAnimationManager
            
            // 2.2设置转场的样式
            menuVC.modalPresentationStyle  = UIModalPresentationStyle.Custom
            
            // 3.弹出菜单
            presentViewController(menuVC, animated: true, completion: nil)
        }
    }
    
    /// 监听左边按钮点击
    @objc private func leftBtnClick()
    {
        print(__FUNCTION__)
    }
    
    /// 监听二维码按钮点击
    @objc private func rigthBtnClick()
    {
       print(__FUNCTION__)
    }
    
    // MARK: - 懒加载
    /// 自定义转场管理者
    private lazy var popoverAnimationManager: PopoverAnimationManager = {
        let manager = PopoverAnimationManager()
        manager.presentedViewFrame = CGRect(x: 100, y: 56, width: 200, height: 200)
        return manager
    }()
}
