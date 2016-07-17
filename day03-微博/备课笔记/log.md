# LOG显示
+ 调试阶段和部署阶段
+ 调试阶段
    * `需要`显示LOG
    * 便于调试
+ 部署阶段
    * `不需要`显示LOG
    * 打印LOG非常`消耗性能`
    * 用户`看不到`LOG, 也`看不懂`LOG

+ Log 输出是程序开发中很重要的组成部分, 但它并不是直接的业务代码

+ 在调试阶段我们我们往往需要更好更精确的输出，这包括输出这个 log 的文件, 调用的行号以及所处的方法名字等等


---
+ 日志框架(QorumLogs)
    * QorumLogs是Xcode上一个集快捷、简单、强大和灵活于一身的日志框架

    * 仅需修改一个变量的值就能控制日志显示

    * 提供不同级别日志显示, 并且可以指定哪些文件, 哪些级别的日志需要显示

    * 可以结合`XcodeColors`显示不同色彩日志
+ 安装
    ```ruby
    platform :ios, '8.0'
    use_frameworks!

    pod 'QorumLogs'
    ```
+ 使用
    ```swift
    // 打开LOG
    QorumLogs.enabled = true
    // 测试LOG
     QorumLogs.test()
    // 设置需要显示的等级
    QorumLogs.minimumLogLevelShown = 4
    // 限定输出文件
    QorumLogs.onlyShowThisFile(MainViewController)

    QL1("lnj") // debug
    QL2("lnj")  // info
    QL3("lnj") // warning
    QL4("lnj") // error
    QLPlusLine() // 打印加号作为分割线
    QLShortLine() // 打印等号作为分割线
    ```

+ 下载地址: [https://github.com/goktugyil/QorumLogs](https://github.com/goktugyil/QorumLogs)

+ OC中也有一个非常好用的日志框架[CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack)

---
+ 显示颜色(XcodeColors)
    * 下载并运行`XcodeColors.xcodeproj`
    * 重启Xcode(必须完全退出)

+ 下载地址: [https://github.com/robbiehanson/XcodeColors](https://github.com/robbiehanson/XcodeColors)

---

#use_frameworks!
+ swift不允许静态库, 因为动态框架有命名空间类，而静态库没有
    * 在iOS 8之前，CocoaPods被作为静态库来创建，就是很"臃肿的"二进制文件
    * iOS 8引入了动态框架，这就允许了代码、图片和其他的东西（assets）可以被一起打包
+ 这意味着你的框架必须包含了必要的Swift运行时库。因此，用Swift语言写的pods必须以动态框架形式创建

+ 所以想要在Swift中使用CocoaPods，你必须明确的写出`use_frameworks!` 来选择使用框架

---
# 自定义LOG

| 符号 | 类型 | 描述 |
| -- | -- | -- |
| FILE	|String	|包含这个符号的文件的路径|
| LINE	|Int	|符号出现处的行号|
| COLUMN	|Int	|符号出现处的列|
| FUNCTION	|String	|包含这个符号的方法名字|

+ 我们可以通过使用这些符号来写一个好一些的 Log 输出方法
```swift
func NJLog<T>(message: T,
                    file: String = __FILE__,
                  method: String = __FUNCTION__,
                    line: Int = __LINE__)
{
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
}
```
```swift
func method() {
    //...
    printLog("www.520it.com")
    //...
}
```

+ 控制显示
+ 在 C 系语言中，可以使用 #if 或者 #ifdef 之类的编译条件分支来控制哪些代码需要编译，而哪些代码不需要

+ Swift 中没有宏定义的概念，因此我们不能使用 #ifdef 的方法来检查某个符号是否经过宏定义

+ 但是为了控制编译流程和内容，Swift 还是为我们提供了几种简单的机制来根据需求定制编译内容的

+ 首先是 #if 这一套编译标记还是存在的，使用的语法也和原来没有区别, 只不过我们需要将宏定义替换为自定义符号

+ 自定义符号
    * 找到项目的 Build Settings 中
    * 找到 Swift Compiler - Custom Flags
    * 在其中的 Other Swift Flags 加上 -D NJ_DEBUG

```swift
func NJLog<T>(message: T,
                    file: String = __FILE__,
                  method: String = __FUNCTION__,
                    line: Int = __LINE__)
{
#if NJ_DEBUG
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
#endif
}
```
