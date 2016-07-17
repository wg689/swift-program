//
//  ViewController.swift
//  12-常见注释
//
//  Created by 1 on 16/6/17.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit
/*
 1.单行注释 //
 2.多行注释 /* */ 在swift中多行注释可以嵌套使用
 3.文档注释 ///
 4.分组注释 // MARK:- 分组注释
*/

class ViewController: UIViewController {
    
    // MARK:- 所有的属性
    /// 姓名
    var name : String = ""
    
    
    // MARK:- 所有的方法
    // MARK: 控制器的View加载完成
    // viewDidLoad方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test()
    }
    
    /// 测试方法
    func test() {
        
    }
}

