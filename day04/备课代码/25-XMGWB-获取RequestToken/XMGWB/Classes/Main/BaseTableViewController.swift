//
//  BaseTableViewController.swift
//  XMGWB
//
//  Created by 李南江 on 15/9/6.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController, VisitorViewDelegate {
    // 定义变量保存用户是否登录
    var login:Bool = false
    var visitorView: VisitorView?
    override func loadView() {
         // 如果已经登录创建TableView, 如果没有登录创建访客视图
        login ? super.loadView() : setupVisitor()
    }
    
    /**
    创建访客视图
    */
    private func setupVisitor()
    {
        
        // 1.创建访客视图
        visitorView = VisitorView()
        visitorView?.delegate = self
        view = visitorView
        
        // 2. 设置状态栏
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: "visitorViewLogin")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Plain, target: self, action: "visitorViewRegister")
        
    }
    
    // MARK: - VisitorViewDelegate
    func visitorViewLogin() {
        print(__FUNCTION__)
        let vc = OAuthViewController()
        let nav = UINavigationController(rootViewController: vc)
        presentViewController(nav, animated: true, completion: nil)
    }
    
    func visitorViewRegister() {
        print(__FUNCTION__)
    }

}
