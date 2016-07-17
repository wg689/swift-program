//: Playground - noun: a place where people can play

import UIKit

// 1.没有参数没有返回值的函数
func about() -> Void {
    print("iPhone 10")
}
about()

func about1() {
    print("iPhone10 plus")
}
about1()


// 2.有参数没有返回值的函数
func callPhone(phoneNum : String) {
    // print("打电话给:" + phoneNum)
    print("打电话给:\(phoneNum)")
}

callPhone("+86 110")


// 3.没有参数有返回值的函数
func readMessage() -> String {
    return "约吗?"
}

let msg : String = readMessage()
print(msg)


// 4.有参数有返回值的函数
func sum(num1 : Int, num2 : Int, num3 : Int) -> Int {
    return num1 + num2
}

let result = sum(10, num2: 30, num3: 20)


func online(age : Int, money : Double, carID : String) {
    guard age >= 18 else {
        print("回家找妈妈")
        return
    }
    
    guard money >= 5 else {
        print("回家拿钱")
        return
    }
    
    guard carID.characters.count == 18 else {
        print("身份证号码不正确")
        return
    }
    
    print("开机上网")
}

online(18, money: 100000, carID: "1234567890")



