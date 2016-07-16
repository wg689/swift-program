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

//swith语句
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

//数组的遍历
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
//递归
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

let  averageNewSum = averageSum(2, b: 3, f: {(x:Float)-> Float in return x*x})
print(averageNewSum)


let mappedScores = individualScore.map({$0+1})
print(mappedScores)
individualScore.sort(){
    $0 < $1
}
func hasAnyMathes(list:[Int],condition:(Int) -> Bool) ->Bool {
    for item in list {
        if condition(item) {
            return true
            
        }
    }
    return false
}

func lessThanTen (number:Int) -> Bool {
    return number < 10
}

var numbers = [20,13,4,9]

hasAnyMathes(numbers, condition: lessThanTen)

/*****/
let sortedNumbers = numbers.sort(){
    $0 > $1
}
print(sortedNumbers)

/****类****/
class Shap {
    var numberOfSides = 0
    let numberOfPoint = 3
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) sides"
    }
    
    func simplepoint(point:Int) -> Int{
        return point
    }
    
}

var shape = Shap()
shape.numberOfSides = 1
var shapDes = shape.simpleDescription()
print(shapDes)


/**构造器*/
class nameShape {
    var numberOfSides: Int = 0
    var name :String
    init(name:String) {
        self.name = name
    }
    func simpleDescription() -> String{
        return "A shape With a name\(name)"
    }
}
var nameShapenew = nameShape(name:"ssss")
var initName = nameShapenew.simpleDescription()

/**析构器*/
class NameShapeTwo {
    var numberOfSlide: Int
    init(number:Int){
        print("init called")
        self.numberOfSlide = number
    }
    deinit {
        print("denied called")
        numberOfSlide = 0
    }
    func addNumbers(number:Int) {
        numberOfSlide += 3
    }
}

var shapeTwo :NameShapeTwo? = NameShapeTwo(number: 3)
print("numberOfSlides:\(shapeTwo!.numberOfSlide)")
shapeTwo = nil

/****override***/
class Squal: nameShape {
    var slideLength: Double
    init(sideLength: Double ,name: String) {
        self.slideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    func area() ->Double {
        return slideLength * slideLength
    }
    
    override func  simpleDescription() -> String {
        return "A squal with slides of lendth\(slideLength)"
    }
}

var squareTest = Squal(sideLength:3.2,name:"subclass test")
squareTest.area()
squareTest.simpleDescription()
squareTest.name

/**get set*/
class EquailateralTriangle: nameShape {
    var sideLength: Double = 0.0
    init(slideLength:Double,name:String) {
        self.sideLength = slideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter:Double {
        get {
            return sideLength*2.0
        }
        set {
            sideLength = newValue/3.0
        }
    }
    override func simpleDescription() -> String {
        return "An equilateral triangle with \(sideLength)"
    }
}
var triangle = EquailateralTriangle(slideLength: 3.1, name: "a triangle")
print(triangle.sideLength)

triangle.sideLength = 3.2
print(triangle.sideLength)

/**willset didset**/
 /****willSet*didSet****/
class TriangleAndSquare {
    
