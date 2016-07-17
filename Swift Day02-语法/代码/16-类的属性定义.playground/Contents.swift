//: Playground - noun: a place where people can play

import UIKit

// 1.定义类
class Student {
    // 1.定义存储属性
    var name : String = ""
    var age : Int = 0
    var mathScore : Double = 0.0
    var chineseScore : Double = 0.0
    
    // 2.定义计算属性
    // 通过某种方式计算得来的属性,叫做计算属性
    var averageScore : Double {
        return (mathScore + chineseScore) * 0.5
    }
    
    // 3.定义类属性: 使用static修饰
    // 类属性必须是通过类名进行访问
    static var courseCount : Int = 0
}


// 2.创建对象,并且给属性赋值
let stu = Student()
stu.name = "lmj"
stu.age = 19
stu.mathScore = 80
stu.chineseScore = 60


// 3.获取上述童鞋的平均成绩
print(stu.averageScore)


// 4.访问类属性
Student.courseCount = 2








