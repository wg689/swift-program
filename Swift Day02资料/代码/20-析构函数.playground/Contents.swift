//: Playground - noun: a place where people can play

import UIKit

class Dog {
    var name : String = ""
    var weight : Double = 0
    
    deinit {
        print("Dog--------deinit")
    }
}

var dog : Dog? = Dog()

dog = nil