//: Playground - noun: a place where people can play

import UIKit

// 1.判断浮点型
let m = 3.14

switch m {
case 3.14:
    print("和π相等")
default:
    print("和π不相等")
}

// 2.判断字符串
let a = 20
let b = 30

let oprationStr = "*"

var result = 0

/*
if oprationStr == "+" {
    result = a + b
} else if oprationStr == "-" {
    result = a - b
} else if oprationStr == "*" {
    result = a * b
} else if oprationStr == "/" {
    result = a / b
} else {
    print("非法操作符")
}
*/

switch oprationStr {
    case "+":
        result = a + b
    case "-":
        result = a - b
    case "*":
        result = a * b
    case "/":
        result = a / b
    default:
        print("非操作符")
}

// 3.判断区间
// 区间: 数字区间
// 半开半闭区间: 0..<10 0~9
// 闭区间:      0...10 0~10
let score = 92

switch score {
case 0..<60:
    print("不及格")
case 60..<80:
    print("及格")
case 80..<90:
    print("良好")
case 90...100:
    print("优秀")
default:
    print("不合理的分数")
}