    var triangleL: EquailateralTriangle {
        willSet {
            print("triangleL willSet")
            squareL.slideLength = newValue.sideLength
        }
        didSet {
            print("triangleL didSet")
        }
    }
    var squareL: Squal {
        willSet {
            print("squareL willSet")
            triangleL.sideLength = newValue.slideLength
        }
        didSet {
            print("squareL didSet")
        }
    }
    init(size: Double, name:String) {
        // 少初始化任何一个对象，都会报错
        // return from initializer without initializing all stored properties
        // 类似于 oc 的用来存储数据的 model，需要对象序列化一样
        squareL = Squal(sideLength: size, name: name)
        triangleL = EquailateralTriangle(slideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 5.0, name: "another shape")
print(triangleAndSquare.squareL.slideLength)
print(triangleAndSquare.triangleL.sideLength)


/*枚举**/
enum Rank :Int {
    case Ace = 1
    case Two,three,Four
    case jack ,queen
    func simpleDescription() -> String {
        switch self {
        case.Ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen :
            return "queen"
        default :
            return String(self.rawValue)
        }
        
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
let aceString = ace.simpleDescription()

/***/
//let optionalSquare:Squal? = square(numbers:3)

/**枚举构造器**/
if let convertRank = Rank(rawValue: 3){
    let threeDescription = convertRank.simpleDescription()
}

/**枚举的值****/
enum Suit {
    case spades,hearts,Diamonds,Clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .Diamonds:
            return "Diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let heartFull = Suit.hearts
let hearts:Suit = .hearts
let heartDes = hearts.simpleDescription()
var heartsOne = Suit.hearts
heartsOne = Suit.spades

/***枚举的关联值***/
enum Barcode {
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}
var barcode = Barcode.UPCA(8, 10, 7787, 8)
barcode = .QRCode("abcdefg")
switch barcode {
 case .UPCA(let numberSystem,let manufacture,let product,let check):
    print("\(numberSystem)")
 case .QRCode(let prductCode):
    print("QR code:\(prductCode)")
}

/**结构体*/
struct Card {
    var rank :Rank
    var suit :Suit
    func simpleDescription() ->String{
        return "\(rank.simpleDescription()),\(suit.simpleDescription())"
    }
}
let threOfSpades = Card(rank: .three, suit: .spades)
let threeDes = threOfSpades.simpleDescription

//成员构造函数
struct SomaSize {
    var width :Double?
    var height :Double
}
let somesize = SomaSize(width: 12.0, height: 2.0)
print(somesize.width);
print(somesize.height)

struct Structure {
    var simpleDes = "A simple"
    mutating func adjust() {
        simpleDes += "aaaa"
    }
    init(){
        print("ssss")
    }
    init(oneName:String ,twoName:String){
        self.simpleDes = oneName
    }
}

var structure = Structure()
var structureTwo = Structure(oneName: "member initailizer", twoName: "hello")
structure.simpleDes

/**协议**/
protocol FirstProtocal {
    
}

protocol AnotherProtocal {
    
}

struct someStructure :FirstProtocal,AnotherProtocal{
    
}

class SomeClass: Shap,FirstProtocal,AnotherProtocal {
    
}

protocol someProtocal {
    var mustBeSttable:Int {get set}
    var doNotNeedToBeSettable :Int{
        get
    }
    func someTypeMethod()
}

protocol FullyName {
    var fullName: String {get}
}

struct person: FullyName {
    var fullName :String = "getTable"
}

let john = person (fullName: "john")
print(john.fullName)

class  start: SomeClass  {
    var prefix:String?
    var name: String = ""
    
    
}

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 2937.0
    func random() -> Double {
        lastRandom = (lastRandom * a + c ) % m
        return lastRandom/m
    }
}
let generator = LinearCongruentialGenerator()
print("Random number :\(generator.random())")
print("another Random number :\(generator.random())")

/****valuetype***/
var arrayValue = [12,43,55,1]
var arrayCopyValue = arrayValue
print(unsafeAddressOf(arrayValue))
print(unsafeAddressOf(arrayCopyValue)
)

/**扩展*/
extension start {
    
}

extension Double {
    var km:Double {
        return self*1_000.0
    }
    var m:Double {
        return self
    }
    var cm:Double {
        return self/100
    }
    var mm: Double {
        return self/1_000.0
    }
    var ft: Double {
        return self/3.28084
    }
}
let oneInch = 25.4.mm
print("one inch is \(oneInch) meters")
let threeFeet = 3.ft
print("three feet is\(threeFeet) meters")

//扩展构造器
struct RectSize {
    var width = 0.0
    var height = 0.0
}
struct RectPoint {
    var x = 0.0 ,y = 0.0
}

struct rect {
    var origin = RectPoint()
    var size = RectSize()
}

let defaultRect = rect()
let memberwiseRect = rect(origin: RectPoint(x:0,y: 2.0), size: RectSize(width: 3.0, height: 3))
extension rect {
    init (center:RectPoint,size:RectSize){
        let originX = center.x - (size.width/2)
       let y = center.y
        let originY = y - (size.width/2)
        self.init(origin:RectPoint(x: originX, y: originY),size:size)
    }
}

let newRect = rect(center: RectPoint(x: 3.0, y: 2.0), size: RectSize(width: 1.0,height: 1.0))
print(newRect.origin)

//扩展方法
extension Int {
    func repeatitions(task:() -> Void){
        for _ in 0..<self {
            task()
        }
    }
}

2.repeatitions{ () -> Void in
    print("hello swift")
}
2.repeatitions({
    print("hello")
})
3.repeatitions(){
    print("ssss")
}

/***In-out**/
func swapTwoInts(inout a:Int,inout _ b:Int) {
    let tempInt = a
    a = b
    b = tempInt
}
var someInt = 3,someIntTwo = 5
swapTwoInts(&someInt, &someIntTwo)
print(someIntTwo)

///Generics 
func swapTwoValues<T> (inout a:T ,inout _ b:T){
    let tempValue = a
    a = b
    b = tempValue
}
var oneGenericValue = "one"
var twoGenericValue = "two"
swapTwoValues(&oneGenericValue, &twoGenericValue)
swapTwoValues(&someInt, &someIntTwo)
print(oneGenericValue)
print(someIntTwo)

//Generics type 
struct IntStack {
    var items = [Int]()
    mutating func push(item: Int){
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}
let pushItem = 5
var intStack = IntStack()
intStack.push(pushItem)


struct GenericStack<T> {
    var items = [T]()
    mutating func push(item: T){
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var stackOfStrings = GenericStack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("thres")
let popItem = stackOfStrings.pop()










































