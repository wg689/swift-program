//
//  NetworkTools.swift
//  单利
//
//  Created by 李南江 on 15/9/9.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class NetworkTools: NSObject {
    // swift 中，不允许在类函数中，定义静态变量
//    static var instance: NetworkTools?
//    static var token: dispatch_once_t = 0
//
//    class func sharedNetworkTools() -> NetworkTools {
//        dispatch_once(&token) { () -> Void in
//            // 执行一次的代码
//            instance = NetworkTools()
//        }
//        return instance!
//    }
    
    // swift 中的单例有新写法
    // swift 中 `let` 本身就是线程安全的
    // 什么时候实例化的对象? - 在需要的时候，才会被创建！
    private static let instance = NetworkTools()
    
    class func sharedNetworkTools() -> NetworkTools {
        return instance
    }
    
    override init() {
        print("实例化对象")
    }

}
