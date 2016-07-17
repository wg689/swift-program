//
//  HttpTool.swift
//  07-闭包
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit

class HttpTool: NSObject {
    func loadData(finished : (jsonData : String) -> ()) {
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            print("发送异步网络请求:\(NSThread.currentThread())")

            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                print("回到主线程,将数据回调出去")
                
                finished(jsonData: "json数据")
            })
        }
    }
}
