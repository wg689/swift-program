//
//  PopoverPresentationController.swift
//  XMGWB
//
//  Created by 李南江 on 15/9/8.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class PopoverPresentationController: UIPresentationController {
    
    /**
    实例化负责转场的控制器
    
    :param: presentedViewController  被展现的控制器
    :param: presentingViewController 发起转场的控制器, xocde6是nil, xocde7是野指针
    
    :returns: 负责转场的控制器
    */
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
    
    /*
     即将布局容器视图上得子视图时调用
     containerView 容器视图, 放置展现出来的视图
     presentedView 被展现的视图
    */
    override func containerViewWillLayoutSubviews(){
        // 1.添加遮盖
//        containerView?.addSubview(coverView)
        containerView?.insertSubview(coverView, atIndex: 0)
        coverView.frame = (containerView?.frame)!
        
        // 2.调整展现视图大小
        presentedView()?.frame = CGRect(x: 100, y: 56, width: 200, height: 200)
    }
    
    /**
    关闭弹窗
    */
    func close(){
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - 懒加载
    lazy var coverView: UIView = {
        // 1.创建蒙版
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        // 2.注册监听
        let tap = UITapGestureRecognizer(target: self, action: "close")
        view.addGestureRecognizer(tap)
        return view
        }()
}
