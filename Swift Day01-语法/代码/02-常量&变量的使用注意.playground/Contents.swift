//: Playground - noun: a place where people can play

import UIKit

// 注意一: 在开发中优先使用常量, 防止其他同事不小心修改了存储的值

// 注意二: 常量的本质:指向的内存地址不可以修改, 但是可以通过指向的内存地址找到对象,之后修改对象内部的属性
// UIView *view = [UIView alloc] init];
// 在Swift中创建对象: UIView()
/*
var view : UIView = UIView()
view = UIView()
*/

// 1.创建UIView对象
let view : UIView = UIView()
// view = UIView() 错误写法: 常量的内存地址不可以被修改

// 2.修改对象内部的属性
view.alpha = 0.5
view.frame = CGRectMake(0, 0, 100, 100)
view.backgroundColor = UIColor.redColor()
