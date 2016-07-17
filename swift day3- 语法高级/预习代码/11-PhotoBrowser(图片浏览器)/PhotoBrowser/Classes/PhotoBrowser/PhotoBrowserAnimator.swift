//
//  PhotoBrowserAnimator.swift
//  PhotoBrowser
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit


protocol presentAnimatorDelegate {
    func startRectWithIndexPath(indexPath : NSIndexPath) -> CGRect
    func endRectWithIndexPath(indexPath : NSIndexPath) -> CGRect
    func imageViewWithIndexPath(indexPath : NSIndexPath) -> UIImageView
}

protocol dismissAnimatorDelegate {
    func indexPathOfCell() -> NSIndexPath
    func imageView() -> UIImageView
}

class PhotoBrowserAnimator: NSObject {
    var isPresented : Bool = false
    var indexPath : NSIndexPath?
    
    // 定义代理属性
    var presentDelegate : presentAnimatorDelegate?
    var dismissDelegate : dismissAnimatorDelegate?
}

// MARK:- 实现UIViewControllerTransitioningDelegate协议中的方法
extension PhotoBrowserAnimator : UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        return self
    }
}


// MARK:- 实现UIViewControllerAnimatedTransitioning协议中的方法
extension PhotoBrowserAnimator : UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1.0
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        isPresented ? animateForPresentView(transitionContext) : animateForDismissView(transitionContext)
    }
}

// MARK:- 自定义弹出和消失动画
extension PhotoBrowserAnimator {
    func animateForPresentView(transitionContext: UIViewControllerContextTransitioning) {
        // 0.nil值校验
        guard let presentDelegate = presentDelegate, indexPath = indexPath else {
            return
        }
        
        // 1.取出弹出的View
        let presentedView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        // 2.将弹出的View添加到容器视图中
        transitionContext.containerView()?.addSubview(presentedView)
        presentedView.alpha = 0.0
        
        // 3.添加动画
        transitionContext.containerView()?.backgroundColor = UIColor.blackColor()
        let animateView = presentDelegate.imageViewWithIndexPath(indexPath)
        transitionContext.containerView()?.addSubview(animateView)
        animateView.frame = presentDelegate.startRectWithIndexPath(indexPath)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                animateView.frame = presentDelegate.endRectWithIndexPath(indexPath)
            }) { (_) -> Void in
                transitionContext.containerView()?.backgroundColor = UIColor.clearColor()
                transitionContext.completeTransition(true)
                presentedView.alpha = 1.0
                animateView.removeFromSuperview()
        }
    }
    
    func animateForDismissView(transitionContext: UIViewControllerContextTransitioning) {
        // 0.nil值校验
        guard let presentDelegate = presentDelegate, dismissDelegate = dismissDelegate else {
            return
        }
        
        // 1.取出消失的View
        let dismissView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        dismissView.removeFromSuperview()
        
        // 2.添加消失动画
        // 2.1.取出内容
        let animateView = dismissDelegate.imageView()
        transitionContext.containerView()?.addSubview(animateView)
        let indexPath = dismissDelegate.indexPathOfCell()
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            animateView.frame = presentDelegate.startRectWithIndexPath(indexPath)
            }) { (_) -> Void in
                transitionContext.completeTransition(true)
        }
    }
}
