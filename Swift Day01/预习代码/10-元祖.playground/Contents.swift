//: Playground - noun: a place where people can play

import UIKit

// 元祖也是一个数据集合,可以在集合中定义一组数据
// 元祖的定义使用:(元素1,元素2)
("1001", "张三", 19, 1.88)
(id : "1001", name : "张三", age : 19, height : 1.88)

// 用一个数据类型来描述网络请求错误
// errorCode/errorInfo
[404, "Not Found"]
["errorCode" : 404, "errorInfo" : "Not Found"]

// 用元祖描述错误信息
let error = (404, "Not Found")
error.0
error.1

let error1 = (errorCode : 404, errorInfo : "Not Found")
error1.errorCode
error1.errorInfo

switch (error1) {
case (404, "Not Found"):
    print("没有找到主机")
default :
    print("其他错误")
}

let (errorCode2, errorInfo2) = (404, "Not Found")
errorCode2
errorInfo2
