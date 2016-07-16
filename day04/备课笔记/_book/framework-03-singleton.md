# 单例

## 单例的目标

* 内存中只有一个对象实例
* 提供一个全局访问点

## OC 中的单例

```objc
+ (instancetype)sharedManager {
    static id instance;

    static dispatch_once_t onceToken;
    NSLog(@"%ld", onceToken);

    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });

    return instance;
}
```

### Swift 中的单例

```objc
static var instance: NetworkTools?
static var token: dispatch_once_t = 0

/// 在 swift 中类变量不能是存储型变量
class var sharedNetworkTools: NetworkTools {
    dispatch_once(&token, { () -> Void in
        self.instance = NetworkTools()
    })

    return self.instance!
}
```

> 不过！在 Swift 中 `let` 本身就是线程安全的

* 改进过的单例代码

```swift
private static let instance = NetworkTools()
/// 在 swift 中类变量不能是存储型变量
class var sharedNetworkTools: NetworkTools {
    return instance
}

override init() {
    println("come baby")
}
```

