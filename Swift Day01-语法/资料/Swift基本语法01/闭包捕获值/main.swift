//
//  main.swift
//  闭包捕获值
//
//  Created by 李南江 on 15/4/3.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation

func getIncFunc(inc: Int) -> (Int) -> Int
{
    var max = 10
    func incFunc(x :Int) ->Int{
        print("incFunc函数结束")
//        return inc + x
        max++
        return max + x
    }
    // 当执行到这一句时inc参数就应该被释放了, 但是由于在内部函数中使用到了它, 所以它被捕获了
    // 同理, 当执行完这一句时max变量就被释放了,但是由于在内部函数中使用到了它, 所以它被捕获了
    print("getIncFunc函数结束")
    return incFunc
}

// 被捕获的值会和与之对应的方法绑定在一起, 同一个方法中的变量会被绑定到不同的方法中
let incFunc = getIncFunc(5)
print(incFunc(5))
print(incFunc(5))
let incFunc2 = getIncFunc(5)
print(incFunc2(5))