import UIKit
//20221003  08:30 开始的


// 起始与控制流
var greeting = "Hello, playground"

let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names {
    print("Hello, \(name)!")
}


for index in 1...5 {
    print(index)
}

for index in 1...5 {
    print("\(index) times 5 is \(index*5)")
}


let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer = answer * base
}

print(answer)

let minutes = 60
for trickMark in 0..<minutes {
    print(trickMark)
}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMark)
}

print("===")

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 20, through: hours, by: -3) {
    print(tickMark)
}

let finalSquare = 25
var board = [Int](repeating: 5, count: 26)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

print(board)


var square = 0
var diceRoll = 0
while square < finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1}
    square += diceRoll
    if  square < board.count {
        square += board[square]
    }
}
print("game over")

//repeat {
//    square += board[square]
//    diceRoll += 1
//    if  diceRoll == 7 {diceRoll = 1}
//    square += diceRoll
//} while square < finalSquare


var temperatureFahrenheit = 30
if temperatureFahrenheit <= 30 {
    print("it is very cold , Consider wearing ")
}

temperatureFahrenheit = 40
if  temperatureFahrenheit <= 32 {
    print("it is very cold ,Consider wearing a scarf")
} else {
    print("it is not that cold, Wear a t-shirt .")
}

if temperatureFahrenheit <= 32 {
    print("it is very cold")
} else if temperatureFahrenheit >= 86 {
    print("it is really warm, Wear a t-shirt")
}


temperatureFahrenheit = 72
if temperatureFahrenheit <= 32 {
    print("it is very cold ,Consider wearing a scarf")
} else if temperatureFahrenheit >= 86 {
    print("It is really warm  ,Don not forget to wear sunscreen")
}


let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The second letter of the alphabet")
default:
    print("Some other character")
}


let anotherCharactor:Character = "a"
switch anotherCharactor {
    case "a":
        print("The letter A")
    case "A":
        print("The letter A")
    default:
        print("Not the letter A")
}


switch anotherCharactor {
    case "a","A" :
        print("The letter A")
    default:
        print("Not the letter A")
}


let approximateCount = 62
let countedThings = "mioon orbiting saturen"
let naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "manay"
}

print("there are \(naturalCount) \(countedThings).")


let somePoint = (1,1)
switch somePoint {
case (0,0):
    print("\(somePoint) is at the origin")
    
case(_,0):
    print("\(somePoint) is on the x-axis")
    
case(0,_):
    print("\(somePoint) is on the y-axis")
default:
    print("\(somePoint) is outside of the box")
}


let anotherPoint = (2,0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
    case let (x, y):
        print("somewhere else at (\(x), \(y))")
}



let yetAnotherPoint22 = (1,-1)
switch yetAnotherPoint22 {
case let(x,y) where x == y:
    print("(\(x), \(y)) is on the line x == y")

case let(x,y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let(x,y) :
    print("(\(x), \(y)) is just some arbitrary point")
}


let someCharact: Character = "e"
switch someCharacter {
case "a","e","i":
    print("\(someCharacter) is a vowel")
    
case "b","c","d":
    print("\(someCharacter) is a constant")
    
default:
    print("\(someCharacter) is not a vowel")
}


let stillAnotherPoint = (9,0)
switch stillAnotherPoint {
case (let distance,0),(0, let distance):
    print("on an axis,\(distance) from the origin")
default:
    print("Not on an axis")
}



let puzzleInput = "great minds think alike"
var puzzleOutput = ""

for  charactor in puzzleInput {
    switch charactor {
    case "a","e","i","o","u"," ":
        continue
    default:
        puzzleOutput.append(" ")
        puzzleOutput.append(charactor)
    }
}

print(puzzleOutput)


let numberSymbol: Character = "三"
var possibleIntegerValue: Int?

switch numberSymbol {
case "1"," ","-":
    possibleIntegerValue = 1

case "2","二":
    possibleIntegerValue = 2

case "3","三":
    possibleIntegerValue = 3

case "4","四":
    possibleIntegerValue = 4
    
default:
    break
}


if let intergerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(intergerValue)")
} else {
    print("An integer value could not be found for \(numberSymbol)")
}

let integerToDescription = 5
var description = "The number \(integerToDescription) is"
switch integerToDescription {
case 2,3,4,5,6,7,8:
    description += "a prime number, and also"
    fallthrough
default:
    description += "an integer"
}


