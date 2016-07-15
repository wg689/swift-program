//: Playground - noun: a place where people can play

import UIKit

class Student {
    // 1.存储属性
    var name : String = ""
    var age : Int = 0
    var mathScore : Double = 0
    var chineseScore : Double = 0
    
    // 2.提供了函数,可以获取平均成绩
    /*
    func getAverageScore() -> Double {
        return (mathScore + chineseScore) * 0.5
    }
    */
    // 3.通过计算属性获取平均成绩
    /*
     1.如果一个计算属性只有get方法,那么该属性称之为只读属性
        如果只有get方法,那么get{}可以省略
     2.如果有写set方法,在set方法中有一个newValue常量,用于保存外界传入的值
        也可以给newValue起一个新的名字,在set后面跟上(newScore)
    */
    /*
    var averageScore : Double {
        get {
            return (mathScore + chineseScore) * 0.5
        }
        
        set (newScore) {
            chineseScore = newScore * 2 - mathScore
        }
    }
    */
    
    var averageScore : Double {
        return (mathScore + chineseScore) * 0.5
    }
    
    // 4.类属性:和整个类相关的属性,并且是通过类进行访问的
    static var courseCount : Int = 0
}

// 1.创建Student对象
let stu = Student()
stu.name = "why"
stu.age = 10
stu.mathScore = 100
stu.chineseScore = 90

print(stu.mathScore)

// 2.计算该学生的平均成绩
// print(stu.getAverageScore())
print(stu.averageScore)
//stu.averageScore = 98
print(stu.chineseScore)

// 3.设置学生的课程数
Student.courseCount = 2
