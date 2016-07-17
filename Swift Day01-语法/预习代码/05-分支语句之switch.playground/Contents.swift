//: Playground - noun: a place where people can play

import UIKit

// switch的基本用法
// 1>switch后面的()可以省略
// 2>case中语句结束后不需要跟break
// 3>在case中定义局部变量不需要跟{}
// 4>如果想要case穿透,则在case语句结束时跟:fallthrough
let sex = 0

switch sex {
case 0:
    let a = 10
    print("男")
    fallthrough
case 1:
    print("女")
default:
    print("其他")
}

// Switch判断浮点型
let a = 3.14

switch a {
case 3.14:
    print("π")
default:
    print("非π")
}

// 根据判断字符串
// swift中的字符串不需要跟@,直接写""
let opration = "*"

let m = 10
let n = 20

switch opration {
    case "+":
    print(m + n)
    case "-":
    print(m - n)
    case "*":
    print(m * n)
    case "/":
    print(m / n)
default:
    print("不识别的操作符")
}

// 判断区间
// 0..<10 : [0, 10)
// 0...10 : [0, 10]
let score = 92

switch score {
case 0..<60:
    print("不及格")
case 60..<70:
    print("及格")
case 70..<90:
    print("良好")
case 90...100:
    print("优秀")
default:
    print("不合理的分数")
}




