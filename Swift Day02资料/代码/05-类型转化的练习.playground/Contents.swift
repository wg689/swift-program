//: Playground - noun: a place where people can play

import UIKit

let infoDict = ["name" : "why", "age" : 18, "height" : 1.88]

/*
// 1.取出姓名(NSObject?)
let value : NSObject? = infoDict["name"]

// 2.取出具体的姓名
if let value = value {
    let name : String? = value as? String
    
    if let name = name {
        print(name)
    }
}
*/

// 可选绑定(了解)
if let name = infoDict["name"] as? String {
    print(name.characters.count)
}

