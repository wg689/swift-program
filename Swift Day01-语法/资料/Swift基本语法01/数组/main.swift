//
//  main.swift
//  数组
//
//  Created by 李南江 on 15/2/28.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation

/*
数组定义:
OC:
有值数组
NSArray *arr0 = @[@1, @2, @3];
NSArray *arr1 = [NSArray arrayWithObjects:@1, @2, @3, nil];
NSLog(@"%@", arr1);

空数组
NSArray *arr2 = @[];
NSArray *arr3 = [NSArray array];
NSLog(@"%@", arr3);

不可变数组:NSArray
可变数组:NSMutableArray
*/

//有值数组
var arr0 = [1, 2, 3]
var arr1: Array = [1, 2, 3]
var arr2: Array<Int> = [1, 2, 3]
var arr3: [Int] = [1, 2, 3]
//var arr4: Int[] = [1, 2, 3] 早期写法

//空数组
var arr5 = []
var arr6 = [Int]()
var arr7 = Array<Int>()
print(arr7)

//不可变数组:
var arr8 = []
//可变数组:
let arr9  = []

/*
元素类型
OC:
NSArray *arr = @[@1, @"lnj", @1.75];
NSLog(@"%@", arr);
*/
var arr10 = [1, "lnj", 1.75]
print(arr10)

// 如果想明确表示数组中存放的是不同类型的数据, 可以使用Any关键字, 表示数组中可以存放不同类型的数据
var arr11:Array<Any> = [1, "lnj", 1.75]
print(arr11)


/*
数组操作
1.获取长度
OC:
NSArray *arr = @[@1, @2, @3];
NSLog(@"%tu", arr.count);
*/

var arr12 = [1, 2, 3]
print(arr12.count)

/*
2.判断是否为空
OC:
NSArray *arr = @[];
NSLog(@"%d", arr.count != 0);
*/

var arr13 = [1, 2, 3]
print(arr13.isEmpty)

/*
3.检索
OC:
NSArray *arr = @[@1, @2, @3];
NSLog(@"%@", arr[0]);
*/
var arr14 = [1, 2, 3]
print(arr14[0])

/*
4.追加
OC:
NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
[arr addObject:@4];
NSLog(@"%@", arr);
*/

var arr15 = [1, 2, 3]
arr15.append(4);
print(arr15)

var arr16 = [1, 2, 3]
arr16 += [4]
// arr16 += 4 以前的版本可以这样写
//arr16 += [5, 6, 7]
arr16 += arr16[0...1] // 还可以自己搞自己
print(arr16)

/*
5.插入
OC:
NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
[arr insertObject:@4 atIndex:0];
NSLog(@"%@", arr);
*/
var arr17 = [1, 2, 3]
arr17.insert(4, atIndex: 0);
print(arr17)

/*
6.更新
OC:
NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
arr[0] = @8;
NSLog(@"%@", arr);
*/
var arr18 = [1, 2, 3]
arr18[0] = 8
print(arr18)

/*
7.删除
OC:
NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
[arr removeObject:@1];
NSLog(@"%@", arr);

NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
[arr removeLastObject];
NSLog(@"%@", arr);

NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
[arr removeAllObjects];
NSLog(@"%@", arr);
*/
var arr19 = [1, 2, 3]
arr19.removeAtIndex(0)
print(arr19)

var arr20 = [1, 2, 3]
arr20.removeLast()
print(arr20)

var arr21 = [1, 2, 3]
arr21.removeAll(keepCapacity: false) //是否保持容量, 如果为true, 即便删除了容量依然存在, 容量是2的倍数
print(arr21)
print(arr21.capacity)
//注意: 如果数组是一个不可变数组不能更新/插入和删除
//第一个版本的不可变数组是可以修改的


/*
Range
OC:
NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
[arr removeObjectsInRange:NSMakeRange(0, 2)];
NSLog(@"%@", arr);
*/

var arr22 = [1, 2, 3]
arr22.removeRange(Range(start: 1, end: 2))
print(arr22)

var arr23 = [1, 2, 3]
arr23.removeRange(0...0)
print(arr23)

// 其实Range就是半闭区间
var range = 0...5
//range = 99 // 通过报错可以推断出类型
print(range) // 通过答应也可以推断出类型

var range1:Range<Int> = 0...5
//var range2:Range<String>; // 必须遵守ForwardIndexType协议
// start 起点 end 终点
var range3:Range<Int> = Range(start: 0, end: 5)
var range4:Range<Int> = 0..<5 
print(range1)
print(range3)
print(range4)
