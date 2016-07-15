//: Playground - noun: a place where people can play

import UIKit

// 1.while循环
/*
 和OC的区别
    1> while后面的()可以省略
    2> while后面的判断句没有非0(nil)即真
*/

var m = 10

while m != 0 {
    m--
    print(m)
}

// 2.do while循环
/*
 和OC的区别
    1> 和while一致
    2> 不在使用do,而是用repeat代替do关键字
*/
repeat {
    print(m)
    m++
} while m < 10