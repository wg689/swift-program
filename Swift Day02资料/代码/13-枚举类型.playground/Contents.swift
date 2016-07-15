//: Playground - noun: a place where people can play

import UIKit

/*
 1.枚举的定义方式一
 2.创建一个枚举类型
 3.枚举的定义方式二
 4.给枚举类型赋值
*/

// 1.如何定义枚举类型
enum Direction : String {
    // 定义具体的类型
    case EAST = "a"
    case WEST = "b"
    case SOUTH = "c"
    case NORTH = "d"
}

// 2.创建一个枚举类型
let view = UIView()
let flag = false
let a = 20


var d : Direction = .EAST
d = .WEST

var d1 = Direction.NORTH
d1 = .SOUTH


// 如果枚举类型有确定的值,那么可以通过该方法来创建枚举类型
let d2 : Direction? = Direction(rawValue: "abc")


// 3.定义枚举类型
enum Planet : Int {
    case Mercury = 2, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var p = Planet.Earth
p = .Mars

let p1 = Planet(rawValue: 4)










