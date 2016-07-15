//: Playground - noun: a place where people can play

import UIKit

/*
@interface Person : NSObject
@end

@impeliment
@end
*/

/*
 继承自NSObject和不继承有什么区别
    1.继承NSObject,那么就拥有NSObject所有的属性和方法
    2.KVC --> NSObject
*/

// 1.如何声明一个类?
// 构造函数结束前必须保证所有的属性被初始化
// 注意:在定义类的属性时,需要给属性一个初始化值,或者将属性声明成可选类型
// 如果是基本数据类型(值类型),赋值一个初始化值.如果是对象类型,那么声明称可选类型
class Person {
    // 类的属性和方法
    var name : String = ""
    var age : Int = 0
    var height : Double = 0.0
    var btn : UIButton?
}


// 2.创建Person对象
let p : Person = Person()
p.name = "why"
p.age = 18
p.height = 1.88
p.btn = UIButton()











