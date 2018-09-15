//
//  UITextField+WF.m
//  ZhuRenWong
//
//  Created by wangfeng on 15-4-25.
//  Copyright (c) 2015年 qitian. All rights reserved.
//

#import "UITextField+WF.h"

@implementation UITextField(WF)

-(BOOL)isTelphoneNum{

    NSString *telRegex = @"^1[3578]\\d{9}$";
    NSPredicate *prediate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telRegex];
    return [prediate evaluateWithObject:self.text];
}

@end
