//: Playground - noun: a place where people can play

import UIKit

// 1.创建类
class Person {
    var name : String = ""
    var dog : Dog?
}

class Dog {
    var color : UIColor?
    var toy : Toy?
    
    func running() {
        print("狗在跑...")
    }
}

class Toy {
    var price : Double = 0.0
}


// 2.创建对象
let p = Person()
p.name = "why"

let dog = Dog()
dog.color = UIColor.yellowColor()

let toy = Toy()
toy.price = 100

// 3.设置对象之间的关系
p.dog = dog
dog.toy = toy


// 4.需求
// 4.1.获取why的大黄的玩具价格
// 如果可选链是在取值,那么整个可选类型最终的返回值是一个可选类型
// 可选中任何一个可选类型为nil,那么结果为nil
// 可选类型中都有值,那么结果为具体的结果
let price = p.dog?.toy?.price
print(price)


// 4.2.给why的大黄的玩具价格赋值一个新的价格
p.dog?.toy?.price = 200

// 4.3.让大黄跑起来
p.dog?.running()