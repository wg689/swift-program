//: Playground - noun: a place where people can play

import UIKit

let a = 10

// 1.if的使用
/*
 if (a) {
    NSLog(@"a不等于0");
 } else {
    NSLog(@"a等于0");
 }
*/

if a != 0 {
    print("a不等于0")
} else {
    print("a等于0")
}

if a > 0 {
    print("a大于0")
} else {
    print("a小于等于0")
}

// 2.else if的使用
let score = 100

if score < 0 || score > 100 {
    print("不合理分数")
} else if score < 60 {
    print("不及格")
} else if score < 80 {
    print("及格")
} else if score < 90 {
    print("良好")
} else {
    print("不错哦")
}












