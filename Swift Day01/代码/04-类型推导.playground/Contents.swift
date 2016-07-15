//: Playground - noun: a place where people can play

import UIKit

/*
 Swift中类型推导
    1.如果在定义标识符,有直接给该标识符赋值,那么标识符后面的类型可以省略
    2.Swift中有类型推导,会自动根据赋值的类型推导出前面标识符的类型
    3.可以通过option + 鼠标左键,查看标识符的类型
*/

let m = 10
var n = 1.44

let btn = UIView()

// 错误写法:
// let btn : UIButton = UIView()
let btn1 : UIView = UIButton()
