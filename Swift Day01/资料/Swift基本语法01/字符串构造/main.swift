//
//  main.swift
//  字符串构造
//
//  Created by 李南江 on 15/2/28.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation


/*
计算字符串长度:
C:
char *stringValue = "abc李";
printf("%tu", strlen(stringValue));
打印结果6

OC:
NSString *stringValue = @"abc李";
NSLog(@"%tu", stringValue.length);
打印结果4, 以UTF16计算
*/

var stringValue = "abc李"
print(stringValue.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
// 打印结果6, 和C语言一样计算字节数


/*
字符串拼接
C:
char str1[] = "abc";
char *str2 = "bcd";
char *str = strcat(str1, str2);

OC:
NSMutableString *str1 = [NSMutableString stringWithString:@"abc"];
NSString *str2 = @"bcd";
[str1 appendString:str2];
NSLog(@"%@", str1);

*/
var str1 = "abc";
var str2 = "lnj";
var str = str1 + str2;
print(str)

/*
格式化字符串
C: 相当麻烦, 指针, 下标等方式
OC:
NSInteger index = 1;
NSString *str1 = [NSMutableString stringWithFormat:@"http://ios.520it.cn/pic/%tu.png", index];
NSLog(@"%@", str1);
*/

var index = 1
var str3 = "http://www.520it.com/pic/\(index).png"
print(str3)

/*
字符串比较:
OC:
NSString *str1 = @"abc";
NSString *str2 = @"abc";
if ([str1 compare:str2] == NSOrderedSame)
{
    NSLog(@"相等");
}else
{
    NSLog(@"不相等");
}

if ([str1 isEqualToString:str2])
{
NSLog(@"相等");
}else
{
NSLog(@"不相等");
}

Swift:(== / != / >= / <=), 和C语言的strcmp一样是逐个比较
*/

var str4 = "abc";
var str5 = "abc";
if str4 == str5
{
    print("相等");
}else
{
    print("不相等");
}

var str6 = "abd";
var str7 = "abc";
if str6 >= str7
{
    print("大于等于");
}else
{
    print("不大于等于");
}

/*
判断前后缀
OC:
NSString *str = @"http://ios.520it.cn";
if ([str hasPrefix:@"http"]) {
    NSLog(@"是url");
}

if ([str hasSuffix:@".cn"]) {
    NSLog(@"是天朝顶级域名");
}
*/

var str8 = "http://www.520it.com"
if str8.hasPrefix("http") {
    print("是url");
}

if str8.hasSuffix(".com") {
    print("是顶级域名");
}

/*
大小写转换
OC:
NSString *str = @"abc.txt";
NSLog(@"%@", [str uppercaseString]);
NSLog(@"%@", [str lowercaseString]);
*/

var str9 = "abc.txt";
print(str9.uppercaseString)
print(str9.lowercaseString)


/*
转换为基本数据类型
OC:
NSString *str = @"250";
NSInteger number = [str integerValue];
NSLog(@"%tu", number);
*/

var str10 = "250"
// 如果str不能转换为整数, 那么可选类型返回nil
// str = "250sb" 不能转换所以可能为nil
var number:Int? = Int(str10)
if number != nil
{
    // 以前的版本println会自动拆包, 现在的不会
    print(number!)
}