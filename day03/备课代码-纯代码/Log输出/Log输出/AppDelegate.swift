//
//  AppDelegate.swift
//  Log输出
//
//  Created by 李南江 on 15/9/25.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}

func NJLog<T>(message: T, file: String = __FILE__, method: String = __FUNCTION__, line: Int = __LINE__){
    // 1.在Build Settings中, 找到Swift Compiler-Custom Flags
    // 2.在Other Swfit Flags中加上 -D DEBUG
    #if DEBUG
    print("\((file as NSString).lastPathComponent)[\(line)]-\(method): \(message)")
    #endif
}