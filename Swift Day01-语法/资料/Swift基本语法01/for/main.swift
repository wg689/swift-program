//
//  main.swift
//  for
//
//  Created by 李南江 on 15/3/17.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation

/*
for循环
格式: for (初始化表达式;循环保持条件;循环后表达式) {需要执行的语句}
OC:
int sum = 0;
for (int i = 0; i <= 10; i++) {
    sum = i++;
}
NSLog(@"%d", sum);

int sum = 0;
int i = 0;
for (; i <= 10; i++) {
    sum = i++;
}
NSLog(@"%d", sum);

int sum = 0;
int i = 0;
for (; i <= 10; ) {
    sum = i++;
    i++;
}
NSLog(@"%d", sum);


int sum = 0;
int i = 0;
for ( ; ; ) {
    sum = i++;
i++;
if (i > 10) {
    break;
}
}
NSLog(@"%d", sum);

int sum = 0;
int i = 0;
for ( ; ; ) {
    sum = i++;
    i++;
NSLog(@"%d", sum);
}
如果只有一条指令for后面的大括号可以省略
for后面的三个参数都可以省略, 如果省略循环保持语句, 那么默认为真


Swift:
0.for后的圆括号可以省略
1.只能以bool作为条件语句
2.如果只有条指令for后面的大括号不可以省略
3.for后面的三个参数都可以省略, 如果省略循环保持语句, 那么默认为真

*/
var sum:Int = 0
for var i = 0 ; i <= 10 ; i++
{
    sum = i++
}
print(sum)

var sum1:Int = 0
var i1 = 0
for  ; i1 <= 10 ; i1++
{
    sum1 = i1++
}
print(sum1)

var sum2:Int = 0
var i2 = 0
for ; i2 <= 10;
{
    sum2 = i2++
    i2++
}
print(sum2)


var sum3:Int = 0
var i3 = 0
for ; ;
{
    sum3 = i3++
    i3++
    if i3 > 10
    {
        break
    }
}
print(sum3)


/*
for in循环
格式: for (接收参数 in 取出的参数) {需要执行的语句}
for in含义: 从(in)取出什么给什么, 直到取完为止
OC:
for (NSNumber *i  in @[@1, @2, @3, @4, @5]) {
    NSLog(@"%@", i);
}

NSDictionary *dict = @{@"name":@"lnj", @"age":@30};
for (NSArray *keys  in dict.allKeys) {
    NSLog(@"%@", keys);
}

NSDictionary *dict = @{@"name":@"lnj", @"age":@30};
for (NSArray *keys  in dict.allValues) {
    NSLog(@"%@", keys);
}

Swift:
for in 一般用于遍历区间或者集合
*/

var sum4:Int = 0
for i4 in 1...10 // 会将区间的值依次赋值给i
{
    sum4 += i4;
}
print(sum4)

for dict in ["name":"lnj", "age":30]
{
    print(dict);
}

for (key, value) in ["name":"lnj", "age":30]
{
    print("\(key) = \(value)")
}