//
//  Person.swift
//  AnyObject-Any-AnyClass
//
//  Created by 李南江 on 15/9/24.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class Person: NSObject {

    func say()
    {
        print("say")
    }
    
    class func momoda() {
        print(__FUNCTION__)
    }
}
