//
//  ViewController.swift
//  13-访问权限
//
//  Created by 1 on 16/6/17.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

/*
 internal : 内部的. 默认情况下所有的访问权限都是internal
    所有的在本模块中的文件里面都可以进行访问
 private : 私有的. 
    在当前的源文件中可以访问,但是其他源文件中不能访问
 public : 可以跨模块(框架)进行访问
*/

private class ViewController: UIViewController {
    
    private var name : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class Person {
    func test() {
        ViewController().name = "why"
    }
}