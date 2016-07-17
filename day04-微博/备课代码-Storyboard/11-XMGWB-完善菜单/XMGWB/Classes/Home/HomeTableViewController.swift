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
            menuVC.transitioningDelegate = self
            
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
    
    /// 记录当前是否是展现
    private var isPesented = true
}

extension HomeTableViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning
{
    // MARK: - UIViewControllerTransitioningDelegate
    /// 该方法用于返回负责转场的对象
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?
    {
        return XMGPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
    
    /// 告诉系统谁来负责转场如何出现
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPesented = true
        NSNotificationCenter.defaultCenter().postNotificationName(XMGPopoverAnimationDidShow, object: self)
        return self
    }
    
    /// 告诉系统谁来负责转场如何消失
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPesented = false
        NSNotificationCenter.defaultCenter().postNotificationName(XMGPopoverAnimationDidDismiss, object: self)
        return self
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    /// 告诉系统转场动画出现和消失需要多长时间
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
    {
        return 0.5
    }
    
    // transitionContext: 上下文, 该上下文中就包含了我们需要的所有数据
    /// 无论转场动画出现还是消失都会调用这个方法, 我们需要在这个方法中自定义转场动画的样式
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
        let duration = transitionDuration(transitionContext)
        if isPesented
        {
            // 1.拿到被展现的视图
            // 如果是展现, 那么我们需要修改toVC, 如果是消失我们需要修改formVC
            // 被展现的View
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
            
            // 注意: 一旦自定义转场这时系统就不会帮我们做任何操作, 包括将需要展示的view添加到containerview上也不会帮我们添加
            transitionContext.containerView()?.addSubview(toView)
            
            // 2.控制被展现的视图如何显示和消失
            // _ 忽略该参数
            toView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            toView.transform = CGAffineTransformMakeScale(1.0, 0.0)
            UIView.animateWithDuration(duration, animations: { () -> Void in
                toView.transform = CGAffineTransformIdentity
                }) { (_) -> Void in
                    // 注意: 如果是自定义转场, 一定要在动画执行完毕之后告诉系统动画已经执行完毕, 否则有可能引发一些未知的错误
                    transitionContext.completeTransition(true)
            }
            
        }else
        {
            let formView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            
            // 注意: 消失动画一下子就不见了的原因是因为CGFloat是不准确的
            // 想解决这个问题, 只需要将y的CGFloat的值改为一个非常小得值即可
            UIView.animateWithDuration(duration, animations: { () -> Void in
                formView?.transform = CGAffineTransformMakeScale(1.0, 0.0001)
                }, completion: { (_) -> Void in
                    // 注意: 如果是自定义转场, 一定要在动画执行完毕之后告诉系统动画已经执行完毕, 否则有可能引发一些未知的错误
                    transitionContext.completeTransition(true)
            })
        }
    }
}
