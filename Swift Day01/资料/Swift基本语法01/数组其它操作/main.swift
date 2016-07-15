//
//  main.swift
//  数组其它操作
//
//  Created by 李南江 on 15/2/28.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation



/*
数组的批量操作
OC:
NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
NSRange range = NSMakeRange(0, 2);
// [arr replaceObjectsInRange:range withObjectsFromArray:@[@99, @88]];
[arr replaceObjectsInRange:range withObjectsFromArray:@[@99, @88, @77, @66]];
NSLog(@"%@", arr);
*/
var arr = [1, 2, 3]
//arr[0...1] = [99, 88]
//arr[0...1] = [99, 88, 77, 66]
// 等价于上一行代码
//arr.replaceRange(Range(start: 0, end: 2), with: [99, 88, 77, 66])
arr.replaceRange(1..<2, with: [99, 88, 77, 66])
print(arr)

/*
4.遍历
OC:
NSArray *arr = @[@1, @2, @3];
for (int i = 0; i < arr.count; i++) {
    NSLog(@"%@", arr[i]);
}

for (NSNumber *number in arr) {
    NSLog(@"%@", number);
}
*/
var arr1 = [1, 2, 3]
for var i = 0 ; i < arr1.count ; i++
{
    print(arr1[i])
}

for number in arr1
{
    print(number)
}

for i in 0..<arr1.count
{
    print(arr1[i])
}

// 取出数组中某个区间范围的值
var arr2 = [1, 2, 3]
for number in arr2[0..<3]
{
    print(number)
}
