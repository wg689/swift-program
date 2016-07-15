//: Playground - noun: a place where people can play

import UIKit

/************************** 字典定义 *****************************/
// Swift中字典的类型Dictionary
// 不可变字典使用let修饰
// 可变字典使用var修饰
// 注意:字典在创建时使用[]
let dict : Dictionary = ["name" : "why", "age" : 18]
// dict = ["name" : "lmj", "age" : 20]
let dict1 : Dictionary<String, AnyObject> = ["name" : "lmj", "age" : 20]

// 开发中常见写法
let dict2 : [String : AnyObject] = ["name" : "lnj", "age" : 22]

// 类型推导
let dict3 = ["name" : "yz", "age" : 25]

// 可变字典
var dict4 = [String : AnyObject]()


/************************** 对可变字典的操作 *****************************/
// 1.在字典中添加元素
dict4["name"] = "lmj"
dict4
dict4["age"] = 20
dict4
dict4["height"] = 1.88
dict4

// 2.从字典中移除元素
let age = dict4.removeValueForKey("age")


// 3.修改字典中的值
// 注意:通过一个键来修改字典中的值,如果存在这个键则修改.如果不存在就会添加新的键值对
dict4["weight"] = 60.0
dict4
dict4["height"] = 1.78
dict4

// 4.获取值
// let height = dict4["height"]! as! Double
let height = dict4["height"]!
print(height)


/************************** 对可变字典的遍历 *****************************/
// 1.遍历字典中所有的键
for key in dict4.keys {
    print(key)
}

// 2.遍历字典中所有的值
for value in dict4.values {
    print(value)
}

// 3.遍历字典中的键值对
for (key, value) in dict4 {
    print(key)
    print(value)
}


/************************** 字典的合并 *****************************/
var d1 = ["name" : "why", "age" : 20]
var d2 = ["height" : 1.88, "phoneNum" : "+86 110", "name" : "lmj"]

// 两个字典,即时类型一致也不可以彼此相加
// var d3 = d1 + d2

// 合并过程中,如果没有对应的键,添加对应的键值对
// 如果有队要你管的键,则修改原有的值
for (key, value) in d1 {
    d2[key] = value
}

d2



