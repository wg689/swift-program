//
//  HomeTableViewController.swift
//  NJWB
//
//  Created by 李南江 on 15/11/30.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class HomeTableViewController: VisitorTableTableViewController {

    /// 自定义转场代理对象
    var animatedDelegate = PopoverAnimatedDelegate()

    // MAKR: - 生命周期方法
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1.初始化访客视图
        if !userLogon
        {
            visitorView?.setupVisitorInfo(nil, title: "关注一些人，回这里看看有什么惊喜")
            return
        }
        
        // 2.初始化导航条
        setupNavgationItem()
    }
    /**
     程序被销毁才会执行
     */
    deinit{
        // 注销通知
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // MARK: - 内部控制方法
    private func setupNavgationItem(){
        // 1.创建左右边按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: Selector("letBtnClick"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", target: self, action: Selector("rightBtnClick"))
        
        // 2.添加标题按钮
        // 2.添加标题按钮
        let titleBtn = HomeTitleButton()
        titleBtn.setTitle("极客江南 ", forState: UIControlState.Normal)
        titleBtn.addTarget(self, action: "titleBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.titleView = titleBtn
        
        // 3..注册通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "titleBtnNotification:", name: XMGPresentedControllerNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "titleBtnNotification:", name: XMGDismissedControllerNotification, object: nil)
    }
    
    /**
     修改标题箭头指向
     */
    func titleBtnNotification(notify: NSNotification){
        guard let titleBtn = navigationItem.titleView as? HomeTitleButton else {
            return
        }
        titleBtn.selected = !titleBtn.selected
    }
    
    // MAKR: - 监听按钮点击
    @objc func titleBtnClick(btn: HomeTitleButton){
        // 1.设置按钮状态
//        btn.selected = !btn.selected
        
        // 2.创建Storyoard
        let sb = UIStoryboard(name: "FriendGroup", bundle: nil)
        let vc = sb.instantiateInitialViewController()!
        
        // 3.设置转场代理, 告诉系统谁来负责转场
        vc.transitioningDelegate = animatedDelegate
        // 4.设置转场模式
        vc.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        presentViewController(vc, animated: true, completion: nil)
    }
    
    @objc private func letBtnClick() {
        NJLog("")
    }
    @objc private func rightBtnClick() {
        NJLog("")
    }
}


