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
        httpTools?.loadData({ (result) -> () in
            print("在控制器中拿到数据:\(result)")
        })
      
    }
}

