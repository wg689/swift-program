//
//  HomeTableViewController.swift
//  XMGWB
//
//  Created by 李南江 on 15/9/6.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // 1.设置未登录界面
        if !login{
            
            visitorView?.setupVisitorInfo(true, imageName: "visitordiscover_feed_image_house", message: "关注一些人，回这里看看有什么惊喜")
        }
        // 2.初始化导航条按钮
        setupNavgationItem()
        
        // 3..注册通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "change", name: XMGPopoverAnimatorShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "change", name: XMGPopoverAnimatorDismissNotification, object: nil)
    }
    
    /**
    程序被销毁才会执行
    */
    deinit{
         // 注销通知
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func letBtnClick()
    {
        print(__FUNCTION__);
    }
    func rightBtnClick()
    {
//        print(__FUNCTION__);
        // 1.创建二维码界面
        let sb = UIStoryboard(name: "QRCodeViewController", bundle: nil)
        let qrVC = sb.instantiateInitialViewController()!
        // 2.弹出二维码界面
        presentViewController(qrVC, animated: true, completion: nil)
    }
    
    // MARK: - 内部控制方法
    /**
    初始化导航条按钮
    */
    private func setupNavgationItem()
    {
        // 1.添加左右按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem.crateBarButtonItem("navigationbar_friendattention", target: self, action: "letBtnClick")
        navigationItem.rightBarButtonItem = UIBarButtonItem.crateBarButtonItem("navigationbar_pop", target: self, action: "rightBtnClick")
        
        // 2.添加标题按钮
        let titleBtn = TitleButton()
        titleBtn.setTitle("极客江南 ", forState: UIControlState.Normal)
        titleBtn.sizeToFit()
        titleBtn.addTarget(self, action: "titleBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.titleView = titleBtn
        
    }
    
    /**
    修改标题箭头指向
    */
    func change(){
        let titleBtn = navigationItem.titleView as! TitleButton
        titleBtn.selected = !titleBtn.selected
    }
    /**
    监听标题按钮点击
    
    :param: btn 标题按钮
    */
    func titleBtnClick(btn: TitleButton)
    {
        // 1.设置按钮状态
//        btn.selected = !btn.selected
        
        // 2.创建Storyoard
        let sb = UIStoryboard(name: "FriendGroup", bundle: nil)
        let vc = sb.instantiateInitialViewController()!
        
        // 3.设置转场代理, 告诉系统谁来负责转场
        popoverAnimator.presentFrame = CGRect(x: 100, y: 56, width: 250, height: 300)
        vc.transitioningDelegate = popoverAnimator
        
        // 4.设置转场模式
        vc.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        presentViewController(vc, animated: true, completion: nil)
    }
    
    // MARK: - 懒加载
    /// 自定义转场对象
    private lazy var popoverAnimator = PopoverAnimator()
}
