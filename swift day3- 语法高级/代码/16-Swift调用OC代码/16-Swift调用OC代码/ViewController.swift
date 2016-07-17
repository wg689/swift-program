//
//  ViewController.swift
//  16-Swift调用OC代码
//
//  Created by 1 on 16/6/17.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p = Person()
        p.name = "why"
        p.age = 18
        
        p.test()
    }
    
}

