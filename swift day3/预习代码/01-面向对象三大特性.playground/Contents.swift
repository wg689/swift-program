//: Playground - noun: a place where people can play

import UIKit

// 特性一: 继承
class Person {
    var name : String = ""
    var age : Int = 0
    
    func study() {
        print("人在学习")
    }
    
    required init() {
        
    }
    
    init(name : String, age : Int) {
        self.name = name
        self.age = age
    }
}

class Student : Person {
    var sno : Int = 0
    
    init(name : String, age : Int, sno : Int) {
        self.sno = sno
        
        super.init(name: name, age: age)
    }
    
    // 方法的重写:在swift中如果对父类的方法不满意,可以对父类的方法进行重写.但是必须在前面加上override
    override func study() {
        print("学生在学习")
    }

    required init() {
        fatalError("init() has not been implemented")
    }
}

/*
let stu = Student(name: "lmj", age: 19)
stu.name = "why"
stu.age = 18
stu.study()
*/

let stu = Student(name: "why", age: 18, sno: 110)


// 2.方法的重载
// 方法的重载有两层含义: 1.参数的类型不同 2.参数的个数不同
class MathTool {
    func sum(num1 : Int, num2 : Int) -> Int {
        return num1 + num2
    }
    
    func sum(num1 : Int, num2 : Int, num3 : Int) -> Int {
        return num1 + num2 + num3
    }
    
    func sum(num1 : Double, num2 : Double) -> Double {
        return num1 + num2
    }
}

let math = MathTool()
math.sum(10, num2: 20)

math.sum(20.5, num2: 11.5)


// 3.多态
func stutyInNight(p : Person) {
    p.study()
}


stutyInNight(stu)




