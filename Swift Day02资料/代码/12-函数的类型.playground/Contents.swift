//: Playground - noun: a place where people can play

import UIKit

// 函数式编程: Lisp --> 天才程序员会使用的语言 --> 现代语句到达的高度 --> 1960+的高度 --> 人工智能

var view : UIView = UIView()
let alpha = view.alpha

view = UIView()

// 1.定义函数
func addTwoInts(num1 : Int, num2 : Int) -> Int {
    return num1 + num2
}

func multiplyTwoInts(num1 : Int, num2 : Int) -> Int {
    return num1 * num2
}

// (Int, Int) -> Int 函数的类型
var mathFunc : (Int, Int) -> Int = addTwoInts
let result = mathFunc(20, 30)
print(result)

mathFunc = multiplyTwoInts
let result1 = mathFunc(20, 30)
print(result1)


// 2.让函数作为方法的参数
func printResult(a : Int, b : Int, mathFunc : (Int, Int) -> Int) {
    print(mathFunc(a, b))
}

printResult(10, b: 20, mathFunc: addTwoInts)
printResult(10, b: 20, mathFunc: multiplyTwoInts)


// 3.让函数作为方法的返回值
var num = 1000

func getMathFunc(num : Int) -> (Int) -> Int {
    
    func forward(num : Int) -> Int {
        return num + 1
    }
    
    func backward(num : Int) -> Int {
        return num - 1
    }
    
    return num >= 0 ? backward : forward
}

while num != 0 {
    let stepFunc = getMathFunc(num)
    num = stepFunc(num)
    print(num)
}







