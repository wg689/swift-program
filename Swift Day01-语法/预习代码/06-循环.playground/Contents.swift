//: Playground - noun: a place where people can play

import UIKit

// for循环
// for循环后面不跟()

// for循环的第一种写法
for var i = 0; i < 10;i++ {
    print(i)
}

// OC中的forin写法
let array = ["why", "lnj", "lmj", "yz"]

for str in array {
    print(str)
}

// i的forin写法
for i in 0..<10 {
    print(i)
}

for i in 0...10 {
    print(i)
}

// 如果for中使用不到i,可以用_代替i
for _ in 0..<10 {
    print("hello")
}

// while用法跟OC基本一致
// 1>while的判断句必须有正确的真假,没有非0即真
// 2>while后面的()可以省略
var a = 0
while a < 10 {
    a++
}

repeat {
    print(a)
    a++
} while a < 20