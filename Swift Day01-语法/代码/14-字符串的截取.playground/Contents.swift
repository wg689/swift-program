//: Playground - noun: a place where people can play

import UIKit

// 0.定义字符串
let urlString = "www.520it.com"

// 1.方式一: 将String类型转成NSString类型,再进行截取
let header = (urlString as NSString).substringToIndex(3)
let footer = (urlString as NSString).substringFromIndex(10)
let range = NSMakeRange(4, 5)
let middle = (urlString as NSString).substringWithRange(range)


// 2.方式二: 采用swift原有的方法
let headerIndex = urlString.startIndex.advancedBy(3)
let header1 = urlString.substringToIndex(headerIndex)

let footerIndex = urlString.endIndex.advancedBy(-3)
let footer1 = urlString.substringFromIndex(footerIndex)

let range1 = Range(start: urlString.startIndex.advancedBy(4), end: urlString.endIndex.advancedBy(-4))
let middle1 = urlString.substringWithRange(range1)