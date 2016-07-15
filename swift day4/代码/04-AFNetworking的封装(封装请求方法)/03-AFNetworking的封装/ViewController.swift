//
//  ViewController.swift
//  03-AFNetworking的封装
//
//  Created by 1 on 16/6/18.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit
import AFNetworking

class ViewController: UIViewController, UITableViewDelegate {
    
    lazy var btn : UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkTools.shareIntance.request(.POST, URLString: "http://httpbin.org/post", parameters: ["name" : "why", "age" : 18]) { (result, error) -> () in
            if error != nil {
                print(error)
                return
            }
            
            print(result)
        }
    }
}

