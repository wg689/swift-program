//: Playground - noun: a place where people can play

import UIKit

// 1.定义协议
protocol SportProtocol : CrazySportProtocol {
    func playBasketball()
    func playFallball()
}

// 2.遵守协议
// Swift中遵守协议:1.如果有继承自父类,则在父类后面跟, 写上协议 2.如果没有继承,直接写 : 写上协议
// 注意:在swift中默认遵守一个协议后,协议中的方法都必须实现,如果没有实现则会报错误
class Person {
    var name : String = ""
    var age : Int = 0
    
    func running() {
        print("跑步")
    }
}

extension Person : SportProtocol {
    func playBasketball() {
        print("玩篮球")
    }
    
    func playFallball() {
        print("玩足球")
    }
    
    func jumping() {
        print("蹦极")
    }
}

// 3.协议之间的继承
protocol CrazySportProtocol {
    func jumping()
}