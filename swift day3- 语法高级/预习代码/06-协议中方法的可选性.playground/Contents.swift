//: Playground - noun: a place where people can play

import UIKit

@objc
protocol SportProtocol {
    func playFootball()
    
    optional func playBasketball()
}

class Person : SportProtocol {
    @objc func playFootball() {
        print("玩足球")
    }
    
    @objc func playBasketball() {
        
    }
}