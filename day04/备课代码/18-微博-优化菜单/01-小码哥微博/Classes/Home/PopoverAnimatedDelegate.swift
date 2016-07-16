//
//  PopoverAnimatedManager.swift
//  01-小码哥微博
//
//  Created by 李南江 on 16/1/22.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

class PopoverAnimatedDelegate: NSObject {
    /// 记录当前菜单状态
    var isPresent: Bool = false
}

// MAKR: - 自定义转场代理方法
extension PopoverAnimatedDelegate: UIViewControllerTransitioningDelegate
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
        NSNotificationCenter.defaultCenter().postNotificationName(XMGPresentedControllerNotification, object: self)
        return self
    }
    
    /**
     返回负责 dismiss 动画对象
     */
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPresent = false
        NSNotificationCenter.defaultCenter().postNotificationName(XMGDismissedControllerNotification, object: self)
        return self
    }
}

extension PopoverAnimatedDelegate: UIViewControllerAnimatedTransitioning {
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