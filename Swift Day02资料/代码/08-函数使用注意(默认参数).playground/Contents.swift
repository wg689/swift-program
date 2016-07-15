//: Playground - noun: a place where people can play

import UIKit

// 默认参数 --> 程序员 鼓励师
func makeCoffee(coffeeName : String = "雀巢") -> String {
    return "制作了一杯爱心 \(coffeeName)咖啡"
}

makeCoffee("拿铁")
makeCoffee("摩卡")

makeCoffee()