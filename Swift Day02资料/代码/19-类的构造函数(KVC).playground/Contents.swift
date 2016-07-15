//: Playground - noun: a place where people can play

import UIKit

/*
 使用KVC的条件
    1.当前的类必须继承自NSOBject
    2.在调用setValuesForKeysWithDictionary之前,先调用super.init()
*/

class Person : NSObject {
    var name : String = ""
    var age : Int = 0
    
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
}

let p = Person(dict: ["name" : "why", "age" : 18, "height" : 1.88])
print(p.name)
print(p.age)
