//: Playground - noun: a place where people can play

import UIKit

// 1.is的使用: 判断NSObject是否是某种具体的类型
let array : [NSObject] = ["why", 18, 1.88]
let item = array[0]

if item is String {
    print("第一个元素是一个字符串")
} else {
    print("第一个元素不是一个字符串")
}

// 2.as
// 2.1.as的使用
let str = "/Users/apple/Desktop"
(str as NSString).stringByAppendingPathComponent("123.txt")

// 2.2.as? --> 将NSObject转成一个具体的类型
// 判断item是否可以转成String类型,如果不可以返回nil
// 如果可以转成对应的类型,则返回具体值
// 因此最终的结果是一个可选类型
let itemStr = item as? String

// 2.3.as! --> 直接转成具体的类型(不建议使用)
// 注意:如果转成不成功,程序会直接崩溃

