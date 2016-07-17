//
//  FileManager.swift
//  08-异常处理
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

enum FileReadError : ErrorType {
    case FileNameNotNull
    case FilePathNotFind
    case FileDataError
}

class FileManager: NSObject {
    func readFileContent(fileName : String) throws -> String? {
        // 1.判断文件名字是否为""
        if fileName == "" {
            // 抛出异常,当抛出异常时,后续方法不再执行
            throw FileReadError.FileNameNotNull
        }
        
        // 2.获取文件的路径
        guard let filePath = NSBundle.mainBundle().pathForResource(fileName, ofType: nil) else {
            // 抛出异常
            throw FileReadError.FilePathNotFind
        }
        
        // 3.读取文件中的内容
        guard let data = NSData(contentsOfFile: filePath) else {
            // 抛出异常
            throw FileReadError.FileDataError
        }
        
        // 4.读取到信息
        return String(data: data, encoding: NSUTF8StringEncoding)
    }
}
