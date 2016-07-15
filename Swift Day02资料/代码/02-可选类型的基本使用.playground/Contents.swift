//: Playground - noun: a place where people can play

import UIKit

// 1.可选类型定义
// Optional泛型集合
// var name : Optional<String> = nil // 不常见
var name : String? = nil // String? 语法糖

// 2.给可选类型赋值
name = "why" // Optional("why")


// 3.从可选类型中取值
// 3.1.取出可选类型
print(name) // Optional("why")
// 3.2.取出具体的值: 可以通过对可选类型进行解包: 可选类型 + !
// print(name!)

// 4.强制解包:可选类型+!
// 注意:强制解包非常危险,如果可选类型中是一个空值,那么强制解包程序会崩溃
// 因此最好在解包前对可选类型进行判断,判断是否有值
if name != nil {
    print(name!)
    print(name!)
    print(name!)
    print(name!)
    print(name!)
}

// 5.可选绑定: 就是在对可选类型进行解包
// 1> 判断name是否有值,如果没有值,者直接不执行{}
// 2> 如果name有值,那么会对name进行解包,之后将解包后的结果赋值给前面的tempName
/*
if let tempName = name {
    print(tempName)
    print(tempName)
    print(tempName)
    print(tempName)
    print(tempName)
}
*/
if let name = name {
    print(name)
    print(name)
}



