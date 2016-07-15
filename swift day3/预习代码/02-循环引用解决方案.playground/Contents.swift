//: Playground - noun: a place where people can play

import UIKit

class Student {
    var book : Book?
    
    deinit {
        print("Student -- deinit")
    }
}


class Book {
    // weak var owner : Student?
    unowned var owner : Student = Student()
    
    deinit {
        print("Book -- deinit")
    }
}


// 1.创建对象
var stu : Student? = Student()
var book : Book? = Book()

// 2.设置对象间的关系
stu?.book = book
//book?.owner = stu!
//stu = nil
//book = nil