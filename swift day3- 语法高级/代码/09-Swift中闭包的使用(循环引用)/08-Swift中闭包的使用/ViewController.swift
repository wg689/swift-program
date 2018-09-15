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
        // 1.方案一:
        
        weak var weakSelf : ViewController? = self // ViewController
        httpTools?.loadData({ (result) -> () in
            
        })
        httpTools?.loadData({ (result) -> () in
            print("在控制器中拿到数据:\(result)")
            
            // 注意:如果使用当前对象的属性和方法,是在闭包中.那么self不能省略
            // 什么地方需要使用self. --> 1.如果在代码中产生了歧义 2.在闭包中
            weakSelf?.view.backgroundColor = UIColor.blueColor()
        })

        
        // 2.方案二:类同方案一,只是写法不一样
        /*
        httpTools?.loadData({[weak self] (result) -> () in
            self?.view.backgroundColor = UIColor.blueColor()
        })
        */
        
        // 3.方案三(不推荐):使用unowned(容易野指针/访问僵尸对象)
        httpTools?.loadData({[unowned self] (result) -> () in
            self.view.backgroundColor = UIColor.orangeColor()
        })
    }
    
    deinit {
        print("ViewController --- deinit")
    }
}

