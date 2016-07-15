
import Foundation

// 先定义一个实现了 GeneratorType protocol 的类型
// GeneratorType 需要指定一个 typealias Element
// 以及提供一个返回 Element? 的方法 next()
class ReverseGenerator: GeneratorType {
    typealias Element = Int
    
    var counter: Element
    init<T>(array: [T]) {
        self.counter = array.count - 1
    }
    
    init(start: Int) {
        self.counter = start
    }
    
    func next() -> Element? {
        return self.counter < 0 ? nil : counter--
    }
}

// 然后我们来定义 SequenceType
// 和 GeneratorType 很类似，不过换成指定一个 typealias Generator
// 以及提供一个返回 Generator? 的方法 generate()
struct ReverseSequence<T>: SequenceType {
    var array: [T]
    
    init (array: [T]) {
        self.array = array
    }
    
    typealias Generator = ReverseGenerator
    func generate() -> Generator {
        return ReverseGenerator(array: array)
    }
}

let arr = [0,1,2,3,4]

// 对 SequenceType 可以使用 for...in 来循环访问
for i in ReverseSequence(array: arr) {
    print("Index \(i) is \(arr[i])")
}

let aaa = ReverseSequence(array: arr)
aaa.map { (Int) -> Int in
    return 1
}
