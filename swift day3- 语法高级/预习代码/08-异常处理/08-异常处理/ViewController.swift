//
//  ViewController.swift
//  08-异常处理
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var manager = FileManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        do {
            let str = try manager.readFileContent("123.txt")
            print(str)
        } catch {
            let errorType = error as! FileReadError
            switch errorType {
                case FileReadError.FileNameNotNull:
                    print("123")
                case FileReadError.FilePathNotFind:
                    print("321")
                case FileReadError.FileDataError:
                    print("122")
            }
        }
        
    }
}

