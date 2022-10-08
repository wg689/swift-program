import UIKit

var greeting = "Hello, playground"


enum SomeEnumerration {
    
}

enum CompassPoint {
    case north
    case south
    case east
    case west
}


enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// 打印“3 beverages available”

for beverage in Beverage.allCases {
    print(beverage)
}

enum Barcode {
    case upc(Int, Int,Int,Int)
    case qrCode(String)
}

var productBarcode  = Barcode.upc(1, 2, 4, 5)
productBarcode = .qrCode("ABCDEFGKKKKK")


switch productBarcode {

 case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    
 case .qrCode(let productCode):
    print("QR code: \(productCode).")
    
}

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//let possiblePlanet = Planet(rawValue: 7)
//// possiblePlanet 类型为 Planet? 值为 Planet.uranus
//
//
//let positionToFind  = 11
//

let positionToFind = 11

//if let somePlanet = Planet(ra)

var directionToHead = CompassPoint.west

directionToHead = CompassPoint.east

switch directionToHead {
case .north:
    print("lots of planets have a north")
default:
    print("other is that")
}


let somePlanet = Planet.earth

switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe for humans")
}


enum Beverage2: CaseIterable {
    case coffe,tea ,juice
}

let numberOfChoice = Beverage2.allCases.count

print("\(numberOfChoice) beverage available" )


for beverage in Beverage2.allCases {
    print(beverage)
}

switch productBarcode {
case .upc(let numberSystem, let manufacture, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QRcode: \(productCode).")
}

enum CompassPoint2: Int {
    case north  = 1, south,east,west
}

let earthsOrder = CompassPoint2.north.rawValue

let possiblePlanet = CompassPoint2(rawValue: 1)


indirect enum ArithmeticExpression {
    case number(Int)
    case addtion(ArithmeticExpression,ArithmeticExpression)
    case multiplication(ArithmeticExpression,ArithmeticExpression)
}


let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addtion(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addtion(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))


//2022年10月8日
// 类和结构体

struct SomeStructure {
    
}

class SomeClass {
    
}

struct Resolution {
    var height = 0
    var wight = 0
}

class  VideoMode2 {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String = ""
}

let hd = Resolution(height: 1920, wight: 1080)
var cinama = hd

cinama.wight = 2048

enum CompassPoint3 {
    case north, south,east,west
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
//currentDirection.turnNorth()

//enum CompassPoint {
//    case north, south, east, west
//    mutating func turnNorth() {
//        self = .north
//    }
//}
//var currentDirection = CompassPoint.west
//let rememberedDirection = currentDirection
//currentDirection.turnNorth()
//
//print("The current direction is \(currentDirection)")
//print("The remembered direction is \(rememberedDirection)")
//// 打印 "The current direction is north"
//// 打印 "The remembered direction is west"
//
//

let tenEighty = VideoMode2()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "10990"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6


class DataImporter {
    var fileName = "Data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
}

let manager = DataManager()
manager.data.append("some data")
manager.data.append("Some more data")

print(manager.importer.fileName)





