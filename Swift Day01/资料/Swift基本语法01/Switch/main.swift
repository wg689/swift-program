//
//  main.swift
//  Switch
//
//  Created by 李南江 on 15/3/17.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation
/*
Swith
格式: switch(需要匹配的值) case 匹配的值: 需要执行的语句 break;
OC:
char rank = 'A';
switch (rank) {
    case 'A':
        NSLog(@"优");
        break;
    case 'B':
        NSLog(@"良");
        break;
    case 'C':
        NSLog(@"差");
        break;
    default:
        NSLog(@"没有评级");
        break;
}

可以穿透
char rank = 'A';
switch (rank) {
    case 'A':
        NSLog(@"优");
    case 'B':
        NSLog(@"良");
        break;
    case 'C':
        NSLog(@"差");
        break;
    default:
        NSLog(@"没有评级");
        break;
}

可以不写default
char rank = 'A';
    switch (rank) {
    case 'A':
        NSLog(@"优");
        break;
    case 'B':
        NSLog(@"良");
        break;
    case 'C':
        NSLog(@"差");
        break;
}

default位置可以随便放
char rank = 'E';
switch (rank) {
    default:
        NSLog(@"没有评级");
    break;
    case 'A':
    {
        int score = 100;
        NSLog(@"优");
        break;
    }
    case 'B':
        NSLog(@"良");
        break;
    case 'C':
        NSLog(@"差");
        break;
}


在case中定义变量需要加大括号, 否则作用域混乱
char rank = 'A';
switch (rank) {
    case 'A':
    {
        int score = 100;
        NSLog(@"优");
        break;
    }
    case 'B':
        NSLog(@"良");
        break;
    case 'C':
        NSLog(@"差");
        break;
}

不能判断对象类型
NSNumber *num = @100;
switch (num) {

    case @100:
        NSLog(@"优");
        break;
    default:
        NSLog(@"没有评级");
        break;
}
*/

/*
Swift: 可以判断对象类型, OC必须是整数
*/
//不可以穿透
//可以不写break,
var rank = "A"
switch rank{
    case "A": //相当于if
        print("优")
    case "B": // 相当于else if
        print("优")
    case "C": // 相当于else if
        print("优")
    default: // 相当于else
        print("没有评级")
}

/*
因为不能穿透所以不能这么写
var rank1 = "A"
switch rank1{
    case "A":
    case "B":
        print("优")
    case "C":
        print("优")
    default:
        print("没有评级")
}
*/

//只能这么写
var rank1 = "A"
switch rank1{
    case "A", "B": // 注意OC不能这样写
        print("优")
    case "C":
        print("差")
    default:
        print("没有评级")
}

/*
//不能不写default
var rank2 = "A"
switch rank2{
    case "A":
        print("优")
    case "B":
        print("良")
    case "C":
        print("差")
}
*/

/*
//default位置只能在最后
var rank3 = "A"
switch rank3{
    default:
        print("没有评级")
    case "A":
        print("优")
    case "B":
        print("良")
    case "C":
        print("差")
}
*/

//在case中定义变量不用加大括号
var rank4 = "A"
switch rank4{
    case "A":
        var num = 10
        print("优")
    case "B":
        print("良")
    case "C":
        print("差")
    default:
        print("没有评级")
}

/*
区间和元祖匹配
var num = 10;
switch num{
    case 1...9:
        print("个位数")
    case 10...99:
        print("十位数")
    default:
        print("其它数")

}


var point = (10, 15)
switch point{
    case (0, 0):
        print("坐标在原点")
    case (1...10, 10...20): // 可以在元祖中再加上区间
        print("坐标的X和Y在1~10之间")
    case (_, 0): // X可以是任意数
        print("坐标的X在X轴上")
    default:
        print("Other")
}
*/


/*
值绑定
var point = (1, 10)
switch point{
    case (var x, 10): // 会将point中X的值赋值给X
        print("x= \(x)")
    case (var x, var y): // 会将point中XY的值赋值给XY
        print("x= \(x) y= \(y)")
    case var( x, y):
        print("x= \(x) y= \(y)")
    default:
        print("Other")
}

根据条件绑定
var point = (100, 10)
switch point{
    // 只有where后面的条件表达式为真才赋值并执行case后的语句
    case var(x, y) where x > y: 
        print("x= \(x) y= \(y)")
    default:
        print("Other")
}
*/


