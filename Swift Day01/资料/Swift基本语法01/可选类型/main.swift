//
//  main.swift
//  可选类型
//
//  Created by 李南江 on 15/4/5.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation
/*
可选类型: 
可选类型的本质其实就是一个枚举
None 没有值
Some 有值
格式: Optional<类型>  或 在类型后面加上?号
由于可选类型在Swift中随处可见, 所以系统做了一个语法糖, 在类型后面加上?
*/

var opa: Optional<Int>
var opb: Int?

var nora: Int
nora = 10
// 基本类型变量, 在使用之前必须进行初始化, 否则报错
// 目的: 安全, 不管在什么时候访问都是有意义的
// 普通变量和可选类型的区别, 普通变量只有一种状态, 有值
// 注意:Swift的变量和C/OC的不一样, C/OC可以没有值, 是一个随机值

//int *p;
//NSLog("%d", *p); // 会报错, 不安全

print(nora)

// 由于普通变量只有一种状态, 有局限性, 所以Swift设计了可选类型
print(opb)
// 可选类型是安全的么? 是, 可以通过可选绑定判断后再使用
// Swift的发明者完全是基于安全的考虑, 当我们使用基本类型时完全不用考虑是否有值
// 当我们使用可选类型时, 总会记得先判断再使用. 让程序时刻了解哪些有值哪有没有值
opb = 55
if let b = opb{
//    print(opb!)
    print(b)
}

// Swift中的可选类型变量更贴近于OC中的普通变量
//NSData *data = [NSData .dataWithContentsOfMappedFile:@"/Users/Jonathan_Lee/Desktop/老员工奖.xlsx"];
//NSLog("%@", data);

var data:NSData? = NSData(contentsOfFile: "/Users/Jonathan_Lee/Desktop/老员工奖.xlsx")
print(data)



/*
可选链: 通过可选类型的变量来调用相应的属性和方法
可选链的返回值是一个可选值
格式:
可选值?.属性
可选值?.方法
*/

class Person {
    var name: String
    init(name:String){
        self.name = name
    }
    func whoami() ->String{
        print("my name is \(self.name)")
        return name
    }
}
var p0 : Person?
var p1 : Person = Person(name: "lnj")

//p1.name = "zs"
//p1.whoami()

// 如何通过可选类型来调用对应的方法和属性
// 1.通过强制解包
// 但是强制解包非常危险, 如果可选类型没有值, 会引发运行时错误
//p0!.name = "ls"
//p0!.whoami()

// 2.通过可选绑定, 代码繁琐
//if let p = p0{
//    p.name = "ls"
//    p.whoami()
//}

// 3.通过可选链, 如果问号前面的变量没有值, 整个可选链会失效
// 更加简洁高效, 有利用使用可选类型
p0 = p1
p0?.name = "ls"
p0?.whoami()

// 可选链的返回值会自动包装成一个可选值
// 因为可选链可用能失效, 所以返回值可能有值也可能没有值, 要想表达有值或者没有值只能用可选值, 所以返回值会自动包装成一个可选值
print(p0?.name)
print(p0?.whoami())
print(p1.name)
var a:String? = p0?.name
p0?.name = "ww"
var b:String = p1.name



/*
可选链调用下标索引
格式:
可选值?[]
*/

struct Student {
    var name:String = "lnj"
    var math:Double = 99.0
    var chinese:Double = 99.0
    var english:Double = 99.0

    // 要想实现下标访问, 必须实现subscript方法
    // 如果想要通过下标访问, 必须实现get方法
    // 如果想要通过下表赋值, 必须实现set方法
    subscript(course:String) ->Double?{
        get{
            switch course{
            case "math":
                return math
            case "chinese":
                return chinese
            case "english":
                return english
            default:
                return nil
            }
        }
        set{
            switch course{
            case "math":
                // 因为返回的是可选类型
                math = newValue!
            case "chinese":
                chinese = newValue!
            case "english":
                english = newValue!
            default:
                print("not found")
            }
            
        }
    }
}
var stu:Student? = Student()
// 可选链调用下标索引不需要., 直接在问号后面写上[]即可
print(stu?["math"])

//var arr:Array? = [1, 2, 3, 4]
//print(arr?[1])

// 利用可选链赋值. 注意: 早起版本中不能利用可选链赋值
stu?.name = "ww"
print(stu?.name)
//  利用可选链给下标赋值
stu?["math"] = 88
print(stu?["math"])

// 判断赋值操作是否成功, 可选链的赋值操作也有返回值
// 如果赋值成功会返回一个可选类型, 返回()?也就是Viod? 代表成功. 返回nil代表失败
//let res: = stu?.name = "zl"
//let res: ()? = stu?.name = "zl"
//let res: Void? = stu?.name = "zl"
stu = nil
let res: Void? = stu?.name = "zl"
print(res)


/*
多层可选链:
单层:可选值?.属性
多层:可选值?.属性.属性?.属性 或者 可选值?.属性?.属性?.属性
*/
class A {
    var name:String = "lnj"
}
class B{
    var a1:A?
}
class C{
    var b1:B = B()
}
class D{
    var c1: C?
}

var a1 = A()
var b1 = B()
var c1 = C()
var d1 = D()

d1.c1 = c1
//b1.a1 = a1
// 通过d直接给b赋值
// 由于D中的C是可选值, 所以需要在C后面加上?
d1.c1?.b1.a1 = a1
// 通过d直接获取a中的name
// 其实只需要在可选值后面加上问号即可, 如果可选值不存在, 那么后面的链失效
print(d1.c1?.b1.a1?.name)
