//: Playground - noun: a place where people can play

import UIKit

/*
 如果希望协议中的方法是可选
    1.在方法前加上optional
    2.在协议前加上@objc
 @objc是什么呢?
    让该协议保留Objective-C的一些特性
*/

@objc protocol SportProtocol {
    func playBasketball()
    @objc optional func playFootball()
}

class Person : SportProtocol {
    @objc func playBasketball() {
        
    }
}
