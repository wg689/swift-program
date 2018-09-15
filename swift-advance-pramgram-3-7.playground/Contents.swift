//: Playground - noun: a place where people can play

import UIKit

//*******元祖的使用*******
// 1.使用数组定义一组数据
let infoArray : [NSObject] = ["why", 18, 1.88]
let nameArray = infoArray[0]
// let nameCount = nameArray.characters

// 2.使用字典定义一组数据
let infoDict : [String : NSObject] = ["name" : "why", "age" : 18, "height" : 1.88]
let nameDict = infoDict["name"]
// let nameCount = nameDict.characters

// 3.使用元组定义一组数据
// 3.1.元组的基本定义
let infoTuple = ("why", 18, 1.88)
let nameTuple = infoTuple.0
let nameCount = nameTuple.characters.count

let ageTuple = infoTuple.1


// 3.2.给元组中元素起别名
let infoTuple1 = (name : "why", age : 18, height : 1.88)

infoTuple1.name
infoTuple1.age
infoTuple1.height

// 3.3.少见的方式: 别名就是元组的名称
let (name, age, height) = ("why", 18, 1.88)
name
age
height




//*******可选类型*******
// 1.可选类型定义
// Optional泛型集合
// var name : Optional<String> = nil // 不常见
var nameo : String? = nil // String? 语法糖

// 2.给可选类型赋值
nameo = "why" // Optional("why")


// 3.从可选类型中取值
// 3.1.取出可选类型
print(name) // Optional("why")
// 3.2.取出具体的值: 可以通过对可选类型进行解包: 可选类型 + !
// print(name!)

// 4.强制解包:可选类型+!
// 注意:强制解包非常危险,如果可选类型中是一个空值,那么强制解包程序会崩溃
// 因此最好在解包前对可选类型进行判断,判断是否有值
if nameo != nil {
    print(nameo!)
    print(nameo!)
    print(nameo!)
    print(nameo!)
    print(nameo!)
}

// 5.可选绑定: 就是在对可选类型进行解包
// 1> 判断name是否有值,如果没有值,者直接不执行{}
// 2> 如果name有值,那么会对name进行解包,之后将解包后的结果赋值给前面的tempName
/*
if let tempName = name {
print(tempName)
print(tempName)
print(tempName)
print(tempName)
print(tempName)
}
*/
if let nameo = nameo {
    print(nameo)
    print(nameo)
}

//*******可选类型应用场景*******

// 1.应用场景一:
let str = "123"
let result : Int? = Int(str)

// 2.应用场景二:
let urlString = "http://www.520it.com"
let url : NSURL? = NSURL(string: urlString)

if url != nil {
    let request = NSURLRequest(URL: url!)
}

if let url = url {
    let request = NSURLRequest(URL: url)
}

// 3.应用场景三:
let path : String? = NSBundle.mainBundle().pathForResource("123.plist", ofType: nil)

if let path = path {
    NSArray(contentsOfFile: path)
}


//*******类型转化*******
// 1.is的使用: 判断NSObject是否是某种具体的类型
let array : [NSObject] = ["why", 18, 1.88]
let item = array[0]

if item is String {
    print("第一个元素是一个字符串")
} else {
    print("第一个元素不是一个字符串")
}

// 2.as
// 2.1.as的使用
let strC = "/Users/apple/Desktop"
(strC as NSString).stringByAppendingPathComponent("123.txt")

// 2.2.as? --> 将NSObject转成一个具体的类型
// 判断item是否可以转成String类型,如果不可以返回nil
// 如果可以转成对应的类型,则返回具体值
// 因此最终的结果是一个可选类型
let itemStr = item as? String

// 2.3.as! --> 直接转成具体的类型(不建议使用)
// 注意:如果转成不成功,程序会直接崩溃

//*******类型转化练习*******
let infoDictP = ["name" : "why", "age" : 18, "height" : 1.88]


// 1.取出姓名(NSObject?)
let value : NSObject? = infoDictP["name"]

// 2.取出具体的姓名
if let value = value {
let name : String? = value as? String

if let name = name {
  print(name)
  }
}


// 可选绑定(了解)
if let name = infoDict["name"] as? String {
    print(name.characters.count)
}




//*******函数*******
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

let resultF = sum(10, num2: 30, num3: 20)


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




//*******函数的使用注意*******
// 1.内部参数(名称)和外部参数(名称)
/*
内部参数:在函数内部可以看到的参数名称就是内部参数. 默认情况下,所有的参数都是内部参数
外部参数:在函数外部可以看到的参数名称就是外部参数. 默认情况下从第二个参数开始就是外部参数.
如果希望第一个参数也是外部参数: 可以在第一个参数的标识符前加上外部参数的名称
如果希望第二参数开始都不是外部参数,那么可以在第二个参数(或者之后)标识符前加上 _
*/
func sum(num1 : Int,  num2 : Int, _ num3 : Int) -> Int {
    return num1 + num2 + num3
}

//sum(20, 30, 40)
sum(1, num2: 2, 3)

//*******函数使用注意(默认参数)*******
// 默认参数 --> 程序员 鼓励师
func makeCoffee(coffeeName : String = "雀巢") -> String {
    return "制作了一杯爱心 \(coffeeName)咖啡"
}

makeCoffee("拿铁")
makeCoffee("摩卡")

makeCoffee()





