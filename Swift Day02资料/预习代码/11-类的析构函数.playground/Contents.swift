//: Playground - noun: a place where people can play

import UIKit

class Person {
    deinit {
        print("Person --- deinit")
    }
}

var p : Person? = Person()
print("---")
p = nil
print("---")
