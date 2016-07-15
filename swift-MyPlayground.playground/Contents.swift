//: Playground - noun: a place where people can play

import UIKit
//: Playground - noun: a place where people can play

//import Cocoa

var str = "Hello, playground"
print("Hello. world")

/*****变量****/
var myVariable = 1
var floatValue : float_t
floatValue = 4
myVariable = 3
let myConstant : Int
myConstant = 2

/*****常量****/
let label = "The width is"
let width = 100
let labelWidth = label + " " + String(width)
let labelWidth2 = "\(label) \(String(width))"

/*********/
let apples = 9.0
let oranges = 10.0
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples + oranges) pieces of fruit"

/*****数组字典****/
var shoppingList = ["fish","water"]
var shoppingPrice = [13,3]
shoppingList[1] = "apple"
var shoppingDic = ["name":"fish", "price":12,1:2]
var price = shoppingDic["price"]
shoppingDic["price"] = "12"

let vegeatble = "red pepper"

switch vegeatble {
    case "celety":
     print("aaa")
    case "celety","wat":
    print("1111")
  case  let x where x.hasPrefix("red"):
    print("hahh")
default :
    print("meiyou  ")
}

for name: Int in shoppingPrice {
        print(name)
}

var ssdfd = NSMutableArray()
ssdfd[0] = 20
print(ssdfd)

/*******/
var largest = 0
var largestkind = ""
let intersestingNumber = ["prime":[1,2,3,45],"squre":[1,2,3,4,5,6]]
for(key,value) in intersestingNumber{
    for number in value{
        if number > largest{
            largest = number
            largestkind = key
        }
    }
}
print(largestkind)
print(largest)

/********/
let individualScore = [10,9,33,1,11]
var teamScore = 0
for score in individualScore{
    if score > 50 {
        teamScore += 3
    }else{
        teamScore += 1
    }
}

print( teamScore)

/*******/
var conditionValue = 1
if conditionValue < 2{
    print(conditionValue)
}

/****/
var optionalString :String? = "hello "
print(optionalString == nil)


var optionalName:String? = "swift"
var greeting = "hello!"

if let name = optionalName {
    greeting = "hello!"
}else{
    print(optionalName)
}

let nickname :String? = nil

let fullName: String = "swift"
let infromalGreeting = "Hi\(nickname ?? fullName)"

/**多个相同类型的参数**/
func sunof(numbers:Int...)->Int{
    var sum = 0
    for number in numbers{
        sum += number
    }
    return sum
}
print(sunof())
print(sunof(1,2,3))



















