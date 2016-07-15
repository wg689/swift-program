//: Playground - noun: a place where people can play

import UIKit

// 新增Bool类型
// 取值:true/false

// if分支
// 1.可以不跟()
// 2.在判断句中必须有真假(没有非0即真)

let a = 10
let flag = a != 0
//if (flag) {
//    print("a不等于0")
//} else {
//    print("a等于0")
//}

if flag {
    print("a不等于0")
} else {
    print("a等于0")
}


// if elseif else的演练
let score = 87

if score < 60 {
    print("不及格")
} else if score <= 70 {
    print("及格")
} else if score <= 90 {
    print("良好")
} else {
    print("优秀")
}

// 注意:如果if语句中只有一句话,则不能省略{}
//let age = 18
//// 错误写法:OC中也不建议省略
//if age >= 18
//    print("成年人")

// 三木运算符:和OC中的用法是一致
let age = 17

let string = age >= 18 ? "可以上网" : "回家去"
print(string)

// 取出较大的值
let m = 20
let n = 23

let result = m > n ? m : n

// guard : 守卫/保护

func online(age : Int) -> Bool {
    guard age >= 18 else {
        print("不能上网,回家去")
        return false;
    }
    
    print("留下来上网吧")
    return true
}

online(19)