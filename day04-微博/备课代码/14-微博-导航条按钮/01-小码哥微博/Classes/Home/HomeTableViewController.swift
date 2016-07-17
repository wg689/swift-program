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
        
        /*
        // 1.创建左边按钮
        let leftBtn = UIButton()
        leftBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        leftBtn.setImage(UIImage(named: "navigationbar_friendattention"), forState: UIControlState.Normal)
        leftBtn.setImage(UIImage(named: "navigationbar_friendattention_highlighted"), forState: UIControlState.Highlighted)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        
        // 2.创建右边按钮
        let rightBtn = UIButton()
        rightBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        rightBtn.setImage(UIImage(named: "navigationbar_pop"), forState: UIControlState.Normal)
        rightBtn.setImage(UIImage(named: "navigationbar_pop_highlighted"), forState: UIControlState.Highlighted)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        */
        
        /*
        navigationItem.leftBarButtonItem = crateBarButtonItem("navigationbar_friendattention", target: self, action: "letBtnClick")
        navigationItem.rightBarButtonItem = crateBarButtonItem("navigationbar_pop", target: self, action: "rightBtnClick")
        */
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: Selector("letBtnClick"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", target: self, action: Selector("rightBtnClick"))
    }
    
    // MARK: - 内部控制方法
    @objc private func letBtnClick() {
        NJLog("")
    }
    @objc private func rightBtnClick() {
        NJLog("")
    }
    
    private func crateBarButtonItem(imageName:String, target: AnyObject?, action: Selector) -> UIBarButtonItem
    {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        return UIBarButtonItem(customView: btn)
    }
}
