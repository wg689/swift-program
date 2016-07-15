//: Playground - noun: a place where people can play

import UIKit

// 指针类型
var m = 20
var n = 30

/*
func swapNum(var m : Int, var n : Int) {
    let temp = m
    m = n
    n = temp
}

swapNum(m, n: n)
*/

func swapNum(inout m : Int, inout n : Int) {
    let temp = m
    m = n
    n = temp
}

swapNum(&m, n: &n)

print("m:\(m) n:\(n)")
