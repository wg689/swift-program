//: Playground - noun: a place where people can play

import UIKit

/*
OC写法
for (int i = 0; i < 10; i++) {}
for (NSString *name in names) {}
*/

// 1.最基本写法: for后面的()可以省略(少见)
for var i = 0; i < 10; i++ {
    print(i)
}

// 2.区间遍历
for i in 0..<10 {
    print(i)
}

for i in 0...10 {
    print(i)
}

// 3.打印10次hello world
// 如果下标值不需要使用,则可以使用 _ 来代替
for _ in 0..<10 {
    print("hello world")
}