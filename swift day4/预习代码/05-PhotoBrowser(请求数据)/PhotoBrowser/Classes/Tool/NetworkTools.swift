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
    static let shareIntance : NetworkTools = {
        let tools = NetworkTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        
        return tools
    }()
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


// MARK:- 请求主页数据
extension NetworkTools {
    func loadHomeStatus(finished : (result : [[String : AnyObject]]?, error : NSError?)-> Void) {
        // 1.获取请求的URLString
        let urlString = "http://mobapi.meilishuo.com/2.0/twitter/popular.json"
        
        // 2.获取请求参数
        let parameters = [
            "offset" : "0",
            "limit" : "30",
            "page" : "1",
            "access_token" : "b92e0c6fd3ca919d3e7547d446d9a8c2"]
        
        // 3.发送网络请求
        request(.GET, urlString: urlString, parameters: parameters) { (result, error) -> Void in
            // 1.获取数据的字典
            guard let resultDict = result as? [String : AnyObject] else {
                finished(result: nil, error: NSError(domain: "数据错误", code: -1011, userInfo: nil))
                return
            }
            
            // 2.从字典中取出数据,进行回调
            guard let results = resultDict["data"] as? [[String : AnyObject]] else {
                finished(result: nil, error: NSError(domain: "数据错误", code: -1012, userInfo: nil))
                return
            }
            
            // 3.回调数据
            finished(result: results, error: nil)
        }
    }
}









