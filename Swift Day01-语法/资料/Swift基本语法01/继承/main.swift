//
//  main.swift
//  继承
//
//  Created by 李南江 on 15/4/4.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation

/*
继承语法
继承是面向对象最显著的一个特性, 继承是从已经有的类中派生出新的类
新的类能够继承已有类的属性和方法, 并能扩展新的能力
术语: 基类(父类, 超类), 派生类(子类, 继承类)
语法:
 class 子类: 父类{
}

继承有点: 代码重用
继承缺点: 增加程序耦合度, 父类改变会影响子类
注意:Swift和OC一样没有多继承
*/

class Man {
    var name:String = "lnj"
    var age: Int = 30
    func sleep(){
        print("睡觉")
    }
}

class SuperMan: Man {
    var power:Int = 100
    func fly(){
        // 子类可以继承父类的属性
        print("飞 \(name) \(age)")
    }
}
var m = Man()
m.sleep()
//m.fly() // 父类不可以使用子类的方法

var sm = SuperMan()
sm.sleep()// 子类可以继承父类的方法
sm.fly()


/*
super关键字:
 
派生类中可以通过super关键字来引用父类的属性和方法
*/

class Man2 {
    var name:String = "lnj"
    var age: Int = 30
    func sleep(){
        print("睡觉")
    }
}

class SuperMan2: Man2 {
    var power:Int = 100
    func eat()
    {
        print("吃饭")
    }
    func fly(){
        // 子类可以继承父类的属性
        print("飞 \(super.name) \(super.age)")
    }
    func eatAndSleep()
    {
        eat()
        super.sleep()
        // 如果没有写super, 那么会现在当前类中查找, 如果找不到再去父类中查找
        // 如果写了super, 会直接去父类中查找
    }
}
var sm2 = SuperMan2()
sm2.eatAndSleep()

/*
方法重写: override
重写父类方法, 必须加上override关键字
*/

class Man3 {
    var name:String = "lnj"
    var age: Int = 30
    func sleep(){
        print("睡觉")
    }
}

class SuperMan3: Man3 {
    var power:Int = 100
    // override关键字主要是为了明确表示重写父类方法, 
    // 所以如果要重写父类方法, 必须加上override关键字
    override func sleep() {
//        sleep() // 不能这样写, 会导致递归
        super.sleep()
        print("子类睡觉")
    }
    func eat()
    {
        print("吃饭")
    }
    func fly(){
        // 子类可以继承父类的属性
        print("飞 \(super.name) \(super.age)")
    }
    func eatAndSleep()
    {
        eat()
        sleep()
    }

}
var sm3 = SuperMan3()
// 通过子类调用, 优先调用子类重写的方法
//sm3.sleep()
sm3.eatAndSleep()


/*
重写属性
无论是存储属性还是计算属性, 都只能重写为计算属性
*/

class Man4 {
    var name:String = "lnj" // 存储属性
    var age: Int { // 计算属性
        get{
            return 30
        }
        set{
            print("man new age \(newValue)")
        }
    }
    func sleep(){
        print("睡觉")
    }
}
class SuperMan4: Man4 {
    var power:Int = 100
    // 可以将父类的存储属性重写为计算属性
    // 但不可以将父类的存储属性又重写为存储属性, 因为这样没有意义
//    override var name:String = "zs"
    override var name:String{
        get{
            return "zs"
        }
        set{
            print("SuperMan new name \(newValue)")
        }
    }
    // 可以将父类的计算属性重写为计算属性, 同样不能重写为存储属性
    override var age: Int { // 计算属性
        get{
            return 30
        }
        set{
            print("superMan new age \(newValue)")
        }
    }
}
let sm4 = SuperMan4()
// 通过子类对象来调用重写的属性或者方法, 肯定会调用子类中重写的版本
sm4.name = "xxx"
sm4.age = 50


/*
重写属性的限制
1.读写计算属性/存储属性, 是否可以重写为只读计算属性? (权限变小)不可以
2.只读计算属性, 是否可以在重写时变成读写计算属性? (权限变大)可以
3.只需
*/
class Man5 {
    var name:String = "lnj" // 存储属性
    var age: Int { // 计算属性
        get{
            return 30
        }
        set{
            print("man new age \(newValue)")
        }
    }
    func sleep(){
        print("睡觉")
    }
}
class SuperMan5: Man5 {
    var power:Int = 100
    override var name:String{
        get{
            return "zs"
        }
        set{
            print("SuperMan new name \(newValue)")
        }
    }
    override var age: Int { // 计算属性
        get{
            return 30
        }
        set{
            print("superMan new age \(newValue)")
        }
    }
}



/*
重写属性观察器
只能给非lazy属性的变量存储属性设定属性观察器, 
不能给计算属性设置属性观察器,给计算属性设置属性观察器没有意义
属性观察器限制:
    1.不能在子类中重写父类只读的存储属性
    2.不能给lazy的属性设置属性观察器
*/

class Man6 {
    var name: String = "lnj"
    var age: Int = 0 { // 存储属性
        willSet{
            print("super new \(newValue)")
        }
        didSet{
            print("super new \(oldValue)")
        }
    }
    var height:Double{
        get{
            print("super get")
            return 10.0
        }
        set{
            print("super set")
        }
    }
}
class SuperMan6: Man6 {
    // 可以在子类中重写父类的存储属性为属性观察器
    override var name: String {
        willSet{
            print("new \(newValue)")
        }
        didSet{
            print("old \(oldValue)")
        }
    }
    // 可以在子类中重写父类的属性观察器
    override var age: Int{
        willSet{
            print("child new \(newValue)")
        }
        didSet{
            print("child old \(oldValue)")
        }

    }
    // 可以在子类重写父类的计算属性为属性观察器
    override var height:Double{
        willSet{
            print("child height")
        }
        didSet{
            print("child height")
        }
    }
}

var m6 = SuperMan6()
//m6.age = 55
//print(m.age)
m6.height = 20.0


/*
利用final关键字防止重写
final关键字既可以修饰属性, 也可以修饰方法, 并且还可以修饰类
被final关键字修饰的属性和方法不能被重写
被final关键字修饰的类不能被继承
*/
final class Man7 {
    final var name: String = "lnj"
    final var age: Int = 0 { // 存储属性
        willSet{
            print("super new \(newValue)")
        }
        didSet{
            print("super new \(oldValue)")
        }
    }
    final var height:Double{
        get{
            print("super get")
            return 10.0
        }
        set{
            print("super set")
        }
    }
    final func eat(){
        print("吃饭")
    }
}


