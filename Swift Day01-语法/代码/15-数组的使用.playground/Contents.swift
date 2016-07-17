//: Playground - noun: a place where people can play

import UIKit

// 1.数组的定义
// 1.1.定义不可变数组: 使用let修饰 [String] --> Array<String>
let array = ["why", "yz", "lmj", "lnj"]

// 1.2.定义可变数组: 使用var修饰
// var arrayM = Array<String>() 不常见
var arrayM = [String]() // 常见


// 2.可变数组的基本操作(增删改查)
// 2.1.添加元素
arrayM.append("lmj")
arrayM.append("lnj")
arrayM.append("yz")

// 2.2.删除元素(会将删除元素返回)
arrayM.removeAtIndex(0)

// 2.3.修改元素
arrayM[0] = "why"
arrayM

// 2.4.根据下标值获取元素
arrayM[0]
arrayM[1]
// arrayM[2] 下标值越界错误


// 3.数组的遍历
// 3.1.根据下标值进行遍历
for i in 0..<array.count {
    print(array[i])
}

// 3.2.forin遍历方式
// for (NSString *name in array)
for name in array {
    print(name)
}

// 3.3.forin遍历方式,同时可以拿到下标值
for (index, name) in array.enumerate() {
    print(index)
    print(name)
}

// 3.4.遍历数组中其它一部分元素(了解)
for i in 0..<2 {
    print(array[i])
}

for name in array[0..<2] {
    print(name)
}


// 4.数组的合并
// 在swift中相同类型的数组可以相加加合并
let array1 = [10, 20, 30]
let array2 = [100, 200, 300]
let resultArray = array1 + array2


// 错误写法
/*
let array1 = ["why", "lmj"]
let array2 = [18, 20]
// let resultArray = array1 + array2

var resultArray = [NSObject]()

for item in array1 {
    resultArray.append(item)
}
for item in array2 {
    resultArray.append(item)
}

resultArray
*/

















