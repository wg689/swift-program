//: Playground - noun: a place where people can play

// 1.Swift如何导入框架
// OC : #import <UIKit/UIKit.h>
import UIKit


// 2.如何定义标识符
// OC : int a = 20; a = 10
// Swift中定义标识符:必须明确指定该标识符是一个变量还是一个常量
// 使用var修饰的标识符是变量
// 使用let修饰的标识符是常量
var a: Int = 20;
a = 10;

let π : Double = 3.14;
// π = 3.15 错误写法


// 3.在swift中当一行中只有一条语句,那么语句结束时,可以不加;
var m : Int = 30



// 4.Swift中如何打印内容
// NSLog(@"%d", a); NSLog(@"hello world");
print(a)
print("hello world");