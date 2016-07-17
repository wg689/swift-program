//: Playground - noun: a place where people can play

import UIKit

// 1.定义枚举类型
enum Direction {
    case East
    case West
    case North
    case South
}

var d = Direction.East
d = .West
// let d : Direction = .East

// 2.给枚举类型指定值
enum Sex : Int {
    case Man = 0
    case Weman = 1
}

let sex = Sex(rawValue: 0)