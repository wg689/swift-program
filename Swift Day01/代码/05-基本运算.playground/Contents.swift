//: Playground - noun: a place where people can play

import UIKit

/*
 OC代码
    int a = 20;
    CGFloat b = 2.55;
    CGFloat result = a + b;
*/

let a = 20
let b = 2.45

// 错误写法: let result = a + b

// 相加结果是Int的情况
let tempB = Int(b) // 将Double类型转成Int类型
let result = a + tempB

// 相加结果是Double的情况
let tempA = Double(a)
let result1 = tempA + b
