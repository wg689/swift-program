import Foundation

func callMe() {
    //...
}

func callMeWithParam(obj: AnyObject!) {
    //...
}

let someMethod = Selector("callMe")
let anotherMethod = Selector("callMeWithParam:")

func turnByAngle(theAngle: Int, speed: Float) {
    //...
}

let method = Selector("turnByAngle:speed:")

func aMethod(external paramName: AnyObject!) {
    //...
}

let s = Selector("aMethodWithExternal:")
