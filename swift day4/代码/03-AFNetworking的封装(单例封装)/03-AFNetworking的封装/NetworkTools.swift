//
//  NetworkTools.swift
//  03-AFNetworking的封装
//
//  Created by 1 on 16/6/18.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit
import AFNetworking

class NetworkTools: AFHTTPSessionManager {
    // 将工具类设计成单例对象
    static let shareIntance : NetworkTools = NetworkTools()
}
