import UIKit

var greeting = "Hello, playground"

let maximu = 10
var mainxld = 20

var x = 0.0, y = 0.0, z = 0.0

var weklcomeMessage: String

weklcomeMessage = "hhf"

var red,green,blue: Double

print(weklcomeMessage)

let cat = "🐱";
print(cat)

let anoyrht = 5 + 3.1444

let decimalInteger = 17
let binaryInteger = 0b10001
let cocodind = 0o21



let orangesAreOrange = true
let turnipsAreDelicuous = false


let i = 9
if i == 1 {
    print("9 is good")
}

let http404Error = (404,"not found")

let (statusCode, statusMessage)  = http404Error
print("the status code is \(statusCode)")

print("the status messsage is \(statusMessage)")

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

//print(<#T##items: Any...##Any#>)

let posibleNumber = "123"
let convert = Int(posibleNumber)!
print(convert)

var severResponseCode: Int? = 404

//severResponseCode = nil

var surveyAnswer: String?

//if  severResponseCode == nil {
//    print("severResponseCode is not nil")
//}

if severResponseCode! == 404{
    print("num us \(severResponseCode!)")
}

if let firNumber = Int("4"),let second = Int("43"),firNumber < 100 && second < 100 {
    print("print first Number < sec < 100")
}

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要感叹号来获取值

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号

let optionalString = assumedString
// optionalString 的类型是 "String?"，assumedString 也没有被强制解析。

if assumedString != nil {
    print(assumedString!)
}
// 输出“An implicitly unwrapped optional string.”

if let definiteString = assumedString {
    print(definiteString)
}
// 输出“An implicitly unwrapped optional string.”


let contentHeight = 40
let hasHeader = true
var  rowHeight = contentHeight

if hasHeader {
    rowHeight = rowHeight + 50
    
} else {
    rowHeight = rowHeight + 20
}


let defaultColorName = "red"
var userDefainedColorName: String?

var colorNameToUse = userDefainedColorName ?? defaultColorName

userDefainedColorName = "green"
colorNameToUse = userDefainedColorName ?? defaultColorName


for index in 1...5 {
    print("\(index) * 5 = \(5*index) ")
}


let names = ["aaa","bbb","name","nndn"];
let count = names.count

for i in 0..<count {
    print("第\(i + 1) 个人叫 \(names[i])")
}

for name in names[2...] {
    print(name)
}

for name in names[..<2] {
    print(name)
}

let range = ...5
range.contains(7)
range.contains(4)
range.contains(-1)

let allowedEntry = false
if !allowedEntry {
    print("ACESS DEFINED")
}


let someString = "some string literal value";

let someString2 = """
some string literal valu
"""

print(someString)


let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""


print(softWrappedQuotation)


let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""

print("lineBreaks=\(lineBreaks)")


let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"             // $，Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥，Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖，Unicode 标量 U+1F496


let threeDoubleQuotes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""
print("threeDoubleQuotes=\(threeDoubleQuotes)")

let threeMoreDoubleQuaMArks = #"""

Here are there more double quotes:"""

"""#

print("\n threeMoreDoubleQuaMArks = \(threeMoreDoubleQuaMArks)")


let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

print("threeMoreDoubleQuotationMarks=\(threeMoreDoubleQuotationMarks)")


var emptyString = "" //空字符
var anotherEMptyString = String() // 初始化

if emptyString.isEmpty {
    print("nothing to see here")
}

var variableString = "Horse"
variableString += "and carriage"

var contantString = "Highlander"
contantString += " and another Highlander"
print("contantString += \(contantString)")

for character in "Dog! 🐶" {
    print(character)
}

let exclamationMark: Character = "!"
let catCharactore: [Character] = ["d","o", "g"]
let catString = String(catCharactore)
print("catString=\(catString)")

let string1 = "hello"
let string2 = "there"
var welcome = string1 + string2
print("welcome=\(welcome)")

var instruction = "look over"
instruction += string2
var welcome1:[Character] = ["1"]

let exclammationMark: Character = "!"
welcome1.append(exclammationMark);
print(welcome1)


