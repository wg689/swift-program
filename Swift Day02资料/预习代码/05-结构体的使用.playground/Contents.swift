//: Playground - noun: a place where people can play

import UIKit

/*
// 1.定义坐标点
let centerX : Double = 100
let centerY : Double = 100

let x : Double = 80
let y : Double = 70

// 2.写一个方法用于判断x/y距离中心点的距离
func isInRange(x : Double, y : Double) -> Bool {
    let disX = x - centerX
    let disY = x - centerY
    
    let dis = sqrt(pow(disX, 2) + pow(disY, 2))
    print(dis)
    
    return dis < 200
}

isInRange(x, y: y)
*/

// 1.定义结构体,用于描述位置信息
struct Location {
    var x : Double
    var y : Double
}

// 2.定义坐标点
let center = Location(x: 100, y: 100)
let testPoint = Location(x: 80, y: 70)

// 3.写一个方法用于进行判断
func inRange(point : Location) -> Bool {
    let disX = point.x - center.x
    let disY = point.y - center.y
    
    let dis = sqrt(pow(disX, 2) + pow(disY, 2))
    
    return dis < 200
}

inRange(testPoint)


// 4.系统结构体创建方式补充
var point = CGPoint()
point.x = 100
point.y = 100

let size = CGSize(width: 50, height: 50)

let rect = CGRect(x: 10, y: 10, width: 100, height: 100)

let range = NSRange(location: 5, length: 10)



