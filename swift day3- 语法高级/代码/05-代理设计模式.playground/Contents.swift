//: Playground - noun: a place where people can play

import UIKit

/*
 1.定义协议
 2.定义代理的属性
 3.调用代理的方法
 4.给代理属性赋值
*/

protocol BuyTicketProtocol : class {
    func buyTicket()
}

/*
struct Location : BuyTicketProtocol {
    func buyTicket() {
        print("----")
    }
}

enum Direction : BuyTicketProtocol {
    case East
    case West
    
    func buyTicket() {
        print("----")
    }
}
*/

/*
 1.代理的属性写法: var delegate : BuyTicketProtocol?
 2.代理最好使用weak修饰: BuyTicketProtocol : class
*/

class Person {
    var name : String = ""
    weak var delegate : BuyTicketProtocol?
    
    func gotoBeijing() {
        
        // 买火车票
        delegate?.buyTicket()
        
        print("做火车去北京")
    }
}


class Student : BuyTicketProtocol {
    func buyTicket() {
        print("帮别人买一张票")
    }
}

class YellowNiu : BuyTicketProtocol {
    func buyTicket() {
        print("给客户买一张票")
    }
}



let p = Person()
p.name = "why"

let stu = Student()
p.delegate = stu


let niu = YellowNiu()
p.delegate = niu

p.gotoBeijing()









