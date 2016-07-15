//: Playground - noun: a place where people can play

import Cocoa

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

/*********/
var emptyArray = [String]()

/*****控制流****/
let vegetable = "red pepper"
switch vegetable {
    
    case "celery":
        print("Add some raisins")
    
    case "cucumber", "watercress":
        print("That would make a good tea sandwich")
    
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    
    default:
        print("Everyting tastes good in soup.")
}

/*********/
for name: Int in shoppingPrice {
    print(name)
}

/*********/
var ssdfd = NSMutableArray()
ssdfd[0] = 20
print(ssdfd)

/*********/
var largest = 0
var largestKind = ""
let interestingNumbers = ["Prime":[2,3,5,7],"Square":[1,4,9,16,25]]
for (key, value) in interestingNumbers {
    for number in value {
        if number > largest {
            largestKind = key
            largest = number
        }
    }
}
print(largest)
print(largestKind)

/***********/
let individualScores = [10,9,33,11]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore+=3
    }
    else {
        teamScore+=1
    }
}
print(teamScore)

/***********/
var conditionalValue = 1
if conditionalValue < 2 {
    print(conditionalValue)
}

/***********/
var optionalString : String? = "Hello kitty"
print(optionalString == nil)

var optionalName: String? = "Swift"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
else {
    print(optionalName)
}

/***********/
let nickName: String? = nil
let fullName: String = "Swift"
let informalGreeting = "Hi \(nickName ?? fullName)"

/******多个相同类型参数*****/
func sumOf(numbers:Int...) ->Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
print(sumOf())
print(sumOf(1,3,4,5))

/*********/
var factorial = 5
for i in 1..<5 {
    factorial = (5-i)*factorial
}
print(factorial)

var factorialTwo = 5
for var i = 1; i < 5; i++ {
    factorialTwo = (5-i)*factorialTwo
}
print(factorialTwo)

/*****while****/
var whileNumber = 2
while whileNumber < 3 {
    whileNumber += 1
}
print(whileNumber)

var whileNumber2 = 2
repeat {
    whileNumber2 += 1
} while whileNumber2 < 2
print(whileNumber2)

/*****函数****/
var nameAndDay = ""
func greet(name: String, day: String, number: Int) ->String {
    return "Hello \(name), today is \(day), \(number)."
}
nameAndDay = greet("Swift", day: "Sunday", number: 1)
print(nameAndDay)

/*****元组****/
func calculate(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max {
            max = score
        }
        else if score < min {
            min = score
        }
        sum += score
    }
    return (min,max,sum)
}
let statistics = calculate([5, 10, 39, 5])
print(statistics.sum)
print(statistics.1)

