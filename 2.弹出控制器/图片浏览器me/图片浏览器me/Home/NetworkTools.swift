//
//  NetworkTools.swift
//  图片浏览器me
//
//  Created by  汪刚 on 16/7/17.
//  Copyright © 2016年 wanggang. All rights reserved.
//

import UIKit
import AFNetworking

enum RequestType1 {
    case GET
    case POST
}

class NetWorkingTools:AFHTTPSessionManager {
    static let shareInstance: NetWorkingTools  = {
        let tools = NetWorkingTools()
    tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        return tools
    }()
}

extension NetWorkingTools {
    func request(requestType:RequestType1,URLString:String,parameters:[String:NSObject],finishedCallBack:(result:AnyObject?,error: NSError?)->()){
        //1.抽取成功的回调
        let successCallBack = {
            (task : NSURLSessionDataTask, result : AnyObject?) -> Void in
            finishedCallBack(result: result, error:nil)
        }
        
        let failureCallBack = {
            (task: NSURLSessionDataTask?,error:NSError) -> Void in finishedCallBack(result: nil, error: error)
        }
        
        if requestType == .GET {
            GET(URLString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
        }else{
            POST(URLString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
        }
        
        
        
    }
}


extension NetWorkingTools {
    func loadHomeData(offset:Int,finished:(result :[[String:AnyObject]]?,error : NSError?) -> Void ){
        let urlString = "http://mobapi.meilishuo.com/2.0/twitter/popular.json"
        // 2.获取请求的参数
        let parameters = [
            "offset" : "0",
            "limit" : "30",
            "access_token" : "b92e0c6fd3ca919d3e7547d446d9a8c2"]

        NetWorkingTools.shareInstance.request(.GET, URLString: urlString, parameters: parameters) { (result, error) -> () in
            if error != nil{
                print(error)
                return;
            }
            guard let resultDict = result as? [String :AnyObject] else {
                finished(result : nil,error: NSError(domain:"数据错误",code:-1011,userInfo: nil))
                return
            }
            
            
            guard let results = resultDict["data"] as?[[String :AnyObject]] else {
                finished(result: nil , error: NSError(domain: "数据错误", code: -1012, userInfo: nil))
                return
            }
            finished(result: results, error: nil)
        }
        
        
    }
}
