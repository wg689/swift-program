//
//  ViewController.swift
//  04-AFNetwork的封装
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NetworkTools.shareIntance.request(.GET, urlString: "http://httpbin.org/get", parameters: ["name" : "why", "age" : 18]) { (result, error) -> Void in
            print(result)
            print(error)
        }
    }
}

