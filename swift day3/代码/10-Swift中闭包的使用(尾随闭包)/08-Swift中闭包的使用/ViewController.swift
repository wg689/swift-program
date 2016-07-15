//
//  ViewController.swift
//  08-Swift中闭包的使用
//
//  Created by 1 on 16/6/17.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var httpTools : HttpTools?
    
    // override: 重写, 在swift中如果是对父类的方法进行的重写.必须在方法前加上override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        httpTools = HttpTools()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // 循环引用的解决方案
        /*
        let callback = {[weak self] (result) -> () in
            self?.view.backgroundColor = UIColor.blueColor()
        }
        httpTools?.loadData(callback)
        
        // 类似做法
        let m = 10
        httpTools?.loadData(m)
        */
        
        // 尾随闭包: 如果闭包是函数最后一个参数,那么可以将闭包写成尾随闭包
        // 1.写法一:
        httpTools?.loadData() {[weak self] (result) -> () in
            self?.view.backgroundColor = UIColor.blueColor()
        }
        
        // 2.写法二: ()可以省略
        httpTools?.loadData {[weak self] (result) -> () in
            self?.view.backgroundColor = UIColor.blueColor()
        }
    }
    
    deinit {
        print("ViewController --- deinit")
    }
}

