//: Playground - noun: a place where people can play

import UIKit

// 函数的嵌套使用
func test() {
    func demo() {
        print("demo")
    }
    
    print("test")
    demo()
}

test()
