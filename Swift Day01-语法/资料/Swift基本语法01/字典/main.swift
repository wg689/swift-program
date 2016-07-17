//
//  main.swift
//  字典
//
//  Created by 李南江 on 15/2/28.
//  Copyright (c) 2015年 520it. All rights reserved.
//

import Foundation

/*
字典定义: 键值对
OC:
NSDictionary *dict = [NSDictionary dictionaryWithObject:@"lnj" forKey:@"name"];
NSLog(@"%@", dict);

NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"name", @"lnj", @"age", @30, nil];
NSLog(@"%@", dict);

NSDictionary *dict = @{@"name":@"lnj", @"age":@30};
NSLog(@"%@", dict);
*/

// key一定要是可以hash的(String, Int, Float, Double, Bool), value没有要求
var dict = ["name":"lnj", "age":30]
print(dict)

var dict1:Dictionary = ["name":"lnj", "age":30]
print(dict1)

var dict2:Dictionary<String,AnyObject> = ["name":"lnj", "age":30]
print(dict2)

var dict3:[String:AnyObject] = ["name":"lnj", "age":30]
print(dict3)

var dict4:[String:AnyObject] = Dictionary(dictionaryLiteral: ("name", "lnj"), ("age", 30))
print(dict4)

//不可变数组:
var dict5 = [:]
//可变数组:
let dict6  = [:]

/*
字典操作
OC:
1.获取
NSDictionary *dict = @{@"name":@"lnj", @"age":@30};
NSLog(@"%@", dict[@"name"]);

2.修改
NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name", @"lnj", @"age", @30, nil];
dict[@"name"] = @"iversion";
NSLog(@"%@", dict[@"name"]);

NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name", @"lnj", @"age", @30, nil];
[dict setObject:@"iversion" forKey:@"name"];
NSLog(@"%@", dict[@"name"]);
*/
//1.获取
var dict7 = ["name":"lnj", "age":30]
print(dict7["name"]!)

//2.修改
var dict8 = ["name":"lnj", "age":30]
dict8["name"] = "iverson"
print(dict8["name"]!)

var dict9 = ["name":"lnj", "age":30]
dict9.updateValue("iverson", forKey: "name")
print(dict9["name"]!)

// 3.更新
// updateValue返回一个可选类型, 如果字典中不存在需要更新的key, 那么返回nil, 如果存在返回原始值
var dict10 = ["name":"lnj", "age":30]
if let orignal = dict10.updateValue("iverson", forKey: "name")
{
    print(dict10["name"]!)
    print(orignal)
}

// updateValue返回一个可选类型, 如果字典中不存在需要更新的key, 那么返回nil并且会将新的键值对添加到字典中
var dict11 = ["name":"lnj", "age":30]
if let orignal = dict11.updateValue("iverson", forKey: "abc")
{
    print(dict11["abc"]!)
    print(orignal)
}
print(dict11)

/*
4.添加
OC:
NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name", @"lnj", @"age", @30, nil];
dict[@"height"] = @175;
NSLog(@"%@", dict);


NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name", @"lnj", @"age", @30, nil];
[dict setObject:@175 forKey:@"height"];
NSLog(@"%@", dict);
*/

var dict12 = ["name":"lnj", "age":30]
dict12["height"] = 175;
print(dict12)

/*
5.删除
OC:
NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"lnj", @"name", @30, @"age", nil];
[dict removeObjectForKey:@"name"];
NSLog(@"%@", dict);

NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"lnj", @"name", @30, @"age", nil];
[dict removeAllObjects];
NSLog(@"%@", dict);
*/
var dict13 = ["name":"lnj", "age":30]
dict13.removeValueForKey("name")
print(dict13)


// removeValueForKey返回一个可选类型, 如果字典中不存在需要删除的key, 那么返回nil并且不会执行任何操作, 如果存在则删除key对应的值, 并且返回被删除的值
var dict14 = ["name":"lnj", "age":30]
if let orignal = dict14.removeValueForKey("names")
{
    print(dict14)
    print(orignal)
}
print(dict14)

var dict15 = ["name":"lnj", "age":30]
dict15.removeAll(keepCapacity: true)

/*
遍历字典
OC:
NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"lnj", @"name", @30, @"age", nil];
[dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
NSLog(@"key = %@ value = %@", key, obj);
}];

NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"lnj", @"name", @30, @"age", nil];
NSArray *keys = [dict allKeys];
for (NSString *key in keys) {
NSLog(@"%@", key);
}

NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"lnj", @"name", @30, @"age", nil];
NSArray *values = [dict allValues];
for (NSString *value in values) {
NSLog(@"%@", value);
}
*/

var dict16 = ["name":"lnj", "age":30]
for (key , value) in dict16
{
    print("key = \(key) value = \(value)")
}

var dict17 = ["name":"lnj", "age":30]
for key in dict17.keys
{
    print("key = \(key)")
}

var dict18 = ["name":"lnj", "age":30]
for value in dict18.values
{
    print("value = \(value)")
}