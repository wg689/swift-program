import UIKit

var greeting = "Hello, playground"



class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested:Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}


class Player23 {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins: Int)  {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: Player23? = Player23(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")

print("There are now \(Bank.coinsInBank) coins left in the bank")


class Residence {
    var numberOfRooms = 1
}

class Persion {
    var residence:Residence?
}

let john = Persion()
let roomcount = john.residence?.numberOfRooms

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

class Room {
    
}

class Address {
    var buildingName: String?
    var buildNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if let buildingNumber = buildingName,let street = street {
            return "\(buildingNumber) \(street)"
        }else {
            return nil
        }
    }
}

let someAddress = Address()
someAddress.buildNumber = "29"
someAddress.street = "Acacia Road"

func createAddress() -> Address {
//    print("Function was called.")
    let someAddress = Address()
    someAddress.buildNumber = "29"
    someAddress.street = "Acacia Road"
    return someAddress
}




class Residence2 {
    var rooms:[Room] = []
    var numbersOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numbersOfRooms)")
    }
    
    
    var address: Address?
}

class Room22 {
    let name: String
    init(name: String) {
        self.name = name
    }
}



func printNumberOfRooms() {
    print("The number of rooms is")
}

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
// "Dave" 数组现在是 [91, 82, 84]，"Bev" 数组现在是 [80, 94, 81]


//if let johnsStreet = john.residence?.address?.street {
//    print("John's street name is \(johnsStreet).")
//} else {
//    print("Unable to retrieve the address.")
//}
// 打印“Unable to retrieve the address.”


enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded:Int)
    case outOfStock
}

throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

//func canThrowErrors() throws -> String

struct Item {
    var price:Int
    var count:Int
}

class VendingMachine {
    var inventory = [
           "Candy Bar": Item(price: 12, count: 7),
           "Chips": Item(price: 10, count: 4),
           "Pretzels": Item(price: 7, count: 11)
       ]
    
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard  item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")

        
    }
    
}

let favoriteSnacks = [
    "Alice": "Chips",
     "Bob": "Licorice",
     "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine:VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine:VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

var vendingMachine = VendingMachine()

vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
}catch VendingMachineError.invalidSelection {
    print("invalidSelection")
}catch VendingMachineError.outOfStock {
    print("outOfStock")
}catch VendingMachineError.insufficientFunds(coinsNeeded: 6) {
//    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}


func norish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Couldn't buy that from the vending machine.")
    }
}

//func fetchData() -> Data? {
////    if let data = try? fet
//}

import Foundation
let handle = FileHandle.standardInput
//for try await line in handle.bytes.lines {
//  print(line)
//}


class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist:String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// 数组 library 的类型被推断为 [MediaItem]

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}


print("Media library contains \(movieCount) movies and \(songCount) songs")


for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

var things: [Any] = []
things.append(0)
things.append(0.0)
things.append(42)
things.append("hello")


for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

// zero as an Int
// zero as a Double
// an integer value of 42
// a positive double value of 3.14159
// a string value of "hello"
// an (x, y) point at 3.0, 5.0
// a movie called Ghostbusters, dir. Ivan Reitman
// Hello, Michael


//extension Song {
//
//}
//
//
//extension Song: SomeProtocol, AnotherProtocol {
//  // 协议所需要的实现写在这里
//}
//

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// 打印“One inch is 0.0254 meters”
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// 打印“Three feet is 0.914399970739201 meters”


struct Size {
    var width = 0.0 , height = 0.0
}

struct Point {
    var x = 0.0 , y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}


let defaultRect = Rect()

let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))



extension Rect {
    init(center:Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin:Point(x: originX, y: originY))
    }
}






