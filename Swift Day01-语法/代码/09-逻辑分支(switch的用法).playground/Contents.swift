//: Playground - noun: a place where people can play

import UIKit

// sex: 0 -> 男  1 -> 女 其它: 其它
let sex = 0

/*
if sex == 0 {
    print("男")
} else if sex == 1 {
    print("女")
} else  {
    print("其它")
}
*/

/*
 1.switch基本用法
    1> switch后面的()可以省略
    2> case结束后可以不加break,那么系统会加上break
 2.基本用法的补充
    1> 在swift中case后面是可以判断多个条件,并且多个条件以,分割
    2> 如果系统case产生case穿透,可以在case结束后跟上fallthrough(不建议使用)
*/

/* 基本用法的代码
switch sex {
case 0:
    print("男")
case 1:
    print("女")
default:
    print("其它")
}
*/

switch sex {
case 0, 1:
    print("正常人")
    fallthrough
default:
    print("其它")
}










