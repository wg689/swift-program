//: Playground - noun: a place where people can play
import UIKit


// 1.定义两个类
class Student {
    var book : Book?
    var name : String?
    
    deinit {
        print("Student---deinit")
    }
}

class Book {
    // unowned不能指向nil
    unowned var owner : Student = Student()
    
    deinit {
        print("Book---deinit")
    }
}


// 2.创建对象
var stu : Student? = Student()
var book : Book? = Book()

// print(book?.owner.name) 访问僵尸对象

stu?.book = book
book?.owner = stu!

stu = nil
book = nil

/*
对象的销毁顺序
1.Book中的owner属性指向的Student对象,在27行过去之后就会销毁
2.创建的stu对象,在34行销毁掉
3.创建的Book对象,在35行销毁掉
*/





