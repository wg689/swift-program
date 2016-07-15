//: Playground - noun: a place where people can play

import UIKit

// 1.使用数组定义一组数据
let infoArray : [NSObject] = ["why", 18, 1.88]
let nameArray = infoArray[0]
// let nameCount = nameArray.characters

// 2.使用字典定义一组数据
let infoDict : [String : NSObject] = ["name" : "why", "age" : 18, "height" : 1.88]
let nameDict = infoDict["name"]
// let nameCount = nameDict.characters

// 3.使用元组定义一组数据
// 3.1.元组的基本定义
let infoTuple = ("why", 18, 1.88)
let nameTuple = infoTuple.0
let nameCount = nameTuple.characters.count

let ageTuple = infoTuple.1


// 3.2.给元组中元素起别名
let infoTuple1 = (name : "why", age : 18, height : 1.88)

infoTuple1.name
infoTuple1.age
infoTuple1.height

// 3.3.少见的方式: 别名就是元组的名称
let (name, age, height) = ("why", 18, 1.88)
name
age
height







