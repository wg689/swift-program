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
        /*
        // 打开LOG
        QorumLogs.enabled = true
        // 测试LOG
        QorumLogs.test()
        // 设置需要显示的等级
        //        QorumLogs.minimumLogLevelShown = 4
        // 限定输出文件
        //        QorumLogs.onlyShowThisFile(MainViewController)
        
        QL1("lnj") // debug
        QL2("lnj")  // info
        QL3("lnj") // warning
        QL4("lnj") // error
        QLPlusLine() // 打印加号作为分割线
        QLShortLine() // 打印等号作为分割线
        */
        NJLog("abc")
        return true
    }
}
/*
自定义LOG的目的:
在开发阶段自动显示LOG
在发布阶段自动屏蔽LOG

print(__FUNCTION__)  // 打印所在的方法
print(__LINE__)     // 打印所在的行
print(__FILE__)     // 打印所在文件的路径

方法名称[行数]: 输出内容
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
