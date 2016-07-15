//: Playground - noun: a place where people can play

import UIKit

/********************** 数组定义 **************************/
// 数组:Array表示数据
// let修饰的标识符是不可变数组(元素确定后不能修改)
// var修饰的标识符是可变数组(可以添加和删除元素)
// 注意:
// 1>定义数组是使用[],并且不需要加@
// 2>通常情况下数组是一个泛型集合,所有通常会指定数组中可以存放哪些元素

// 不可变数组写法一:定义一个数组,里面存放的都是字符串
let names : Array<String> = ["why", "lmj", "lnj", "yz"]

// 不可变数组写法二:定义一个数组,里面存放的都是字符串
let names1 : [String] = ["why", "lmj", "lnj", "yz"]

// 不可变数组写法二:定义一个数组,里面存放的都是字符串
let names2 = ["why", "lmj", "lnj", "yz"]
// 不可以添加元素
// names.append("22")
// 数组中存放多种数据类型的写法
let array :[AnyObject] = ["why", 18, 1.88]

// 可变数组
// 创建可变数组方式一:
var array1 : [String] = Array()

// 常见可变数组方式二:
var array2 = [String]()



/********************** 数组操作 **************************/
// 添加元素:通过append方法
array1.append("why")
array1.append("lnj")

// 删除元素
let removeString = array1.removeAtIndex(0)
array1

// 修改元素
array1[0] = "lmj"
array1

// 获取数组中的值
let str = array1[0]

// 获取数组中的元素个数
let count = array1.count

/********************** 数组遍历 **************************/

// 遍历方式一:
for i in 0..<names.count {
    print(names[i])
}

// 遍历方式二:forin
for item in names {
    print(item)
}

// 遍历方式三:区间遍历
for item in names[0..<2] {
    print(item)
}


/********************** 合并 **************************/
// 1.类型相同的合并
let names5 = ["lmj", "lnj"]
let names6 = ["yz", "why"]

let names7 = names5 + names6

// 2.不同类型的合并:不能相加
var array5 = ["why", 18]
let array6 = [1.88, 60.5]

// let array7 = array5 + array6
for item in array6 {
    array5.append(item)
}

array5

// 注意:不建议数组中存放多种元素