//let finalSquare = 25
//var board = [Int](repeating: 0, count: finalSquare+1)
//

func greeting(person: String) -> String {
    let greeting = "Hello " + person + "!"
    return greeting
}

print(greeting(person: "Anna"))

print(greeting(person: "Brain"))



func sayHelloWorld() -> String {
    return "hello ,world"
}
print(sayHelloWorld())


func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))
// 打印“Hello again, Anna!”

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

func greet(person: String,alreadyGreeted:Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person:person)
    } else {
        return greet(person: person)
    }
}


func sayHelloWorld2() -> String {
    return "hello world"
}

print(sayHelloWorld2())



func greet2(person: String, alreadyGreeted:Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "Tim", alreadyGreeted: true))


func greet3(person: String) {
    print("hello, \(person)")
}
greet3(person: "Dave")



func printAndCount(string:String) -> Int {
    print(string)
    return string.count
}

func printWithOutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "Hello world")

printWithOutCounting(string: "hello world")


func minMax(array:[Int]) -> (min: Int,max:Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMin {
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}

let bounds =  minMax(array: [8,-6,2,109])
print("min is \(bounds.min) and max is \(bounds.max)")


func greeting(for person: String) -> String {
    "hello" + person + "!"
}

print(greeting(for: "wanggang"))

func anotherGreeting(for person: String) -> String {
    return "hello ," + person + "!"
}

print(anotherGreeting(for: "Dave"))

func someFunction(argumentLable parameterName:Int) {
    
}

func greet(person: String, from homeTown:String) -> String {
    return "Hello \(person)! Glad you from \(homeTown)"
}

//print(greet(person: "Bill", from: "Cupertino"))


func someFunction( firstParameterName: Int,secondParameterName: Int) {
    
}
someFunction(firstParameterName: 1, secondParameterName: 2)

func someFunction(argumentLabel parameterName:Int) {
    
}


func someFunction(parameterWithOutDefault:Int, parameterWithDefault:Int = 12){
    
}

someFunction(firstParameterName: 3, secondParameterName: 5)

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

print(quotation)


let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

print(softWrappedQuotation)


func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3


let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!

//func chooseStepFunction(backward: Bool) -> (Int) -> Int {
//    func stepForward(input: Int) -> Int { return input + 1 }
//    func stepBackward(input: Int) -> Int { return input - 1 }
//    return backward ? stepBackward : stepForward
//}
//var currentValue = -4
//let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
//// moveNearerToZero now refers to the nested stepForward() function
//while currentValue != 0 {
//    print("\(currentValue)... ")
//    currentValue = moveNearerToZero(currentValue)
//}
//print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!


func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

let names3 = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

//var reversedNames = names3.sorted(by: backward)
// reversedNames 为 ["Ewa", "Daniella", "Chris", "Barry", "Alex"]


//reversedNames = names3.sorted(by: { (s1: String, s2: String) -> Bool in
//    return s1 > s2
//})

//let names3  = ["Chris","Alex","Ewa"]


let reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )


let reversedNames2 = names.sorted(by: { s1, s2 in return s1 > s2 } )


let reversedName4 = names.sorted(by: { s1, s2 in  s1 > s2 } )
let reversedName5 = names.sorted(by: { $0 > $1 })

let reversedName6 = names.sorted(by: > )

func someFunctionThatTakesAClosure(closure: ()-> Void) {
    
}


someFunctionThatTakesAClosure(closure: {
    // 闭包主体部分
})

let reversedNames22 = names.sorted() { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]



func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)



let incrementBySeven = makeIncrementer(forIncrement: 6)


let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
// 返回的值为50

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNoneEscapingClosure(closure: () -> Void ){
    closure()
}

class SomeClass {
    var x = 10
    func doSomeThing() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithEscapingClosure {
//            x = 200
        }
    }
}


let instance = SomeClass()
instance.doSomeThing()
print(instance.x)

completionHandlers.first?()
print(instance.x)


var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider  = {customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())!")

print(customersInLine.count)


func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: {customersInLine.remove(at: 0)})

func serve(customer customerProvider:@autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: customersInLine.remove(at: 0))
 

var customerPrividers: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerPrividers.append(customerProvider)
}


collectCustomerProviders(customersInLine.remove(at: 0))

collectCustomerProviders(customersInLine.remove(at: 0))


