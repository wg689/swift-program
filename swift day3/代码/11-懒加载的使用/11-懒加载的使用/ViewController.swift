//
//  ViewController.swift
//  11-懒加载的使用
//
//  Created by 1 on 16/6/17.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

/*
 验证懒加载
    1.用到时再加载
    2.多次使用只会加载一次
*/

class ViewController: UIViewController {
    
    // 1.写法一:
    lazy var btn : UIButton = {
        let btn1 = UIButton()
        
        print("-------")
        
        return btn1
    }()
    
    // 2.写法二:
    lazy var btn2 : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print(btn)
    }
}

