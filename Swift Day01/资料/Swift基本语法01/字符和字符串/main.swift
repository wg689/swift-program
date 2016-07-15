//
//  main.swift
//  字符和字符串
//
//  Created by 李南江 on 15/2/28.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation

/*
字符:
OC: char charValue = 'a';
*/

var charValue1:Character = "a"

/*
Swift和OC字符不一样
1.Swift是用双引号
2.Swift中的字符类型和OC中的也不一样, OC中的字符占一个字节,因为它只包含ASCII表中的字符, 而Swift中的字符除了可以存储ASCII表中的字符还可以存储unicode字符, 
例如中文:
OC:char charValue = '李'; // 错误
Swift: var charValue2:Character = "李" // 正确

OC的字符是遵守ASCII标准的,Swift的字符是遵守unicode标准的, 所以可以存放时间上所有国家语言的字符(大部分)
*/
var charValue2:Character = "李" //正确

/*
注意: 双引号中只能放一个字符, 如下是错误写法
var charValue3:Character = "ab"
*/


/*
字符串:
字符是单个字符的集合, 字符串是多个字符的集合, 想要存放多个字符需要使用字符串

C:
char *stringValue = "ab";
char stringArr = "ab";

OC:
NSString *stringValue = "ab";
*/

var stringValue1 = "ab"

/*
C语言中的字符串是以\0结尾的, 例如:
char *stringValue = "abc\0bcd";
printf("%s", stringValue);
打印结果为abc

OC语言中的字符串也是以\0结尾的, 例如:
NSString *stringValue = @"abc\0bcd";
NSLog(@"%@", stringValue);
打印结果为abc
*/

var stringValue2 = "abc\0bcd"
print(stringValue2)
// 打印结果为abcbcd
// 从此可以看出Swift中的字符串和C语言/OC语言中的字符串是不一样的
