//: Playground - noun: a place where people can play

import UIKit

let age = 21

/*
func online(age : Int) {
    if age >= 18 {
        if 带了钱 {
            if 带了身份证 {
                print("开机上网")
            } else {
                print("回家拿身份证")
            }
            
        } else {
            print("回家拿钱")
        }
    } else {
        print("回家找妈妈")
    }
}
*/

// guard : 守卫

func online(age : Int) {
    // 1.判断年龄
    guard age >= 18 else {
        print("回家找妈妈")
        return
    }
    
    // 2.判断是否带了钱
    guard 带了钱 else {
        print("回家拿钱")
        return
    }
    
    // 3.判断是否带了身份证
    guard 带了身份证 else {
        print("回家拿身份证")
        return
    }
    
    print("开机上网")
}

online(age)