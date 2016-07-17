# 空项目

+ Swift项目和OC项目不一样, Swift项目中没有main.m文件
    + 第三个参数初始化一个 UIApplication 或其子类的对象并开始接收事件 (传入 nil，意味使用默认的 UIApplication)”
    + 最后一个参数指定了 AppDelegate 类作为应用的委托，它被用来接收类似 didFinishLaunching 或者 didEnterBackground 这样的与应用生命周期相关的委托方法

```objc
int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
```

+ AppDelegate.swift文件中有一个@UIApplicationMain标签
+ 如果注释掉这个表情, 系统会报错`Undefined symbols _main`, 说找不到main函数
    * 在编译的时候, 编译器将寻找这个标记所在的类
    * 自动插入像mian这样的模板代码
+ 其实 Swift 的 app 也是需要 main 函数的，只不过默认情况下是 @UIApplicationMain 帮助我们自动生成了而已

+ 一般情况下，我们并不需要对这个标签做任何修改，但是当我们如果想要使用 UIApplication 的子类而不是它本身, 就需要自定义mian函数
    * 注释标签
    * 手动添加main函数
    ```swift
    UIApplicationMain(Process.argc, Process.unsafeArgv, nil,
    NSStringFromClass(AppDelegate))
    ```


