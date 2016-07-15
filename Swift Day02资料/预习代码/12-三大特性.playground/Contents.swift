//: Playground - noun: a place where people can play

import UIKit

class Person {
    var name : String = ""
    var age : Int = 0
    
    func readBook() {
        print("人在读书")
    }
}


class Student : Person {
    var sno : Int = 0
    
    // 在swift中如果对父类的方法不满意,可以对父类方法进行重写,但是在重写时,必须前面加override
    override func readBook() {
        print("学生在读书学习")
    }
}

let stu = Student()
stu.name = "why"
stu.age = 18
stu.sno = 110
//stu.readBook()

func study(p : Person) {
    p.readBook()
}

study(stu)

let dict = ["name" : "why", "age" : 18]
let name = dict["name"]

if name! is String {
    print("---")
}

print(name.dynamicType)
