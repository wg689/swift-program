//
//  VisitorTableTableViewController.swift
//  01-小码哥微博
//
//  Created by 李南江 on 16/1/22.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

class VisitorTableTableViewController: UITableViewController {
    /// 用户登录标记
    private var userLogon = false
    
    /// 访客视图
    var visitorView: VisitorView!
    
    // MAKR: - 生命周期方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 根据用户登录情况，决定显示的根视图
        userLogon ? super.loadView() : setupVisitorView()
    }
    
    // MAKR: - 内部控制方法
    /// 设置访客视图 - 让每一个`小`函数
    private func setupVisitorView() {
        // 替换根视图
        visitorView = VisitorView()
        view = visitorView
    }

}
