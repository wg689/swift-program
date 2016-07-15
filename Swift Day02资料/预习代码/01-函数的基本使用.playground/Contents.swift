//: Playground - noun: a place where people can play

import UIKit

// 1.没有参数没有返回值的函数
func about() -> Void {
    print("iPhone6 Plus")
}

func about1() -> Void {
    print("iPhone6s Plus")
}

// 2.没有参数有返回值的函数
func readMessage() -> String {
    return "吃饭了吗?"
}

// 3.有参数,没有返回值的函数
func callPhone(phoneNum : String) {
    print("打电话给:\(phoneNum)")
}

// 4.有参数有返回值的函数
func sum(num1 : Int, num2 : Int) -> Int {
    return num1 + num2
}

// 5.有参数有多个返回值的函数
let nums = [1, 3, 6, 8, 12, 11, 22, 24]

func getNumberCount(nums : [Int]) -> (Int, Int) {
    var oddCount = 0
    var evenCount = 0
    
    for num in nums {
        if num % 2 == 0 {
            oddCount++
        } else {
            evenCount++
        }
    }
    
    return (oddCount, evenCount)
}

let count = getNumberCount(nums)
count.0
count.1