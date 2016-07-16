//
//  HomeTableViewController.swift
//  NJWB
//
//  Created by 李南江 on 15/11/30.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class HomeTableViewController: VisitorTableTableViewController {

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
    
    // MARK: - 内部控制方法
    private func setupNavgationItem(){
        // 1.创建左右边按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: Selector("letBtnClick"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", target: self, action: Selector("rightBtnClick"))
        
        // 2.添加标题按钮
        // 2.添加标题按钮
        //        let titleBtn = UIButton()
        let titleBtn = HomeTitleButton()
        titleBtn.setTitle("极客江南 ", forState: UIControlState.Normal)
        /*
        titleBtn.setImage(UIImage(named: "navigationbar_arrow_down"), forState: UIControlState.Normal)
        titleBtn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        
        titleBtn.setImage(UIImage(named: "navigationbar_arrow_up"), forState: UIControlState.Selected)
        */
        titleBtn.addTarget(self, action: "titleBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.titleView = titleBtn
    }
    
    // MAKR: - 监听按钮点击
    @objc func titleBtnClick(btn: HomeTitleButton){
        btn.selected = !btn.selected
    }
    
    @objc private func letBtnClick() {
        NJLog("")
    }
    @objc private func rightBtnClick() {
        NJLog("")
    }
}
