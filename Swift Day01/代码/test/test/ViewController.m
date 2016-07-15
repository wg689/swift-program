//
//  ViewController.m
//  test
//
//  Created by 1 on 16/6/14.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.定义不可变数组
    NSArray *array = @[@"why", @"yz"];
    // 2.定义可变数组
    NSMutableArray *arrayM = [NSMutableArray array];
    [arrayM addObject:@""];
    
    // 3.定义不可变字典
    NSDictionary *dict = @{@"name" : @"why", @"age" : @18, @"height" : @1.88};
    
    // 4.定义可变字典
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    [dictM setObject:@"" forKey:@""];
    
    dictM[@"age"] = @18;
    
    dictM objectForKey:<#(nonnull id)#>
}

@end
