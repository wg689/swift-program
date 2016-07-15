//
//  NetworkTools.swift
//  04-AFNetwork的封装
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

import UIKit
import AFNetworking

enum RequestType : String {
    case GET = "GET"
    case POST = "POST"
}


class NetworkTools: AFHTTPSessionManager {
    // 1.将类设计成单例
    static let shareIntance : NetworkTools = NetworkTools()
}


// MARK:- 网络请求的封装
extension NetworkTools {
    func request(type : RequestType, urlString : String, parameters : [String : NSObject], finished : (result : AnyObject?, error : NSError?) -> Void) {
        
        // 1.定义成功的回调
        let successCallBack = { (task : NSURLSessionDataTask, result : AnyObject?) -> Void in
            finished(result: result, error: nil)
        }
        
        // 2.定义失败的回调
        let failureCallBack = { (task : NSURLSessionDataTask?, error : NSError) -> Void in
            finished(result: nil, error: error)
        }
        
        // 3.发送网络请求
        switch type {
            case .GET:
                GET(urlString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
            case .POST:
                POST(urlString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
        }
    }
}