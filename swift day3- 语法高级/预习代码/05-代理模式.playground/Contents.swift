//: Playground - noun: a place where people can play

import UIKit

protocol BuyTicketDelegate : class {
    func buyTicket()
}

class Person {
    weak var delegate : BuyTicketDelegate?
    
    func gotoBeijing() {
        delegate?.buyTicket()
    }
}


class YellowCattle : BuyTicketDelegate {
    func buyTicket() {
        print("黄牛帮你买了一张票")
    }
}

let yellowCattle = YellowCattle()
let person = Person()
person.delegate = yellowCattle

person.gotoBeijing()