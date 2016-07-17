//: Playground - noun: a place where people can play

import UIKit

/*
函数的重载:
    1> 参数的个数不同
    2> 参数的类型不同
func sum(num1 : Int, num2 : Int) -> Int {
    return num1 + num2
}

func sum(num1 : Double, num2 : Double) -> Double {
    return num1 + num2
}

func sum(num1 : Int, num2 : Int, num3 : Int) -> Int {
    return num1 + num2 + num3
}

*/


// 可变参数
func sum(num1 : Int, num2 : Int) -> Int {
    return num1 + num2
}

func sum(num1 : Int, num2 : Int, num3 : Int, num4 : Int) -> Int {
    return num1 + num2 + num3 + num4
}

func sum(nums : Int...) -> Int {
    var total = 0
    for num in nums {
        total += num
    }
    
    return total
}

sum(10, 20, 30, 40, 50)











