//: Playground - noun: a place where people can play

import UIKit

// 1.定义字符串
// 1.1.定义不可变字符串 let修饰
let str = "hello swift"
// str = "hello Objective-C" 错误写法

// 1.2.定义可变字符串 var修饰
var strM = "hello world"
strM = "hello china"


// 2.字符串的使用
// 2.1.获取字符串的长度
let count = str.characters.count

// 2.2.遍历字符串中所有的字符
for c in str.characters {
    print(c)
}


// 3.字符串的拼接
// 3.1.字符串和字符串之间的拼接
let str1 = "小码哥"
let str2 = "IT教育"
// let str3 = [NSString stringwithFormat:@"%@%@", str1, str2]
let str3 = str1 + str2

// 3.2.字符串和其它标识符之间的拼接
let name = "lmj"
let age = 20
let height = 1.65

// let info = [NSString stringwithformat:@"my name is %@, age is %d, height is %f", name, age, height]
let info = "my name is \(name), age is \(age), height is \(height)"

// 3.3.字符串拼接过程中进行格式化
let min = 3
let second = 22
// let timeStr = [NSString stringwithformat:@"%02d:%02d", min, second];
let timeStr = String(format: "%02d:%02d", arguments: [min, second])


// 4.字符串的截取



