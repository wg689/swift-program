//
//  PopoverAnimator.swift
//  XMGWB
//
//  Created by 李南江 on 15/9/8.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit
/// 在类的外面写的常量或者变量就是全局能够访问的
let XMGPopoverAnimatorShowNotification = "XMGPopoverAnimatorShowNotification"
let XMGPopoverAnimatorDismissNotification = "XMGPopoverAnimatorDismissNotification"

class PopoverAnimator: NSObject , UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning
{
    /// 记录是否弹出
    private var isPresent: Bool = false
    // 记录菜单大小
    var presentFrame = CGRectZero
    
    // MARK: - UIViewControllerTransitioningDelegate
    // 返回负责转场的控制器对象
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?{
        let pc = PopoverPresentationController(presentedViewController: presented, presentingViewController: presenting)
        pc.presentFrame = presentFrame
        return pc
    }
    
    /**
    返回负责提供 Modal 动画对象
    */
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPresent = true
        NSNotificationCenter.defaultCenter().postNotificationName(XMGPopoverAnimatorShowNotification, object: self)
        return self
    }
    
    /**
    返回负责 dismiss 动画对象
    */
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPresent = false
        NSNotificationCenter.defaultCenter().postNotificationName(XMGPopoverAnimatorDismissNotification, object: self)
        return self
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
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
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        print(toVC)
        print(fromVC)
        
        if isPresent
        {
            
            // 2.将toVC添加到容器视图上
            let toView =  transitionContext.viewForKey(UITransitionContextToViewKey)!
            transitionContext.containerView()?.addSubview(toView)
            
            // 3.实现动画
            // 3.1高度缩放为0
            toView.transform = CGAffineTransformMakeScale(1.0, 0.0)
            // 设置锚点
            toView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                // 3.2还原动画
                toView.transform = CGAffineTransformIdentity
                
                }) { (_) -> Void in
                    // 一定要告诉系统转场动画结束
                    transitionContext.completeTransition(true)
            }
        }else
        {
            // 2.获得fromVC
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            
            // 3.实现动画
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                // 由于CGFloat不准确, 所以需要写一个很小的数字即可
                fromView?.transform = CGAffineTransformMakeScale(1.0, 0.00001)
                }, completion: { (_) -> Void in
                    // 一定要告诉系统转场动画结束
                    transitionContext.completeTransition(true)
            })
        }
    }
}
