//
//  main.swift
//  内存相关
//
//  Created by 李南江 on 15/4/5.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation
/*
Swift内存管理:
管理引用类型的内存, 不会管理值类型, 值类型不需要管理
内存管理原则: 当没有任何强引用指向对象, 系统会自动销毁对象
(默认情况下所有的引用都是强引用)
如果做到该原则: ARC
*/

class Person {
    var name:String
    init(name:String){
        self.name = name
    }
    deinit{
        print("deinit")
    }
}
var p:Person? = Person(name: "lnj")
//p = nil


/*
weak弱引用
*/

class Person2 {
    var name:String
    init(name:String){
        self.name = name
    }
    deinit{
        print("deinit")
    }
}
// 强引用, 引用计数+1
var strongP = Person2(name: "lnj") // 1
var strongP2 = strongP // 2

// 弱引用, 引用计数不变
// 如果利用weak修饰变量, 当对象释放后会自动将变量设置为nil
// 所以利用weak修饰的变量必定是一个可选类型, 因为只有可选类型才能设置为nil
weak var weakP:Person2? = Person2(name: "lnj")
if let p = weakP{
    print(p)
}else
{
    print(weakP)
}


/*
unowned无主引用 , 相当于OC unsafe_unretained
unowned和weak的区别: 
1.利用unowned修饰的变量, 对象释放后不会设置为nil. 不安全
  利用weak修饰的变量, 对象释放后会设置为nil
2.利用unowned修饰的变量, 不是可选类型
  利用weak修饰的变量, 是可选类型
什么时候使用weak?
什么时候使用unowned?
*/

class Person3 {
    var name:String
    init(name:String){
        self.name = name
    }
    deinit{
        print("deinit")
    }
}
unowned var weakP3:Person3 = Person3(name: "lnj")


/*
循环引用
ARC不是万能的, 它可以很好的解决内存问题, 但是在某些场合不能很好的解决内存泄露问题
例如两个或多个对象之间的循环引用问题
*/

class Person4 {
    let name:String // 姓名
    // 人不一定有公寓
    weak var apartment: Apartment? // 公寓
    init(name:String){
        self.name = name
    }
    deinit{
        print("\(self.name) deinit")
    }
}
class Apartment {
    let number: Int // 房间号
    var tenant: Person4? // 租客
    init(number:Int){
        self.number = number
    }
    deinit{
        print("\(self.number) deinit")
    }
}
var p4:Person4? = Person4(name: "lnj")
var a4:Apartment? = Apartment(number:888)

p4!.apartment = a4 // 人有一套公寓
a4!.tenant = p4! // 公寓中住着一个人

// 两个对象没有被销毁, 但是我们没有办法访问他们了. 内存泄露
p4 = nil
a4 = nil



class Person5 {
    let name:String // 姓名
    // 人不一定有信用卡
    var card: CreditCard?
    init(name:String){
        self.name = name
    }
    deinit{
        print("\(self.name) deinit")
    }
}
class CreditCard{
    let number: Int
    // 信用卡必须有所属用户
    // 当某一个变量/常量必须有值, 一直有值, 那么可以使用unowned修饰
    unowned let person: Person5
    init(number:Int, person: Person5){
        self.number = number
        self.person = person
    }
    deinit{
        print("\(self.number) deinit")
    }
}
var p5:Person5? = Person5(name: "lnj")
var cc:CreditCard? = CreditCard(number: 8888888, person: p5!)
p5 = nil
cc = nil

