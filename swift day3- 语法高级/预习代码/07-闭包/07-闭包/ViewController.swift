//
//  ViewController.swift
//  07-闭包
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var httpTool : HttpTool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        httpTool = HttpTool()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        httpTool?.loadData({ (jsonData) -> () in
            print("在控制器中拿到数据:\(jsonData)")
        })
    }
}

