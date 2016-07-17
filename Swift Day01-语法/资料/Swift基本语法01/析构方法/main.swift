//
//  main.swift
//  析构方法
//
//  Created by 李南江 on 15/4/5.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation

/*
析构方法
对象的内存被回收前夕被隐式调用的方法, 对应OC的dealloc方法
主要执行一些额外操作, 例如释放一些持有资源, 关闭文件, 断开网络等
*/

class FileHandler{
    var fd: Int32? // 文件描述符
    // 指定构造器
    init(path:String){
        // 需要打开的文件路径, 打开方式(只读)
        // open方法是UNIX的方法
        let ret = open(path, O_RDONLY)
        if ret == -1{
            fd = nil
        }else{
            fd = ret
        }
        print("对象被创建")
    }
    // 析构方法
    deinit{
        // 关闭文件
        if let ofd = fd{
             close(ofd)
        }
        print("对象被销毁")
    }
}

var fh:FileHandler? = FileHandler(path: "/Users/Jonathan_Lee/Desktop/老员工奖.xlsx")
// 当对象没有任何强引用时会被销毁
fh = nil



/*
析构方法的自动继承
父类的析构方法会被自动调用, 不需要子类管理
*/
class Person {
    var name:String
    init(name:String){
        self.name = name
        print("Person init")
    }
    deinit{
        print("Person deinit")
    }
}

class SuperMan: Person {
    var age:Int
    init(age:Int){
        self.age = age
        super.init(name: "lnj")
        print("SuperMan init")
    }
    deinit{
        // 如果父类的析构方法不会被自动调用,那么我们还需要关心父类
        // 但是如果这样做对子类是比较痛苦的
        print("SuperMan deinit")
    }
}
var sm: SuperMan? = SuperMan(age: 30)
sm = nil
