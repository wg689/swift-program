//
//  Shop.swift
//  PhotoBrowser
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

class Shop: NSObject {
    // MARK:- 定义属性
    var q_pic_url : String?
    
    // MARK:- 自定义构造函数
    init(dict : [String : AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    // MARK:- 重写description属性
    override var description : String {
        return dictionaryWithValuesForKeys(["q_pic_url"]).description
    }
}
