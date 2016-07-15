//
//  ViewController.swift
//  14-异常处理
//
//  Created by 1 on 16/6/17.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.创建正则表达式对象(不了解)
        // 如果在swift中调用一个方法时,该方法最后有一个throws. 那么表明该方法会抛出异常
        // 如果该方法会抛出异常,则必须通过try关键字对异常进行处理
        /*
         异常处理的三种方式
            1.try方式: 手动处理,最终可以拿到发生怎样的异常
                do {
                    let regex = try NSRegularExpression(pattern: "", options: .IgnoreMetacharacters)
                    // 没有异常,则继续执行
                } catch { // 当发生异常时,会执行该{}
                    print("发生了异常:\(error)")
                }
            2.try?方式: 系统处理异常. 如果发生了异常,则该方法返回nil. 如果没有异常,则返回对应的类型
                guard let regex = try? NSRegularExpression(pattern: "", options: .IgnoreMetacharacters) else {
                    print("有异常")
                    return
                }
                // 执行代码块
            3.try!方式(不推荐): 告诉系统不可能发生了异常.直接给返回具体的类型即可
                注意: 如果发生了异常,程序会崩溃
                let regex = try! NSRegularExpression(pattern: "", options: [])
        */
        
    }
    
}

