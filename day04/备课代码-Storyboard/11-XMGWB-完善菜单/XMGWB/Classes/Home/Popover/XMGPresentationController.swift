//
//  XMGPresentationController.swift
//  Weibo
//
//  Created by xiaomage on 15/10/21.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class XMGPresentationController: UIPresentationController {


    /*
    第一个参数:presentedViewController:  被展现的对象
    第二个参数:presentingViewController: 发起转场的对象(在Xcode6中系统传入的是nil, 在Xcode7中系统传入的是野指针)
    */
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
    
    /*
    containerView: 所有被展现的内容都放在containerView上
    presentedView(): 通过该方法就可以拿到被展现的视图
    */
    override func containerViewWillLayoutSubviews()
    {
        super.containerViewWillLayoutSubviews()

        // 1.添加蒙版
        containerView?.insertSubview(cover, atIndex: 0)
        
        // 2.设置蒙版frame
        cover.frame = containerView!.bounds
        
        // 3.调整被展现视图的大小
        presentedView()?.frame = CGRect(x: 100, y: 56, width: 200, height: 200)
    }
    
    // MARK: - 内部控制方法
    @objc private func coverClick()
    {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: -懒加载
    private lazy var cover: UIButton = {
       let customView = UIButton()
        customView.backgroundColor = UIColor(white: 0.5, alpha: 0.2)
        customView.addTarget(self, action: Selector("coverClick"), forControlEvents: UIControlEvents.TouchUpInside)
        return customView
    }()
}
