//
//  main.swift
//  下表subscripts
//
//  Created by 李南江 on 15/4/4.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation
/*
subscripts(下标): 访问对象中数据的快捷方式
所谓下标脚本语法就是能够通过, 实例[索引值]来访问实例中的数据
类似于以前我们访问数字和字典, 其实Swift中的数组和字典就是一个结构体

Array:      subscript (index: Int) -> T
Dictionary: subscript (key: Key) -> Value?
arr[0] == arr.subscript(0)
dict["key"] == dict.subscript("key")
*/

struct Student {
    var name:String = "lnj"
    var math:Double = 99.0
    var chinese:Double = 99.0
    var english:Double = 99.0
    
    func score(course:String) ->Double?
    {
        switch course{
            case "math":
                return math
            case "chinese":
                return chinese
            case "english":
                return english
            default:
                return nil
        }
    }
    // 要想实现下标访问, 必须实现subscript方法
    // 如果想要通过下标访问, 必须实现get方法
    // 如果想要通过下表赋值, 必须实现set方法
    subscript(course:String) ->Double?{
        get{
            switch course{
            case "math":
                return math
            case "chinese":
                return chinese
            case "english":
                return english
            default:
                return nil
            }
        }
        set{
            switch course{
            case "math":
                // 因为返回的是可选类型
                math = newValue!
            case "chinese":
                chinese = newValue!
            case "english":
                english = newValue!
            default:
                print("not found")
            }

        }
    }
}
var stu = Student(name: "zs", math: 99.0, chinese: 88.0, english: 10.0)
print(stu.score("math"))
stu["chinese"] = 100.0
print(stu["chinese"])


/*
Swift中是允许多索引的下标的
*/
struct Mul {
    subscript(a:Int, b:Int) -> Int
    {
        return a * b
    }
}
var m = Mul()
print(m[3, 5])


