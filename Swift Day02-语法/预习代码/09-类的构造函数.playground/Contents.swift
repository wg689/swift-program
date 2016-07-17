//: Playground - noun: a place where people can play

import UIKit

/*
 1.自定义构造函数时会覆盖原有的构造函数
    如果不希望覆盖,则可以明确的将原来的构造函数写出
*/

class Person {
    var name : String = ""
    var age : Int = 0
    
    init() {
        
    }
    
    init(name : String, age : Int) {
        self.name = name
        self.age = age
    }
    
    init(dict : [String : AnyObject]) {
        if let name = dict["name"] as? String {
            self.name = name
        }
        
        if let age = dict["age"] as? Int {
            self.age = age
        }
    }
}

// 1.使用init()构造函数创建对象
let p = Person()
p.name = "why"
p.age = 18

// 2.使用init(name : String, age : Int)创建对象
let p1 = Person(name: "lmj", age: 19)

// 3.通过init(dict : [String : AnyObject])方法创建对象
let p2 = Person(dict: ["name" : "why", "age" : 18])

