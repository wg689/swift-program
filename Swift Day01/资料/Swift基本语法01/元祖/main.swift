//
//  main.swift
//  元祖
//
//  Created by 李南江 on 15/2/28.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation


/*
元祖:
在其它语言中很早就是有元祖这个概念, 但是对于OC程序员来说这是一个新的概念
将多个相同或者不同类型的值用一个小括号括起来就是一个元祖
*/
let student = ("lnj", 30, 99.8)
print(student)
print(student.0)
print(student.1)
print(student.2)

/*
元祖其实和结构体很想, 只是不需要提前定义类型. 那么如果不定义类型元祖是什么类型呢?
元祖其实是复合类型, 小括号中可以写任意类型
*/

let student1: (String, Int, Double) = ("lnj", 30, 99.8)
/*
元祖的其它定义方式:指明应用元祖元素的名称
*/
let student2 = (name:"lnj",age:30,score:99.8)
print(student2.name)
print(student2.age)
print(student2.score)

/*
元祖的其它定义方式: 
通过指定的名称提取元祖对应的值, 会将对应位置的值 赋值给对应位置的名称
*/
let (name , age , score) =  ("lnj", 30, 99.8)
print(name)
print(age)
print(score)

/*
如果不关心元祖中的某个值可以利用_通配符来忽略提取
*/
let (name1 , age1 , _) =  ("lnj", 30, 99.8)
print(name1)
print(age1)

/*
在以前没有元祖之前C和OC语言是通过传入指针或者返回结构体的方式来返回多个值的,而有了元祖之后就可以实现让一个函数返回多个值
*/


