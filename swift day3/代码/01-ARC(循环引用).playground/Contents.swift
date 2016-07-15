//: Playground - noun: a place where people can play

import UIKit

// 1.定义两个类
class Student {
    var book : Book?
    
    deinit {
        print("Student---deinit")
    }
}

class Book {
    weak var owner : Student?
    
    deinit {
        print("Book---deinit")
    }
}

// 2.创建对象,并且使用对象之间产生关系
var stu : Student? = Student()
var book : Book? = Book()

stu?.book = book
book?.owner = stu


stu = nil
book = nil