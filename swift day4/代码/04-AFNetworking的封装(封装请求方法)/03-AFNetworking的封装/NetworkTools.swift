//
//  NetworkTools.swift
//  03-AFNetworking的封装
//
//  Created by 1 on 16/6/18.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit
import AFNetworking

enum RequestType {
    case GET
    case POST
}

class NetworkTools: AFHTTPSessionManager {
    // 将工具类设计成单例对象
    static let shareIntance : NetworkTools = NetworkTools()
}


// MARK:- 封装网络请求的方法
extension NetworkTools {
    func request(requestType : RequestType, URLString : String, parameters : [String : NSObject], finishedCallback : (result : AnyObject?, error : NSError?) -> ()) {
        
        // 1.抽取成功的回调
        let successCallback = { (task : NSURLSessionDataTask, result : AnyObject?) -> Void in
            finishedCallback(result: result, error: nil)
        }
        
        // 2.抽取失败的回调
        let failureCallback = { (task : NSURLSessionDataTask?, error : NSError) -> Void in
            finishedCallback(result: nil, error: error)
        }

        // 3.发送网络请求
        if requestType == .GET {
            GET(URLString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback)
        } else {
            POST(URLString, parameters: parameters, progress: nil, success: successCallback, failure: failureCallback)
        }
    }
}