//: Playground - noun: a place where people can play

import UIKit

/*
 构造函数的总结
    1.默认情况下系统会提供一个给所有属性赋值的构造函数
    2.如果自定义构造函数,那么必须保证自定义的构造函数结束时,所有的成员属性有被初始化
    3.如果有自定义构造函数,那么自定义的构造函数,会覆盖原有系统提供的构造函数.
        如果不希望覆盖系统提供的构造函数,则需要明确的实现该方法
 给结构体扩充函数
    必须在函数前 mutating
*/

// 1.如何定义结构体?
struct Location {
    // 结构体的属性/方法
    
    // 定义属性
    var x : Double
    var y : Double
    
    // 扩充构造函数
    init(x : Double, y : Double) {
        self.x = x
        self.y = y
    }
    
    init() {
        x = 0
        y = 0
    }
    
    init(x : CGFloat, y : CGFloat) {
        self.x = Double(x)
        self.y = Double(y)
    }
    
    init(x : Int, y : Int) {
        self.x = Double(x)
        self.y = Double(y)
    }
    
    // 扩充方法
    mutating func moveH(x : Double) {
        self.x += x
    }
    
    mutating func moveV(y : Double) {
        self.y += y
    }
}

// 2.创建结构体的类型
// 2.1.创建系统的结构体
var point = CGPoint(x: 100, y: 100)
CGPoint()
CGPoint(x: 50, y: 50)
point.x = 100
point.y = 100
let size = CGSize(width: 50, height: 50)
let rect = CGRect(x: 0, y: 0, width: 50, height: 50)

// 2.2.创建自己的Location的结构体
let center = Location(x: 100, y: 100)
print(center.x)
print(center.y)


// 3.给自己的结构体扩充构造函数
Location(x: 50, y: 50)
Location()


// 4.给结构体扩充方法
// 4.1.给自己的结构体扩充方法
var location = Location(x: 100.0, y: 100.0)
location.moveH(-100)
location.moveV(50)
print(location)

// 4.2.给系统的结构体扩充方法
// 1> 使用extension 2> 在方法前加mutating
extension CGPoint {
    mutating func moveH(x : CGFloat) {
        self.x = x
    }
}

point.moveH(50)


// 5.给系统的类扩充方法
let btn = UIButton(type: .Custom)
btn.setTitle("按钮", forState: .Normal)

print(btn.titleLabel?.text) // 可选链

extension UIButton {
    func getTitle() -> String? {
        return titleLabel?.text
    }
}

print(btn.getTitle())








