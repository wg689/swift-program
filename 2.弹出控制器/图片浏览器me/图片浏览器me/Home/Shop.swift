//
//  Shop.swift
//  图片浏览器me
//
//  Created by HLH on 16/7/18.
//  Copyright © 2016年 wanggang. All rights reserved.
//

import UIKit
class Shop:NSObject{
    var q_pic_url:String?
    init(dict:[String : AnyObject]){
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    
    override func setValue(value:AnyObject?,forUndefinedKey key:String){}
        

//mark 重写description 函数

   override var description :String{
    return
        dictionaryWithValuesForKeys(["q_pic_url"]).description
   }


}