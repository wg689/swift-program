//
//  ViewController.swift
//  AnyObject-Any-AnyClass
//
//  Created by 李南江 on 15/9/24.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        AnyObject:
        1.OC中id代表任意class类型, Swift中利用AnyObject来代替
        2.在开发中应该先确定类型, 然后再使用
        3.所有class都隐式的实现了这个接口, 这也是AnyObject只适用于class类型的原因
        */
        let objc: AnyObject = Person()
        print(objc)
        
        /*
        苹果建议:除了class类型以外的基本数据类型, 还可以包含struct/enum在内的所有类型
        */
        var array: [AnyObject] = []
        let intValue: Int = 1
        let strValue: String = "lnj"
        array.append(intValue)
        array.append(strValue)
        print("---")
        
        var array2: [Any] = []
        array2.append(intValue)
        array2.append(strValue)
        print("---")
        
        
        /*
        1.AnyObject.type这种方式得到一个元类型(Meta), 例如Person.type得到Person这个类型的类型
        2.元类型也是一种类型, 所以可以定义一个元类型变量, 保存Person这个类型本身
        3.类名.self取得对象类型本身
        */
        
        let typeP: Person.Type = Person.self
        let typeP2: AnyClass = Person.self
        
        typeP.momoda()
        typeP2.momoda()
        Person.momoda()
    }

}

