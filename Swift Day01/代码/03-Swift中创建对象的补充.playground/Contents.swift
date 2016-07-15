//: Playground - noun: a place where people can play

import UIKit

// 1.创建UIView对象
// [UIView alloc] initWithFrame:CGRect];
let rect : CGRect = CGRectMake(0, 0, 100, 100)
let view : UIView = UIView(frame: rect)


// 2.设置UIView的属性
view.backgroundColor = UIColor.orangeColor()
// view.alpha = 0.2


// 3.添加子控件
// Swift中使用枚举类型: 1.方式一:枚举类型.具体的类型 2. .具体的类型
// 3.1.创建UIButton对象
let btn : UIButton = UIButton(type: .Custom)

// 3.2.设置btn的属性
btn.frame = CGRectMake(0, 0, 50, 50)
btn.backgroundColor = UIColor.blueColor()

btn.setTitle("按钮", forState: .Normal)

// 3.3.将btn添加View中
// [view addSubview:btn];
view.addSubview(btn)