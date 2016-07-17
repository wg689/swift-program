//
//  BaseTableViewController.swift
//  XMGWB
//
//  Created by 李南江 on 15/9/6.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    /// 记录用户是否登录
    var login:Bool = true
    
    /// 自定义访客视图
    var visitorView: VisitorView?
    
    override func loadView() {
         // 如果已经登录创建TableView, 如果没有登录创建访客视图
        login ? super.loadView() : setupVisitor()
    }
    
    /// 创建访客视图
    private func setupVisitor()
    {
        // 1.创建访客视图
        visitorView = VisitorView.visitorView()
        view = visitorView
        
        // 2.监听访客视图按钮的点击
        visitorView?.registerBtn.addTarget(self, action: Selector("registerDidClick"), forControlEvents: UIControlEvents.TouchUpInside)
        visitorView?.loginBtn.addTarget(self, action: Selector("loginDidClick"), forControlEvents: UIControlEvents.TouchUpInside)
        
        // 3.添加导航条注册登录按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("registerDidClick"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("loginDidClick"))
        
    }
    /// 监听注册按钮点击
    @objc private func registerDidClick()
    {
        print(__FUNCTION__)
    }
    
    /// 监听登录按钮点击
    @objc private func loginDidClick()
    {
       print(__FUNCTION__)
        let sb = UIStoryboard(name: "OAuthViewController", bundle: nil)
        let OAuthVc = sb.instantiateInitialViewController()!
        
        presentViewController(OAuthVc, animated: true, completion: nil)
    }

}
