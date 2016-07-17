
import Foundation

func method() {
    //...
    print("文件名:Test.swift, 方法名:method，这是一条输出")
    //...
}

method()

func printLog<T>(message: T,
    file: String = __FILE__,
    method: String = __FUNCTION__,
    line: Int = __LINE__)
{
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
}

// Test.swift
func method1() {
    //...
    printLog("这是一条输出")
    //...
}

method1()

func printLogDebug<T>(message: T,
    file: String = __FILE__,
    method: String = __FUNCTION__,
    line: Int = __LINE__)
{
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}

func method2() {
    //...
    printLogDebug("这又是一条输出")
    //...
}

method2()
// No Output

