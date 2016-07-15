//
//  main.swift
//  构造方法2
//
//  Created by 李南江 on 15/4/4.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation

/*
继承与构造方法:
指定构造与便利构造方法
*/

class Person {
    var name:String
    var age:Int
    // 指定构造方法都是以init开头的
    init(name:String, age:Int)
    {
        self.name = name
        self.age = age
    }
    // 如果是值类型没问题, 称之为构造器代理
    // 但如果是引用类型会报错, 需要在前面加上convenience关键字
    // 被convenience关键字修饰的构造方法称之为便利构造器, 通过调用其它构造方法来初始化
    // 反而言之, 便利构造器中一定是调用其它构造方法初始化的, 一定要出现self.init
    convenience init()
    {
      
//        self.name = "lnj"
//        self.age = 30
        self.init(name:"lnj", age:30)
    }
    // 类可以拥有多个构造方法
    init(name:String)
    {
        self.name = name
        self.age = 0
        // 不能在指定构造方法中调用便利构造方法
        // 也就是说指定构造方法中不能出现self.init
//        self.init()
    }
    
    convenience init(age:Int)
    {
        // 可以在便利构造器中调用指定构造器
//        self.init(name:"lnj", age:30)
        // 可以在便利构造器中调用便利构造器
        self.init()
    }
    // 便利构造器不能和指定构造器同名
//    convenience init(name:String)
//    {
//    }
}


/*
派生类的构造方法
*/

class Man {
    var name:String
    // 指定构造方法
    init(name:String){
        self.name = name
    }
    // 便利构造方法
    convenience init(){
        self.init(name:"lnj")
    }
}
class SuperMan: Man {
    var age: Int
    // 注意; 1.默认情况下构造方法不会被继承
    // 2.基类的存储属性只能通过基类的构造方法初始化
    // 3.初始化存储属性时必须先初始化当前类再初始化父类
    // 4.不能通过便利构造方法初始化父类, 只能通过调用指定构造方法初始化父类
    // 指定构造器
    init(age:Int){
        self.age = age
        super.init(name: "lnj")
//        super.init()
    }
}



/*
构造器间的调用规则
>指定构造器必须调用其直接父类的"指定构造器"
>便利构造器必须调用同类中的其它构造器(指定或便利)
>便利构造器必须最终以调用一个指定构造器结束(无论调用的时指定还是便利, 最终肯定会调用一个指定构造器)
*指定构造器总是向上代理(父类)
*便利构造器总是横向代理(当前类)
*/

class Man2 {
    var name:String
    // 指定构造方法
    init(name:String){
        self.name = name
    }
    // 便利构造方法
    convenience init(){
        self.init(name:"lnj")
    }
}
class SuperMan2: Man2 {
    var age: Int
    // 指定构造器
    init(age:Int){
        self.age = age
        super.init(name: "lnj")
    }
    convenience init(){
        self.init(age:30)
    }
    convenience init(name:String, age:Int){
        // 调用子类构造器一定能够初始化所有属性
//        self.init(age:30)
        // 便利构造器中只能通过self.init来初始化, 不能使用super.init
        // 因为调用父类构造器不一定能完全初始化所有属性(子类特有)
//        super.init(name: "lnj")
        self.init()
    }
}


/*
两段式构造- 构造过程可以划分为两个阶段
1.确保当前类和父类所有存储属性都被初始化
2.做一些其它初始化操作
> 好处: 1.可以防止属性在被初始化之前访问, 2.可以防止属性被另外一个构造器意外赋值
注意:构造器的初始化永远是在所有类的第一阶段初始化完毕之后才会开始第二阶段

编译器安全检查:
1.必须先初始化子类特有属性, 再向上代理父类指定构造方法初始化父类属性
2.只能在调用完父类指定构造器后才能访问父类属性
3.在遍历构造器中, 必须先调用同类其它构造方法后才能访问属性
4.第一阶段完成前不能访问父类属性/也不能引用self和调用任何实例方法
*/

class Man3 {
    var name:String
    // 指定构造方法
    init(name:String){
        self.name = name
    }
    // 便利构造方法
    convenience init(){
        self.init(name:"lnj")
    }
}
class SuperMan3: Man3 {
    var age: Int
    // 指定构造器
    init(age:Int){
        print("SuperMan第一阶段开始")
        // 对子类引入的属性初始化
        self.age = age
        // 代码会报错,因为调用self.name之前还没有对父类的name进行初始化
        // 即便在这个地方修改, 也会被后面的初始化语句覆盖
//        if (age > 30){
//            self.name = "zs"
//        }
        // 对父类引入的属性进行初始化
        super.init(name: "lnj")
        
        print("SuperMan第二阶段开始")
        if age > 30 {
            self.name = "zs"
        }
    }
}
class MonkeyMan:SuperMan3{
    var height:Double
    init(height:Double){
        print("MonkeyMan第一阶段开始")
        // 对子类引入的属性初始化
        self.height = 99.0
        // 对父类引入的属性进行初始化
        super.init(age: 30)
        
        print("MonkeyMan第二阶段开始")
        if height < 100.0{
            self.age = 50
        }
    }
}
var m = MonkeyMan(height: 20)


