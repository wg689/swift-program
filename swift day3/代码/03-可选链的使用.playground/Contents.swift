//: Playground - noun: a place where people can play

import UIKit

// 1.定义类
class Person {
    var name : String = ""
    
    var dog : Dog?
}

class Dog {
    var dogName : String = ""
    
    var toy : Toy?
    
    func running() {
        print("running")
    }
}

class Toy {
    var price : Double = 0.0
}

// 2.创建对象,并且设置对象之间的关系
let p = Person()
p.name = "why"
let dog = Dog()
dog.dogName = "旺财"
let toy = Toy()

p.dog = dog
dog.toy = toy
toy.price = 100.0


// 3.给可选链赋值: 给why的旺财这只狗的玩具赋值一个新的价格
// ?. : 系统先判断前面的可选类型是否有值,如果有值,则系统帮助我们解包具体的值,并且使用. 如果没有值,后面的代码都不自信
//if let dog = p.dog {
//    if let toy = dog.toy {
//        toy.price = 50.0
//    }
//}

// p.dog.toy.price = 50
// p.dog!.toy!.price = 50

p.dog?.toy?.price = 50.0

// 4.从可选链中取值: 取出当前why的旺财的狗的玩具的价格
// 注意: 从可选链中取出的值,一定是可选类型
// let price = p.dog!.toy!.price
//if let dog = p.dog {
//    if let toy = dog.toy {
//        print(toy.price)
//    }
//}
let price = p.dog?.toy?.price

let btn : UIButton? = UIButton()
btn!.setTitle("按钮", forState: .Normal)
let title = btn?.titleLabel?.text


// 5.可选链调用方法
// 注意: 判断可选类型是否有值,如果没有值,则后面的方法不执行.如果有值,则对可选类型进行解包,之后再调用
// p.dog!.running()
//if let dog = p.dog {
//    dog.running()
//}
p.dog?.running()















