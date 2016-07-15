//: Playground - noun: a place where people can play

import UIKit

/********************** 可选类型的定义 ************************/
/*
class Person : NSObject{
let name : Optional<String> = nil
let phoneNum : String? = nil
}*/
// 1> 定义方式一:基本定义方式
var name : Optional<String> = nil

// 2> 定义方式二:语法糖
var phoneNum : Optional<String> = nil



/********************** 给可选类型赋值 ************************/
 name = "why"
phoneNum = "+86 110"

// 在使用可选类型时,拿到的optional(具体的值)
print(name, phoneNum)

//name = "my name is " + name



/********************** 去可选类型中的值 ************************/
// 取值的过程被成为解包:通过!来取被称之为强制解包
// 注意:强制解包时,如果里面没有对应的值,那么会报错
//var info = "my name is" + name!
//print(info)
//print(name!)

// 严谨的解包方式
if name != nil {
    var info = "my name is" + name!
}

// 可选绑定:如果name不等于nil,则解包name,并且将结果后的值赋值给tempName
if let tempName = name {
    var info = "my name is " + tempName
}

/********************** 可选类型的应用场景 ************************/
let url = NSURL(string: "http://www.520it.com/小码哥")

//if url != nil {
//    let request = NSURLRequest(URL: url!)
//}

if let tempUrl = url {
    let request = NSURLRequest(URL: tempUrl)
}




