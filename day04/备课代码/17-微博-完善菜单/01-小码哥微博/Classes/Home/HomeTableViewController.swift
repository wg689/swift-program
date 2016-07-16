//
//  HomeTableViewController.swift
//  NJWB
//
//  Created by 李南江 on 15/11/30.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class HomeTableViewController: VisitorTableTableViewController {

    /// 记录当前菜单状态
    var isPresent: Bool = false
    
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
    }
    
    // MAKR: - 监听按钮点击
    @objc func titleBtnClick(btn: HomeTitleButton){
        // 1.设置按钮状态
        btn.selected = !btn.selected
        
        // 2.创建Storyoard
        let sb = UIStoryboard(name: "FriendGroup", bundle: nil)
        let vc = sb.instantiateInitialViewController()!
        
        // 3.设置转场代理, 告诉系统谁来负责转场
        vc.transitioningDelegate = self
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


// MAKR: - 自定义转场代理方法
extension HomeTableViewController: UIViewControllerTransitioningDelegate
{
    // 返回负责转场的控制器对象
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?{
        
        return PopoverPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    /**
     返回负责提供 Modal 动画对象
     */
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPresent = true
        return self
    }
    
    /**
     返回负责 dismiss 动画对象
     */
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPresent = false
        return self
    }
}

extension HomeTableViewController: UIViewControllerAnimatedTransitioning {
    /**
     返回动画时长
     
     :param: transitionContext 转场上下文, 提供了转场需要的参数
     
     :returns: 动画时长
     */
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval{
        return 0.5
    }
    
    /**
     转场动画实现函数, 一旦实现这个方法默认的转场动画会失效, 一切都由程序员提供
     
     :param: transitionContext 转场上下文, 提供了转场需要的参数
     */
    func animateTransition(transitionContext: UIViewControllerContextTransitioning){
        // 1.获取视图控制器
        /*
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        print(toVC)
        print(fromVC)
        */
        
        if isPresent
        {
            // 弹出菜单
            animateWillPresentedController(transitionContext)
            
        }else
        {
            // 移除菜单
            animateWillDismissedController(transitionContext)
            
        }
    }
    
    private func animateWillPresentedController(transitionContext: UIViewControllerContextTransitioning) {
        // 1.将toVC添加到容器视图上
        let toView =  transitionContext.viewForKey(UITransitionContextToViewKey)!
        transitionContext.containerView()?.addSubview(toView)
        
        // 2.实现动画
        // 2.1高度缩放为0
        toView.transform = CGAffineTransformMakeScale(1.0, 0.0)
        // 设置锚点
        toView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            // 2.2还原动画
            toView.transform = CGAffineTransformIdentity
            
            }) { (_) -> Void in
                // 一定要告诉系统转场动画结束
                transitionContext.completeTransition(true)
        }
    }
    private func animateWillDismissedController(transitionContext: UIViewControllerContextTransitioning) {
        
        // 1.获得fromVC
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        
        // 2.实现动画
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            // 由于CGFloat不准确, 所以需要写一个很小的数字即可
            fromView?.transform = CGAffineTransformMakeScale(1.0, 0.00001)
            }, completion: { (_) -> Void in
                // 移除视图
                fromView?.removeFromSuperview()
                // 一定要告诉系统转场动画结束
                transitionContext.completeTransition(true)
        })
    }
}

