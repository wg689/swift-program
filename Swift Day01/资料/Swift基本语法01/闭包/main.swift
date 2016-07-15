//
//  main.swift
//  闭包
//
//  Created by 李南江 on 15/3/17.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation

/*
闭包:
函数是闭包的一种
类似于OC语言的block
闭包表达式(匿名函数) -- 能够捕获上下文中的值

语法: in关键字的目的是便于区分返回值和执行语句
闭包表达式的类型和函数的类型一样, 是参数加上返回值, 也就是in之前的部分
{
    (参数) -> 返回值类型 in
    执行语句
}
*/


// 完整写法
let say:(String) -> Void = {
    (name: String) -> Void in
    print("hi \(name)")
}
say("lnj")


// 没有返回值写法
let say2:(String) ->Void = {
    (name: String) in
    print("hi \(name)")
}
say2("lnj")


// 没有参数没有返回值写法
let say3:() ->Void = {
    print("hi lnj")
}
say3()


/*
闭包表达式作为回调函数
*/
func showArray(array:[Int])
{
    for number in array
    {
        print("\(number), ")
    }
}
/*
// 缺点, 不一定是小到大, 不一定是全部比较, 有可能只比较个位数
// 所以, 如何比较可以交给调用者决定
func bubbleSort(inout array:[Int])
{
    let count = array.count;
    for var i = 1; i < count; i++
    {
        for var j = 0; j < (count - i); j++
        {
            if array[j] > array[j + 1]
            {
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            }
        }
    }
}
*/

let cmp = {
    (a: Int, b: Int) -> Int in
    if a > b{
        return 1;
    }else if a < b
    {
        return -1;
    }else
    {
        return 0;
    }
}

func bubbleSort(inout array:[Int], cmp: (Int, Int) -> Int)
{
    let count = array.count;
    for var i = 1; i < count; i++
    {
        for var j = 0; j < (count - i); j++
        {
            if cmp(array[j], array[j + 1]) == -1
            {
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            }
        }
    }
}

var arr:Array<Int> = [31, 13, 52, 84, 5]
bubbleSort(&arr, cmp: cmp)
showArray(arr)


// 闭包作为参数传递
bubbleSort(&arr, cmp: {
    (a: Int, b: Int) -> Int in
    if a > b{
        return 1;
    }else if a < b
    {
        return -1;
    }else
    {
        return 0;
    }
})
print("---------------")
showArray(arr)


// 如果闭包是最后一个参数, 可以直接将闭包写到参数列表后面, 这样可以提高阅读性. 称之为尾随闭包
bubbleSort(&arr) {
    (a: Int, b: Int) -> Int in
    if a > b{
        return 1;
    }else if a < b
    {
        return -1;
    }else
    {
        return 0;
    }
}


// 闭包表达式优化,
// 1.类型优化, 由于函数中已经声明了闭包参数的类型, 所以传入的实参可以不用写类型
// 2.返回值优化, 同理由于函数中已经声明了闭包的返回值类型,所以传入的实参可以不用写类型
// 3.参数优化, swift可以使用$索引的方式来访问闭包的参数, 默认从0开始
bubbleSort(&arr){
//    (a , b) -> Int in
//    (a , b) in
    if $0 > $1{
        return 1;
    }else if $0 < $1
    {
        return -1;
    }else
    {
        return 0;
    }
}


// 如果只有一条语句可以省略return
let hehe = {
    "我是lnj"
}
print(hehe())