let badSatrt = """
    one
    two
"""

let end = """
    three
    """
print(badSatrt + end)



let multiplier = 3
let message = "\(multiplier) time 2.5 is \(Double(multiplier) * 2.5)"
print("message=\(message)")
print(#"write an interpolated string in Swift using\(multiplier)."#)


print(#"6 times 7 is \(# 6*7)."#)

let eAcute: Character = "\u{E9}"
let combinedEAcute:Character = "\u{65}\u{301}"

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ

let enclosedEAcute: Character = "\u{E9}\u{20DD}"

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
print("q112\(regionalIndicatorForUS)")


let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// 打印输出“unusualMenagerie has 40 characters”


var word = "cafe"
print("the numeber of chara in \(word)")


let greetinf = "Guten Tag!"
var greet = greetinf[greeting.startIndex];
greeting[greetinf.index(after: greetinf.startIndex)];
greeting[greetinf.index(before:greetinf.endIndex)];
greeting[greetinf.index(greetinf.startIndex,offsetBy: 2)];


print("greet = \(greet)")

for index in greeting.indices {
    print("\(greeting[index]) ",terminator: ":")
}

var welcome10 = "hello"
welcome10.insert("!", at: welcome10.endIndex)
print(welcome10)

welcome10.insert(contentsOf: "there", at: welcome10.startIndex)
print(welcome10)


let unusualMenagerie2 = "Koala  🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie2.count) characters")

var word22 = "cafe"
print("the number of charactors in \(word22)")


let greeting2 = "Hello, world!"
let index2 = greeting.firstIndex(of: ",") ?? greeting.endIndex;
let beginning2 = greeting[..<index2]

let newString = String(beginning2)



let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}
// 打印输出“These two strings are considered equal”


// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion != combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// 打印输出“These two strings are considered equal”


let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}
// 打印“These two characters are not equivalent”


let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

print("---")

print(romeoAndJuliet)

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// 打印输出“There are 5 scenes in Act 1”

print("--===---")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}

print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// 打印输出“6 mansion scenes; 2 cell scenes”
let dogString = "Dog‼🐶"


for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶

let b = 10
var a = 5
a = b
// a 现在等于 10
let (xx, yy) = (1, 2)
// 现在 x 等于 1，y 等于 2
//if xx = yy {
//    // 此句错误，因为 x = y 并不返回任何值
//}

let three = 3
let minusThree = -three
let plusThree = -minusThree

var aa = 1
aa += 2
// a 现在是 3


let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
// 输出“hello, world", 因为 `name` 就是等于 "world”

(1, "zebra") < (2, "apple")   // true，因为 1 小于 2
(3, "apple") < (3, "bird")    // true，因为 3 等于 3，但是 apple 小于 bird
(4, "dog") == (4, "dog")      // true，因为 4 等于 4，dog 等于 dog




let contentHeight2 = 40
let hasHeader2 = true
var rowHeight2 = contentHeight2
if hasHeader2 {
    rowHeight2 = rowHeight + 50
} else {
    rowHeight2 = rowHeight + 20
}
// rowHeight 现在是 90



let defaultColorName22 = "red"
var userDefinedColorName: String?   //默认值为 nil

var colorNameToUse22 = userDefinedColorName ?? defaultColorName22
// userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"

//userDefinedColorName232 = "green"
//colorNameToUse22 = userDefinedColorName232 ?? defaultColorName
// userDefinedColorName 非空，因此 colorNameToUse 的值为 "green"

let someString22 = "Some string literal value"

let quotation22 = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""



let string12 = "hello"
let string22 = " there"
var welcome24 = string12 + string22
// welcome 现在等于 "hello there"

var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")
// 打印“someInts is of type [Int] with 0 items.”

someInts.append(3)
// someInts 现在包含一个 Int 值
someInts = []
// someInts 现在是空数组，但是仍然是 [Int] 类型的。


