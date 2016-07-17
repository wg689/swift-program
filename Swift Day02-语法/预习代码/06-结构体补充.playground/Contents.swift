//: Playground - noun: a place where people can play

import UIKit

// 1.定义结构体
// 在swift中结构体或者类在实例化时,必须保证所有的属性有初始化值.如果没有编译不会通过
// 如果自定义构造函数,那么默认的构造函数会被覆盖掉,如果不希望被覆盖,必须明确的实现该构造函数
// 如果给结构体扩充方法,则必须在方法的前面加mutating
struct Location {
    var x : Double
    var y : Double
    
    init () {
        x = 0
        y = 0
    }
    
    init (x : Double, y : Double) {
        self.x = x
        self.y = y
    }
    
    init (xyStr : String) {
        let xyArray = xyStr.componentsSeparatedByString(",")
        self.x = Double(xyArray.first!)!
        self.y = Double(xyArray.last!)!
    }
    
    mutating func moveH(x : Double) {
        self.x += x
    }
    
    mutating func moveV(y : Double) {
        self.y += y
    }
}

// 2.创建结构体实例
// let location = Location(x: 100, y: 100)
let location = Location()
let location1 = Location(x: 100, y: 100)
let location2 = Location(xyStr: "100,100")


// 3.给系统的结构体扩充方法
extension CGPoint {
    mutating func moveH(x : CGFloat) {
        self.x += x
    }
    
    mutating func moveV(y : CGFloat) {
        self.y += y
    }
}