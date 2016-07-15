//
//  ViewController.swift
//  09-Swift调用OC代码
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p = Person()
        p.name = "123"
        
        let dog = Dog()
        dog.color = UIColor.redColor()
    }
}

