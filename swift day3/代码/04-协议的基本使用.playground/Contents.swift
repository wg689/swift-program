//: Playground - noun: a place where people can play

import UIKit

/*
OC写法
@protocol SportProtocol : NSObject 

- (void)playBasketball;
- (vod)playFootbal;

@end
*/

// 1.定义协议
// NSObjectProtocol : 基协议

protocol CrazySportProtol : NSObjectProtocol {
    func jumping()
}

protocol SportProtocol : CrazySportProtol {
    // 协议中的方法
    func playBasketball()
    func playFootbal()
}

// 2.定义一个类,并且让类遵守协议
// class Person : SportProtocol
class Person : NSObject, SportProtocol {
    func playBasketball() {
        print("打篮球")
    }
    
    func playFootbal() {
        print("踢足球")
    }
    
    func jumping() {
        print("蹦极")
    }
}