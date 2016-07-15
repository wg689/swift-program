
import Foundation

class MyManager1 {
    class var sharedManager : MyManager1 {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var staticInstance : MyManager1? = nil
        }
        
        dispatch_once(&Static.onceToken) {
            Static.staticInstance = MyManager1()
        }
        
        return Static.staticInstance!
    }
}

MyManager1.sharedManager

class MyManager2 {
    private static let sharedInstance = MyManager2()
    class var sharedManager : MyManager2 {
        return sharedInstance
    }
}

MyManager2.sharedManager

private let sharedInstance = MyManager3()
class MyManager3  {
    class var sharedManager : MyManager3 {
        return sharedInstance
    }
}

MyManager3.sharedManager

class MyManager  {
    private static let sharedInstance = MyManager()
    class var sharedManager : MyManager {
        return sharedInstance
    }
}

MyManager.sharedManager
