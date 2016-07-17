//: Playground - noun: a place where people can play

import UIKit

class Person {
    // 属性监听器
    var name : String = "" {
        willSet(newName) { // 属性即将改变
            print(name)
            // print(newValue)
            print(newName)
        }
        
        didSet(oldName) { // 已经发生改变(常用)
            print(name)
            // print(oldValue)
            print(oldName)
        }
    }
}

let p = Person()
p.name = "why"
p.name = "yz"