/*****函数作为返回类型****/
func makeIncrementer() ->((Int,Int) ->Int) {
    func addOne(number:Int,second:Int) ->Int {
        return number+second
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(2,4))

/***********/
func square(a:Float) ->Float {
    return a*a
}
func cube(a:Float) ->Float {
    return a*a*a
}
func averageSumOfSquare(a:Float, b:Float) ->Float {
    return (square(a) + square(b))/2.0
}
func averageSumOfCube(a:Float, b:Float) ->Float {
    return (cube(a) + cube(b)) / 2.0
}
averageSumOfSquare(1.0, b: 3.0)
averageSumOfCube(2.0, b: 3.0)

/******函数作为参数*****/
func averageOfSum(a:Float, b:Float, f:(Float ->Float)) ->Float {
    return (f(a) + f(b))/2.0
}
averageOfSum(2.0, b: 3.0, f: square)
averageOfSum(3.0, b: 3.0, f: cube)
let averageNewSum = averageOfSum(3, b: 4, f: {(x:Float) ->Float in return x*x})
print(averageNewSum)
//individualScores.map({
//    (number:Int) ->Int in
//    let result = number+3
//    return result
//})

//individualScores.map({
//    number in number+1})
//print(individualScores)

let mappedScores = individualScores.map({
    $0+1})
print(individualScores)
print(mappedScores)

individualScores.sort({
    $0 < $1
})

/*********/
func hasAnyMatches(list:[Int], condition:(Int) ->Bool) ->Bool {
    
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number:Int) ->Bool {
    return number < 10
}
var numbers = [20,13,4,9]
hasAnyMatches(numbers, condition: lessThanTen)

/*********/
let sortedNumbers = numbers.sort(){
    $0 < $1
}
print(sortedNumbers)

/*****类****/
class Shape {
    var numberOfSides = 0
    let numberOfPoint = 3
    func simpleDescription() ->String {
        return "A shape with \(numberOfSides) sides"
    }
    func simplePoint(point:Int) ->Int {
        return point
    }
}
var shape = Shape()
shape.numberOfSides = 1
var shapeDes = shape.simpleDescription()
print(shapeDes)

/*****构造器****/
class NameShape {
    var numberOfSides: Int = 0
    var name :String
    init(name:String) {
        self.name = name
    }
    func simpleDescription() ->String {
        return "A shape with a name \(name)"
    }
}
var nameShape = NameShape(name: "ssss")
var initName = nameShape.simpleDescription()

/*****析构器****/
class NameShapeTwo {
    var numberOfSides: Int
    init(number:Int) {
        print("init called")
        self.numberOfSides = number
    }
    deinit {
        print("deinit called")
        numberOfSides = 0
    }
    func addNumbers(number:Int) {
        numberOfSides += 3
    }
}
var shapeTwo :NameShapeTwo? = NameShapeTwo(number: 3)
print("numberOfSides : \(shapeTwo!.numberOfSides)")
shapeTwo = nil

/*****override****/
class Square: NameShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    func area() ->Double {
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
var squareTest = Square(sideLength: 3.2, name: "subclass test")
squareTest.area()
squareTest.simpleDescription()
squareTest.name

/*****get set****/
class EquilateralTriangle: NameShape {
    var sideLength: Double = 0.0
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    var perimeter: Double {
        get {
            return sideLength*3.0
        }
        set {
            sideLength = newValue / 3.0
        }
//        set(perimeter) {
//            perimeter
//            sideLength = perimeter / 3.0
//        }
    }
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

/*********/
class EquilateralTriangleOne: NameShape {
    
    init(sideLength: Double, name: String) {
        self.tempLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var tempLength: Double = 0.0
    var sideLength: Double {
        get {
            print("getget")
            return self.tempLength
        }
        set {
            print("setset")
            self.tempLength = newValue
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(self.sideLength)."
    }
}
var triangleOne = EquilateralTriangleOne(sideLength: 3.5, name: "b triangle")
print(triangleOne.sideLength)
triangleOne.sideLength = 3.6
print(triangleOne.sideLength)

/****willSet*didSet****/
class TriangleAndSquare {
    
    var triangleL: EquilateralTriangle {
        willSet {
            print("triangleL willSet")
            squareL.sideLength = newValue.sideLength
        }
        didSet {
            print("triangleL didSet")
        }
    }
    var squareL: Square {
        willSet {
            print("squareL willSet")
            triangleL.sideLength = newValue.sideLength
        }
        didSet {
            print("squareL didSet")
        }
    }
    init(size: Double, name:String) {
        // 少初始化任何一个对象，都会报错 
        // return from initializer without initializing all stored properties
        // 类似于 oc 的用来存储数据的 model，需要对象序列化一样
        squareL = Square(sideLength: size, name: name)
        triangleL = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 5.0, name: "another shape")
print(triangleAndSquare.squareL.sideLength)
print(triangleAndSquare.triangleL.sideLength)
triangleAndSquare.squareL = Square(sideLength: 10.0, name: "lager shape")
print(triangleAndSquare.triangleL.sideLength)

/*****枚举****/
enum Rank: Int {
    //enum case must declare a raw value when the preceding raw value is not an integer
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() ->String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
let aceString = ace.simpleDescription()

/*********/
let optionalSquare : Square? = Square(sideLength:5.3, name: "optionalSquare")
var optionalLength = optionalSquare?.sideLength

/*****枚举构造器****/
if let convertRank = Rank(rawValue: 3) {
    let threeDescription = convertRank.simpleDescription()
}

/*****枚举的值****/
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() ->String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let heartFull = Suit.Hearts
let hearts:Suit = .Hearts
let heartsDes = hearts.simpleDescription()
var heartsOne = Suit.Hearts
heartsOne = Suit.Spades

/*****枚举的关联值****/
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}
var barcode = Barcode.UPCA(9, 72345, 77787, 8)
barcode = .QRCode("abcdefg")
switch barcode {
case .UPCA(let numberSystem, let manufacture, let product, let check):
    print("UPC-A: \(numberSystem) \(manufacture) \(product) \(check)")
case .QRCode(let productCode):
    print("QR Code: \(productCode)")
}
switch barcode {
case let .UPCA(numberSystem, manufacture, product, check):
    print("UPC-A: \(numberSystem) \(manufacture) \(product) \(check)")
case let .QRCode(productCode):
    print("QR Code: \(productCode)")
}

/*****结构体****/
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription()-> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeDes = threeOfSpades.simpleDescription()

// 成员构造器
struct SomeSize {
//    var width = 0.0, height = 0.0
    var width :Double?
    var height:Double?
}
// 不管width和height是否被初始化，SomeSize都会自动接收一个带有两个参数width和height的成员构造器
let someSize = SomeSize(width: 3.0, height: 2.0)
print(someSize.width);print(someSize.height)

struct Structure {
    var simpleDes = "A simple"
    // 在结构体的方法中要修改结构体中的变量，需要加关键字 mutating
    mutating func adjust() {
        simpleDes += "aaa"
    }
    // 默认构造器,可以不写
    init() {print("ssss")}
    // 成员构造器
    init(oneName:String, twoName:String) {
        self.simpleDes = oneName
    }
}
var structure = Structure()
var structureTwo = Structure(oneName: "Member Initializer", twoName: "Hello")
structure.simpleDes

/*****协议****/
protocol FirstProtocol {
    // protocol definition goes here
}
protocol AnotherProtocol {
    // protocol definition goes here
}
struct SomeStructure: FirstProtocol,AnotherProtocol {
    // structure definition goes here
}
class SomeClass: Shape,FirstProtocol,AnotherProtocol {
    // class definition goes here
}
protocol SomeProtocol {
    var mustBeSettable: Int {get set}
    var doNotNeedToBeSettable: Int {get}
    func someTypeMethod()
}
protocol FullyNamed {
    var fullName: String {get}
}
struct Person: FullyNamed {
    var fullName: String = "gettable"
}
let john = Person(fullName: "John")
print(john.fullName)

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "" ) + name
    }
}
var starShip = Starship(name: "Enterprise", prefix: "USS")
print(starShip.fullName)

protocol RandomNumberGenerator {
    func random() ->Double
}
class LinearCongruentialGenerator: RandomNumberGenerator {
    
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 2973.0
    func random() -> Double {
        lastRandom = ((lastRandom*a + c) % m)
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Random number : \(generator.random())")
print("Another Random number: \(generator.random())")

/*****value type****/
var arrayValue = [12,43,55,1]
var arrayCopyValue = arrayValue
print(unsafeAddressOf(arrayValue))
print(unsafeAddressOf(arrayCopyValue))

/*****扩展****/
extension Starship {
    // new Functionality to add to Starship goes here
}
extension Double {
    var km: Double {
        return self * 1_000.0
    }
    var m: Double {
        return self
    }
    var cm: Double {
        return self/100.0
    }
    var mm: Double {
        return self/1_000.0
    }
    var ft: Double {
        return self/3.28084
    }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

// 扩展构造器
struct RectSize {
    var width = 0.0, height = 0.0
}
struct RectPoint {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = RectPoint()
    var size = RectSize()
}
let defaultRect = Rect()
let memberwiseRect = Rect(origin: RectPoint(x:2.0, y:2.0), size: RectSize(width: 3.0, height: 3.0))
extension Rect {
    init(center: RectPoint, size: RectSize) {
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin: RectPoint(x: originX, y: originY), size: size)
    }
}
let newRect = Rect(center: RectPoint(x: 3.0,y: 3.0), size: RectSize(width: 1.0, height: 1.0))
print(newRect.origin)

// 扩展方法
extension Int {
    func repetitions(task:() -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
2.repetitions { () -> Void in
    print("Hello Swift")
}
2.repetitions({
    print("Hello")
})
2.repetitions() {
    print("ssss")
}

/*****In-out****/
func swapTwoInts(inout a:Int, inout _ b:Int) {
    let tempInt = a
    a = b
    b = tempInt
}
var someInt = 3,someIntTwo = 5
swapTwoInts(&someInt, &someIntTwo)
print(someIntTwo)

/*****Generics****/

func swapTwoValues<T>(inout a:T, inout _ b:T) {
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

/*****Generics Type****/

struct IntStack {
    
    var items = [Int]()
    mutating func push(item: Int) {
        items.append(item)
    }
    
    mutating func pop() ->Int {
        return items.removeLast()
    }
}

let pushItem = 5
var intStack = IntStack()
intStack.push(pushItem)

struct GenericStack<T> {
    
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() ->T {
        return items.removeLast()
    }
}

var stackOfStrings = GenericStack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
let popItem = stackOfStrings.pop()















