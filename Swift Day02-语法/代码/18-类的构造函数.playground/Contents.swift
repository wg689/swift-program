//: Playground - noun: a place where people can play

import UIKit

/*
@interface Person : NSObject

@property (copy, nonautomic) NSString *name;
@property (assign, nonautomic) NSInteger age;

- (instanceType)initWithName:(NSString *)name age:(NSInteger)age;
- (instanceType)initWithDict:(NSDictionary *)dict;

@end


Person *p = [Person alloc] initWithName:];

*/

/*
 构造函数扩充
    1.自定义了构造函数,会覆盖原有的构造函数.如果不希望覆盖,则明确实现原有的构造函数
*/

class Person {
    var name : String = ""
    var age : Int = 0
    
    init() {
        
    }
    
    init(name : String, age : Int) {
        self.name = name
        self.age = age
    }
    
    init(dict : [String : NSObject]) {
        if let name = dict["name"] as? String {
            self.name = name
        }
        
        if let age = dict["age"] as? Int {
            self.age = age
        }
    }
}


let p = Person()
let p1 = Person(name: "why", age: 18)

let p2 = Person(dict: ["name" : "lmj", "age" : 18])
print(p2.name)









