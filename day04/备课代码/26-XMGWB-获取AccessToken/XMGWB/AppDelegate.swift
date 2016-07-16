//
//  AppDelegate.swift
//  XMGWB
//
//  Created by 李南江 on 15/9/6.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit
import AFNetworking

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // 设置网路指示器
        AFNetworkActivityIndicatorManager.sharedManager().enabled = true
        // 设置网络缓存
        /*
        memoryCapacity: 内存大小
        diskCapacity: 磁盘大小
        diskPath: 磁盘路径
        */
        let urlCache = NSURLCache(memoryCapacity: 4 * 1024 * 1024, diskCapacity: 20 * 1024 * 1024, diskPath: nil)
        NSURLCache.setSharedURLCache(urlCache)
        
        // 0.设置外观
        setupAppearance()
        
        // 1.创建window
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        window?.rootViewController = MainViewController()
        // 2.显示window
        window?.makeKeyAndVisible()
        
        return true
    }
    
    /**
    设置外观
    */
    func setupAppearance(){
        // 一经设置，全局有效，应该尽早设置
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
        UITabBar.appearance().tintColor = UIColor.orangeColor()
    }
}

