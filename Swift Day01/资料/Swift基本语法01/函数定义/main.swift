//
//  main.swift
//  函数定义
//
//  Created by 李南江 on 15/3/17.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation

/*
函数: 完成某个特定任务的代码块, 给代码起一个合适的名称称之为函数名称. 以后需要执行代码块只需要利用函数名称调用即可, 好比每个人都有一个名字, 叫名字就能找到对应的人
格式:
func 函数名称(参数名:参数类型, 参数名:参数类型...) -> 函数返回值 {函数实现部分}

OC:
- (void)say
{
    NSLog(@"hello");
}
- (void)sayWithName:(NSString *)name
{
    NSLog(@"hello %@", name);
}
- (void)sayWithName:(NSString *)name age:(NSInteger)age
{
    NSLog(@"hello %@ , I'm %tu years old", name, age);
}
- (NSString *)info
{
    return @"name = lnj, age = 30";
}
- (NSString *)infoWithName:(NSString *)name age:(NSInteger)age
{
    return [NSString stringWithFormat:@"name = %@, age = %tu", name, age];
}

Person *p = [[Person alloc] init];
[p say];
[p sayWithName:@"lnj"];
[p sayWithName:@"lnj" age:30];
NSLog(@"%@", [p info]);
NSLog(@"%@", [p infoWithName:@"lnj" age:30]);
*/

// 无参无返回值
func say() -> Void
{
    print("hello")
}

func say1() // 如果没有返回值可以不写
{
    print("hello")
}
say1()

// 有参无返回值
func sayWithName(name:String)
{
    print("hello \(name)")
}
sayWithName("lnj")

func sayWithName1(name:String, age:Int)
{
    print("hello \(name) , I'm \(age) years old ")
}
sayWithName1("lnj", age: 30)

// 无参有返回值
func info() -> String
{
    return "name = lnj, age = 30"
}
print(info())

// 有参有返回值
func info(name:String, age:Int) -> String
{
    return "name = \(name), age = \(age)"
}
print(info("lnj", age:30))


/*
嵌套函数
*/
func showArray(array:[Int])
{
    for number in array
    {
        print("\(number), ")
    }
}
/*
func swap(inout a:Int, inout b:Int)
{
    let temp = a
    a = b
    b = temp
}
*/
var number = 998;
func bubbleSort(inout array:[Int])
{
    print(number)
    func swap(inout a:Int, inout b:Int)
    {
        print(number)
        let temp = a
        a = b
        b = temp
    }
    
    let count = array.count;
    for var i = 1; i < count; i++
    {
        for var j = 0; j < (count - i); j++
        {
            if array[j] > array[j + 1]
            {
                swap(&array[j], b: &array[j + 1])
//                let temp = array[j]
//                array[j] = array[j + 1]
//                array[j + 1] = temp

            }
        }
    }
}

var arr:Array<Int> = [31, 13, 52, 84, 5]
bubbleSort(&arr)
showArray(arr)


