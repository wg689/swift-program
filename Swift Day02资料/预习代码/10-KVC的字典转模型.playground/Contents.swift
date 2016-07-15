//: Playground - noun: a place where people can play

import UIKit

/*
 1.KVC字典转模型的前提是必须继承自NSObject
    setValuesForKeysWithDictionary该方法属性NSObject
*/

class Person : NSObject {
    var name : String = ""
    var age : Int = 0
    
    init(dict : [String : AnyObject]) {
        super.init()
        
        self.setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
}

let p = Person(dict: ["name" : "why", "age" : 18])
print(p.name)
print(p.age)