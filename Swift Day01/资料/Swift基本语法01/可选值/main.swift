//
//  main.swift
//  可选值
//
//  Created by 李南江 on 15/2/28.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation

/*
可选值: optionals有两种状态: 
1.有值 2.没有值, 没有值就是nil
*/

//有值:
var optValue1: Int? = 9
//没有值:
var optValue2: Int?
var optValue3: Int? = nil

/*
可选值可以利用if语句来进行判断
*/
var optValue4: Int?
if optValue4 != nil
{
    print(optValue4)
}else
{
    print(optValue4)
}

/*
提取可选类型的值(强制解析)
会将optValue中的整型值强制拿出来赋值给变量result, 换句话说就是告诉编译器optValue一定有值, 因为可选类型有两种状态有值和没有值, 所以需要告诉编译器到底有没有值
需要注意的是如果强制解析optValue, 但是optValue中没有值时会引发一个运行时错误
*/
var optValue5: Int? = 9
var result1: Int = optValue5!
print(result1)

//报错:
var optValue6: Int?
var result2: Int = optValue6!
print(result2)

/*
可选绑定:
为了更安全的解析可选类型的值, 一般情况下使用可选绑定
如果optValue没有值就不会做任何操作, 如果optValue有值会返回true并将optValue的值赋值给result执行大括号中的内容
*/
var optValue: Int? = 9
if let result3 = optValue
{
    print(result3)
}
