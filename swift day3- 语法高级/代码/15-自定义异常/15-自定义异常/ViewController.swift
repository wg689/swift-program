//
//  ViewController.swift
//  15-自定义异常
//
//  Created by 1 on 16/6/17.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fileManager = FileManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 可以拿到具体的异常错误
        do {
            let msg = try fileManager.readMsgFromFileName("1234.txt")
            print(msg)
        } catch {
            print(error)
        }
        
        // 2.拿到不具体的异常
        guard let msg = try? fileManager.readMsgFromFileName("123.txt") else {
            return
        }
        print(msg)
    }
}

