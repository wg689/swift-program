//: Playground - noun: a place where people can play

import UIKit

// 1.定义一个函数
func sumTwoInts(num1 : Int, num2 : Int) -> Int {
    return num1 + num2
}

// (Int, Int) -> Int
var mathFunction : (Int, Int) -> Int = sumTwoInts
// print(mathFunction(20, 10))


func multiplyTwoInts(num1 : Int, num2 : Int) -> Int {
    return num1 * num2
}

mathFunction = multiplyTwoInts
// print(mathFunction(20, 10))


// 2.将函数作为方法的参数进行传递
func printResult(num1 : Int, num2 : Int, mathFunc : (Int, Int) -> Int) {
    print(mathFunc(num1, num2))
}

// printResult(10, num2: 20, mathFunc: multiplyTwoInts)


// 3.将函数作为方法的返回值
var m = -8

func stepForward(num : Int) -> Int {
    return num + 1
}

func stepBackward(num : Int) -> Int {
    return num - 1
}

/*
var stepFunc : (Int) -> Int
if m < 0 {
    stepFunc = stepForward
} else {
    stepFunc = stepBackward
}
*/
func getStepFunc(num : Int) -> (Int) -> Int {
    return num < 0 ? stepForward : stepBackward
}

let stepFunc = getStepFunc(m)

while m != 0 {
    m = stepFunc(m)
    print(m)
}

