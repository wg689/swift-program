//: Playground - noun: a place where people can play

import UIKit

// 整型:Int 浮点型:Double
let π : Double = 3.14
var age : Int = 22


// 注意:
// 1.如果一个标识符在定义时有直接复制,那么系统会根据后面赋值的类型来决定前面标识符的类型,这时(:类型)可以省略
// 2.查看标识符的类型:option+鼠标左键(非常常用)
// 3.这种转化方式被称之为:类型推导. 根据后面值的类型,推导出前面标识符的类型
let a = 10
let b = 1.735


// Swift中的基本运算
//int m = 10
//double n = 2.55
//
//double l = m + n

// 注意:
// 1.Swift中没有隐式转化.(不会自动将一个类型转化成另外一个类型)
// 2.如果想要两个不同的类型进行运算,必须保证类型一致
// 3.将Int转成Double类型: Double(int的标识符) 将Double转成Int Int(Double的标识符)

let m = 10
let n = 22.5

// let x = Double(m) + n
let x = m + Int(n + 0.5)