### 用代码动态创建类

* 跟踪 `类` 名称

```swift
print(vc)
```

* 小结
    * 在 swift 中，类名的组成格式是 `namespace.类名`
    * namespace 对应的是 `Product Name`

* 从 `mainBundle` 的 `infoDictionary` 获取命名空间名称

```swift
print(NSBundle.mainBundle().infoDictionary)

let namespace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
```

* Tips
    + 在 swift 中，类名是包含命名空间的
    + 命名空间默认是项目名称，同一个命名空间全局共享
    + 如果新建项目时，项目名称中包含有中文，可以按照下图修改
    + ![](./images/未登录界面截图/命名空间.jpg)


---
* Objective-C 一个一直以来令人诟病的地方就是没有命名空间，在应用开发时，所有的代码和引用的静态库最终都会被编译到同一个域和二进制中。这样的后果是一旦我们有重复的类名的话，就会导致编译时的冲突和失败

* 为了避免这种事情的发生，Objective-C 的类型一般都会加上两到三个字母的前缀，比如 Apple 保留的 NS 和 UI 前缀

* 这种做法可以解决部分问题，至少我们在直接引用不同人的库时冲突的概率大大降低了，但是前缀并不意味着不会冲突，有时候我们确实还是会遇到即使使用前缀也仍然相同的情况

* 在 Swift 中，由于可以使用命名空间了，即使是名字相同的类型，只要是来自不同的命名空间的话，都是可以和平共处的

* Tips
    + 使用类型嵌套的方法来指定访问的范围, 也可以解决以上问题

---
* 调整创建控制器代码，根据类名动态创建类

```swift
        // 0.动态获取命名空间
        let namespace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String

        // 1.拼接命名空间并生成Class
        // 在Swift中, 如果想通过一个字符串创建一个类, 那么该类名必须包含命名空间名称
        guard let cls:AnyClass = NSClassFromString(namespace + "." + childControllerName) else {
            return
        }

        // 2.告诉编译器真实类型是UIViewController
        // 在Swift中如果向通过一个AnyClass来创建一个对象, 必须先明确这个类的类型
        // 通过 AnyObject.Type 这种方式所得到是一个类的类型
        let vcCls = cls as! UIViewController.Type
        // 3.实例化控制器
        let childController = vcCls.init()

```

# 元类型
+ AnyClass是一个元类型
    ```typealias AnyClass = AnyObject.Type```
+ 通过 AnyObject.Type 这种方式所得到是一个元类型

+ 在类型的名称后面加上 .Type，比如 A.Type 代表的是 A 这个类型的类型

```swift
class A {

}
let typeA: A.Type = A.self
```

* 而在从 A 中取出其类型时，我们需要使用到 .self
* self 可以用在类型后面取得类型本身，也可以用在某个实例后面取得这个实例本身

```swift
class A {
    class func method() {
        print("Hello")
    }
}

let typeA: A.Type = A.self
typeA.method()
```

---

# 异常处理
    * 以前NSError 的使用方式其实变相在鼓励开发者忽略错误, 例如大部分程序猿在开发时候都喜欢忽略错误
    * 例如`writeToFile`方法在绝大多数情况下，这个方法并不会发生什么错误，而很多工程师也为了省事和简单，会将输入的 error 设为 nil
    * 但是事实上这个 API 调用是会出错的，比如设备的磁盘空间满了的时候，写入将会失败。但是当这个错误出现并让你的 app 陷入难堪境地的时候，你几乎无从下手进行调试 -- 因为系统曾经尝试过通知你出现了错误，但是你却选择视而不见。

```objc
[data writeToFile: path options: options error: nil];

```

+
    * 为了避免这个问题,  Swift 2.0 中，Apple 为这么语言引入了异常机制。现在，这类带有 NSError 指针作为参数的 API 都被改为了可以抛出异常的形式。比如 writeToFile:options:error:
    * 如果你不使用 try 的话，是无法调用 writeToFile: 方法的，它会产生一个编译错误，这让我们无法有意无意地忽视掉这些错误

```swift
do {
    try d.writeToFile("Hello", options: [])
} catch let error as NSError {
    print ("Error: \(error.domain)")
}

```
# try/try?/try!
+ try :
    + 正常处理异常, 一旦有异常就执行catch
+ try!:
    + 强制处理异常(忽略异常),也就是说告诉系统一定不会发生异常, 如果真的发生了异常, 那么程序会崩溃
+ try?:
    + 忽略异常, 告诉系统可能有异常也可能没有异常, 如果发生异常返回值就是nil, 如果没有发生异常, 会将返回值包装为一个可选类型的值
+ 开发中推举使用try? 和 try , 不推荐使用try!