var threeDoubles = Array(repeating: 0.0, count: 3)

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles 被推断为 [Double]，等价于 [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles 被推断为 [Double]，等价于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

print(sixDoubles)

var shoppingList: [String] = ["Eggs", "Milk"]
// shoppingList 已经被构造并且拥有两个初始项。

print("The shopping list contains \(shoppingList.count) items.")
// 输出“The shopping list contains 2 items.”（这个数组有2个项）
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
// 打印“The shopping list is not empty.”（shoppinglist 不是空的）


shoppingList.append("Flour")
// shoppingList 现在有3个数据项，似乎有人在摊煎饼

shoppingList += ["Baking Powder"]
// shoppingList 现在有四项了
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList 现在有七项了

print(shoppingList)

var firstItem = shoppingList[0]
// 第一项是“Eggs”
shoppingList[0] = "Six eggs"
// 其中的第一项现在是“Six eggs”而不是“Eggs”

shoppingList[0] = "Six eggs"
// 其中的第一项现在是“Six eggs”而不是“Eggs”

shoppingList[4...6] = ["Bananas", "Apples"]
// shoppingList 现在有6项
shoppingList.insert("Maple Syrup", at: 0)

let mapleSyrup = shoppingList.remove(at: 0)
// 索引值为0的数据项被移除
// shoppingList 现在只有6项，而且不包括 Maple Syrup
// mapleSyrup 常量的值等于被移除数据项“Maple Syrup”

let apples = shoppingList.removeLast()


for item in shoppingList {
    print(item)
}



for item in shoppingList {
    print(item)
}


for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas

var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
// 打印“letters is of type Set<Character> with 0 items.”

var threeDoubles22 = Array(repeating: 0.0, count: 3)
// threeDoubles 是一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]

var anotherThreeDoubles34 = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles 被推断为 [Double]，等价于 [2.5, 2.5, 2.5]

var sixDoubles22 = threeDoubles22 + anotherThreeDoubles34
// sixDoubles 被推断为 [Double]，等价于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]


var shoppingList2: [String] = ["Eggs", "Milk"]
// shoppingList 已经被构造并且拥有两个初始项。
if shoppingList2.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
// 打印“The shopping list is not empty.”（shoppinglist 不是空的）

shoppingList2[0] = "223"
shoppingList2.append("floure")
shoppingList2 += ["123"]

shoppingList2 += ["12","23","34"]

var value = shoppingList2[0]

shoppingList2[0...1] = ["aa","bb"]
print(shoppingList2)

shoppingList2.insert("11223", at: 0)

print(shoppingList2)

shoppingList2.remove(at: 0)

print(shoppingList2)

for item in shoppingList2 {
    print(item)
}

for (index ,value) in shoppingList2.enumerated() {
    print("index=\(index) value=是 \(value)")
}

var letters2 = Set<Character>()
letters2.insert("1")

print(letters2)

var setinf: Set<String> = ["1","2","3"]
print(setinf)

var seting: Set = ["11","2","3"]
print(seting)

print("has seting \(seting.count) set")

if  seting.isEmpty {
    print("集合是空的")
} else {
    print("集合是不是空的")

}

// 添加 删除 包含 ,遍历

seting.insert("4444")

seting.remove("4444")

//seting.remove(at: seting.popFirst()!)

if  seting.contains("11") {
    print("集合抱哈某个元素")
}

for item in seting {
    print(item)
}

for item in seting.sorted() {
    print("item=\(item)")
}


let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
houseAnimals.isSuperset(of: farmAnimals)
farmAnimals.isDisjoint(with: houseAnimals)


var valueDic :[String:Int] = [:]
valueDic["15"] = 12

valueDic = [:]

var airpods: [String:String] = ["test1": "test2"]

print(airpods)

var airpods2 = ["test1":"test2","key1":"value1"]

print("The dictionary of airports contains \(airpods2.count) items.")

airpods["LHG"] = "234"

if  let value = airpods.updateValue("LHGG", forKey: "LHG") {
    print("The old value for DUB was \(value).")

}

if let value = airpods2["123"]  {
    print(value)
}

if let value = airpods2.removeValue(forKey: "123") {
    print("remove vaulue is\(value)")
}

for (value ,key ) in airpods2 {
    print("value=\(value) key=\(key)")
}