/*
重写指定构造方法: 子类的构造方法和父类的一模一样
*/

class Man4 {
    var name:String
    // 指定构造方法
    init(name:String){
        self.name = name
    }
}
class SuperMan4: Man4 {
    var age: Int
    init(){
        self.age = 30
        super.init(name: "lnj")
    }
    // 如果子类中的构造器和父类一模一样, 必须加上override关键字, 表示重写父类方法
    // 在老版本的Swift语言中是不需要override关键字的, 新版本才推出的
//    override init(name:String){
//        self.age = 30
//        super.init(name: name)
//    }
    
    // 将父类的指定构造器重写成一个便利构造器, 也必须加上override关键字, 表示重写父类方法
    convenience override init(name:String){
        self.init(name:name)
        self.age = 30
    }
}


/*
便利构造方法不存在重写
*/

class Man5 {
    var name:String
    // 指定构造方法
    init(name:String){
        self.name = name
    }
    convenience init(){
        self.init(name:"lnj")
    }
}
class SuperMan5: Man5 {
    var age: Int
    init(age:Int){
        self.age = age
        super.init(name: "lnj")
    }
    // Swift中便利构造方法不存在重写, 如果加上override关键字, 系统会去查找父类中有没有和便利构造方法一样的指定构造方法, 有旧不报错, 没有就报错
    // 为什么便利构造器不能重写呢? 因为便利构造器只能横向代理, 只能调用当前类的其它构造方法或指定方法, 不可能调用super. 所以不存在重写
    // 也就是说子类的便利构造方法不能直接访问父类的便利构造方法, 所以不存在重写的概念
    convenience init(){
        self.init(age:30)
    }
}
// 早期版本中如果字符类中有同名便利构造器会报错
var sm = SuperMan5()



/*
构造方法的自动继承
> 如果子类中没有定义任何构造器, 且子类中所有的存储属性都有缺省值, 会继承父类中所有的构造方法(包括便利构造器)
> 如果子类中只是重写了父类中的某些指定构造器, 不管子类中的存储属性是否有缺省值, 都不会继承父类中的其它构造方法
>如果子类重写了父类中所有的指定构造器, 不管子类中的存储属性是否有缺省值, 都会同时继承父类中的所有便利方法
*/

class Person6 {
    var name:String
    var age:Int
    init(name:String, age:Int){
        self.name = name
        self.age = age
    }
    init(name:String){
        self.name = name
        self.age = 0
    }
    convenience init(){
        self.init(name:"lnj")
    }
}
class SuperMan6: Person6 {
//    var height:Double = 175.0
    var height:Double
    
    init(height:Double){
        self.height = height
        super.init(name: "lnj", age: 30)
    }
    
    override init(name:String, age:Int){
       self.height = 175.0
       super.init(name: name, age: age)
    }
    override init(name:String){
        self.height = 175.0
        super.init(name: name)
    }
}
// 如果子类中没有定义任何构造器, 且子类中所有的存储属性都有缺省值, 会继承父类中所有的构造方法(包括便利构造器)
// 父类的存储属性是由父类的构造器初始化, 子类的存储属性是由缺省值初始化的
//var sm = SuperMan(name: "lnj", age: 30)
//var sm = SuperMan(name: "zs")
//var sm = SuperMan()
//print(sm.height)

// 如果子类中只是重写了父类中的某些指定构造器, 不管子类中的存储属性是否有缺省值, 都不会继承父类中的其它构造方法
//var sm = SuperMan(height: 188.0)

// 如果子类重写了父类中所有的指定构造器, 不管子类中的存储属性是否有缺省值, 都会同时继承父类中的所有便利方法
var sm6 = SuperMan6()


/*
必须构造器:
只要在构造方法的前面加上一个required关键字, 那么所有的子类(后续子类)只要定义了构造方法都必须实现该构造方法

*/
class Person7 {
    var name:String
    // 早期Swift版本中没有这个语法
    required init(name:String){
        self.name = name
    }
}
class SuperMan7: Person7 {
    var age:Int = 30
    // 如果子类没有定义构造器, 可以不用重写
    init(){
        self.age = 30
        super.init(name: "lnj")
    }
    // 1.如果子类自定义了构造器, 就必须重写"必须构造器"
    // 因为如果子类没有自定义任何构造器, 默认会继承父类构造器, 所以不用重写
    // 2.重写必须构造器不用加override关键字, 因为系统看到required关键字就会自动查看父类
    // 为什么重写了还需要加上required关键字, 因为所有后续子类都必须重写
    required init(name: String) {
        self.age = 30
        super.init(name:name)
    }
}
var sm7 = SuperMan7(name: "lnj")

