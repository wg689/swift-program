//
//  AppDelegate.swift
//  01-小码哥微博
//
//  Created by 李南江 on 16/1/21.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // 设置底部工具条外观
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        
        return true
    }
}
/*
自定义LOG
*/
func NJLog<T>(message: T,
    file: String = __FILE__,
    method: String = __FUNCTION__,
    line: Int = __LINE__)
{
    #if NJ_DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}
