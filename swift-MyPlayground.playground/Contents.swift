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

/******/
var factorial = 5
for i in 1..<5 {
    factorial = (5 - i)*factorial
}
print(factorial)

var factorialTwo = 5
for var i = 1; i < 5; i++ {
    factorialTwo = (5 - i)*factorialTwo
}
print(factorialTwo)

/*****while***/
var whileNumber = 2
while whileNumber < 5 {
    whileNumber+=1
}
print(whileNumber)

var whileNumber2 = 2
repeat {
   whileNumber2 += 1
} while whileNumber2<3

print(whileNumber2)

/**函数**/
var nameAndDay = ""
func greeet(name: String,day:String,number:Int) -> String{
    return "hello \(name),today is\(day),\(number)"
}


nameAndDay = greeet("wangggang", day: "27", number: 12)
print(nameAndDay)

/****元祖****/
func calculate(scores: [Int]) -> (min:Int ,max:Int ,sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max {
            max = score
        }else if score < min{
            min = score
        }
        sum += score
    }
    return (min,max,sum)
}
let statistics = calculate([1,5,17,6])
print(statistics)
print(statistics.1)

/***函数作为返回类型***/
func makeIncrementer() -> ((Int,Int) ->Int){
    func addone(number:Int,second:Int) -> Int{
        return number + second
    }
    //返回一个函数
    return addone
}
var increment = makeIncrementer()
print(increment(1,2))

/*******/
func square(a:Float) -> Float {
    return a*a
}

func cube(a:Float) -> Float{
    return a*a*a
}

func averageSumOfSquare(a:Float,b:Float) -> Float{
    return (square(a) + square(b))/2
}

func averageSumOfCube(a:Float,b:Float) -> Float
{
    return (cube(a)+cube(b))/2
}

averageSumOfCube(2, b: 3)
averageSumOfCube(1, b: 2)

/***函数作为参数**/
func averageSum(a:Float,b:Float,f:(Float -> Float)) -> Float{
    return(f(a) + f(b))/2.0
}
averageSum(2.0, b: 3.0, f: square)
averageSum(3.0, b: 3.0, f: cube)

let 


















