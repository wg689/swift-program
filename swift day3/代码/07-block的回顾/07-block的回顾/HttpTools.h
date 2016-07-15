//
//  HttpTools.h
//  07-block的回顾
//
//  Created by 1 on 16/6/17.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTools : NSObject

- (void)loadData:(void(^)(NSString *))finishedCallback;

@end
