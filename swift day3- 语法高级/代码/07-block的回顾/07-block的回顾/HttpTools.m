//
//  HttpTools.m
//  07-block的回顾
//
//  Created by 1 on 16/6/17.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "HttpTools.h"

@interface HttpTools ()

@property(nonatomic ,copy) void(^callback)(NSString *);

@end

@implementation HttpTools

- (void)loadData:(void (^)(NSString *))finishedCallback
{
    self.callback = finishedCallback;
    
    // 1.发送网络的异步请求
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSLog(@"正在发送网络请求:%@", [NSThread currentThread]);
        
        // 2.请求到数据后,回到主线程
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            NSLog(@"回到主线程,将数据回调:%@", [NSThread currentThread]);
            
            // 3.将数据回调给外面的控制器
            finishedCallback(@"json数据");
        });
        
        
    });
    
}

@end
