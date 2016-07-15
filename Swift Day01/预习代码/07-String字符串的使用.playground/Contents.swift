//: Playground - noun: a place where people can play

import UIKit

// 定义字符串
let string = "Hello World"

let string1 : String
string1 = "Hello"


// 字符串的遍历
for c in string1.characters {
    print(c)
}

// 字符串的拼接
// 1.两个字符串之间的拼接
let str1 = "my name"
let str2 = " is why"
let str3 = str1 + str2

// 2.字符串和其他类型的拼接
let age = 18
let name = "why"
let height = 1.88

// 如果字符串中出现了变量:\(标识符的名称)
let info = "My name is \(name), age is \(age), height is \(height)"

// 3.字符串的格式化
// 03:04
let min = 3
let second = 4
var time = "\(min):\(second)"
time = String(format: "%02d:%02d", arguments: [min, second])

// 4.字符串的截取
let url = "www.520it.com"

let url1 = (url as NSString).substringToIndex(3)
let url2 = (url as NSString).substringFromIndex(10)
let range = NSRange(location: 4, length: 5)
let url3 = (url as NSString).substringWithRange(range)

