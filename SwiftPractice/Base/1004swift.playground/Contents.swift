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
    print("UPC: \(numberSystem), \(manufacture), \(product), \(check).")
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

struct Point {
    var x = 0.0,y = 0.0
}


struct Size {
    var width = 0.0 , height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var  center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
            
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
            
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10, height: 20))

let initialSqu = square.center
square.center = Point(x: 15, y: 15)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y  + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y =  newValue.y - (size.height / 2)
        }
    }
}

struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width/2),
                  y: origin.y + (size.height/2))
        }
        
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

struct Cubiod {
    var width = 0.0, height = 0, depth = 0.0
    var volume: Double {
        return width * Double(height) * depth
    }
}

let fourByFiveByTwo = Cubiod(width: 4.0, height: Int(5.0), depth: 2.0)

print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")


class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("将 totalSteps 的值设置为 \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue {
                print("增加了 \(totalSteps - oldValue) 步")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896



@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get {return number}
        set {number = min(newValue, 12)}
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()

print(rectangle.height)

rectangle.height = 24

print(rectangle.height)

struct smallRectangle {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set {_height.wrappedValue = newValue}
    }
    
    var width: Int {
        get {return _width.wrappedValue}
        set {_width.wrappedValue = newValue}
    }
}

@propertyWrapper
struct SmallNumber {
    private  var maximum: Int
    private var number: Int
    var wrappedValue: Int {
        get {return number}
        set {number = min(newValue, maximum)}
    }
    
    init() {
        maximum = 12
        number = 0
    }
    
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    
    init(wrappedValue: Int, maximum:Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)

struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

var unitRectangle = UnitRectangle()
print(unitRectangle.height , unitRectangle.width)


struct NarrowRectTangle {
    @SmallNumber(wrappedValue: 2, maximum:5) var height: Int
    @SmallNumber(wrappedValue: 2,maximum:4) var width: Int
}

var narrowRectangle = NarrowRectTangle()
print(narrowRectangle.height , narrowRectangle.width)


narrowRectangle.height = 100
narrowRectangle.width = 100

print(narrowRectangle.height, narrowRectangle.width)


struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectanble = MixedRectangle()
print(mixedRectanble.height)

mixedRectanble.height = 20
print(mixedRectanble.height)


@propertyWrapper
struct SmallNumber2 {
    private var number: Int
    private(set) var projectedValue: Bool
    
    var wrappedValue: Int {
        get {return number}
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
    
    init( ) {
        self.number = 0
        self.projectedValue = false
    }
}

struct SomeStructure2{
    @SmallNumber var someNumber: Int
}

var someStructure = SomeStructure2()
someStructure.someNumber = 4

print(someStructure.someNumber)


someStructure.someNumber = 55
print(someStructure.someNumber)

enum Size2 {
    case small ,large
}

struct SizeRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
    
    mutating func resize(to size: Size2) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
            
        }
        return height > 0 || width > 0
    }
}


func someFunction() {
    var myNumber: Int = 0
    myNumber = 10
    myNumber = 24
}

struct SomeStructure22 {
    static var storeTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 6
    }
    
}

class SomeClass22 {
    static var storeTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}


//print(SomeStructure.storedTypeProperty)
//// 打印“Some value.”
//SomeStructure.storedTypeProperty = "Another value."
//print(SomeStructure.storedTypeProperty)
//// 打印“Another value.”
//print(SomeEnumeration.computedTypeProperty)
//// 打印“6”
//print(SomeClass.computedTypeProperty)
//// 打印“27”



struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()

var rightChanel = AudioChannel()

leftChannel.currentLevel = 7

print(leftChannel.currentLevel)
// 输出“7”
print(AudioChannel.maxInputLevelForAllChannels)
// 输出“7”



struct Point2 {
    var x = 0.0 , y = 0.0
    mutating func moveBy(x deltaX:Double , y deltaY:Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point2(x: 1.0, y: 1.0)

somePoint.moveBy(x: 2.0, y: 3.0)

print(leftChannel.currentLevel)
// 输出“7”
print(AudioChannel.maxInputLevelForAllChannels)
// 输出“7”


struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltax: Double ,y deltaY: Double ) {
        self = Point3(x: x + deltax, y: y + deltaY)
    }
}

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self =  .high
        case .high:
            self = .off
        }
    }
}

var overLight = TriStateSwitch.low
overLight.next()
overLight.next()

class SomeClass2 {
    class func someTypeMethod() {
        
    }
}

SomeClass2.someTypeMethod()


struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level:Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}


class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argrios")
player.complete(level: 1)

print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")


player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
    
    
}

let threeTimesTable = TimesTable(multiplier: 3)

print("six times three is \(threeTimesTable[6])")

var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2


enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet2 {
        return Planet2(rawValue: n)!
    }
}

let mars = Planet2[4]

print(mars)


class Vehicle2 {
    var currendSpeed = 0.0
    var description: String {
        return "traveling at \(currendSpeed) miles per hour"
    }
    
    func makeNoise() {
        
    }
}

let someVehicle = Vehicle2()

print("Vehicle: \(someVehicle.description)")


class Bicycle: Vehicle2 {
    var hasBasket = false
}

let vicycle = Bicycle()
vicycle.hasBasket = true


class Temdem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Temdem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currendSpeed = 22.0
print("Tandem: \(tandem.description)")


class Train: Vehicle2 {
    override func makeNoise() {
        print("choo choo")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle2 {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currendSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")


class AutomaticCar: Car {
    override var currendSpeed: Double {
        didSet {
            gear = Int(currendSpeed / 10.0 ) + 1
        }
    }
}

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")



struct Celsius {
    var temperatureInCelsinus: Double
    init(fromFarenheit fahrenheit:Double) {
        temperatureInCelsinus = (fahrenheit - 32.0)/1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsinus = kelvin - 273.15
    }
    
    
}


let boilingPointOfWater = Celsius(fromFarenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)


class SurveyQustion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let beetsQuestion = SurveyQustion(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"


class ShoppingListItem {
    var name: String = ""
    var quantity  = 1
    var purchased = false
}

var item = ShoppingListItem()
let twoByTwo = Size(width: 2.0, height: 2.0)

let zeroByTwo = Size(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height)
// 打印 "0.0 2.0"

let zeroByZero = Size()
print(zeroByZero.width, zeroByZero.height)
// 打印 "0.0 0.0"

struct Rect2 {
    var origin = Point()
    var size = Size()
    init() {}
    
    init(origin:Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size:Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2 )
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
    
}

let basicRect = Rect()

//20221009  21:54
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

let centerRect = Rect2(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))


class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let nameMeat = Food(name: "Bacon")
let mysteMeat = Food()


class RecipeIngredient: Food {
    var quantity: Int
    init(name: String,quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name:String) {
        self.init(name: name ,quantity:1)
    }
}


let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)





































