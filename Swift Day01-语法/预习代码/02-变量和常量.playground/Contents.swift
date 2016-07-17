//: Playground - noun: a place where people can play

import UIKit

// 1.变量和常量的基本用法
//  1> 使用let定义变量
//  2> 使用var定义常量
let age : Int = 20
// age = 22

var height : Double = 1.78
height = 1.88

// 2.使用注意:
//  1> 指向的对象不可以修改(指针指向了一个对象,不能再指向另外一个对象了).
//    可以通过指针获取对象本身,之后修改内部的属性
//  2> 建议开发中,显示使用常量,只有确定一个常量需要被修改时,再改成变量(var)
//    因为常量更加安全,不会被任意的修改
let view : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
// view = UIView()
view.backgroundColor = UIColor.redColor()

// 注意:枚举类型的使用方式:类型.其中的具体类型
let btn : UIButton = UIButton(type: UIButtonType.ContactAdd)
btn.center = CGPoint(x: 50, y: 50)

view.addSubview(btn)
