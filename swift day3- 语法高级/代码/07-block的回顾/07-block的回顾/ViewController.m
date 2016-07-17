//
//  ViewController.m
//  07-block的回顾
//
//  Created by 1 on 16/6/17.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "ViewController.h"
#import "HttpTools.h"

@interface ViewController ()

@property (nonatomic, strong) HttpTools *httpTools;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.httpTools = [[HttpTools alloc] init];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    __weak ViewController *weakSelf = self;
    
    [self.httpTools loadData:^(NSString *result) {
        NSLog(@"在控制器中拿到数据:%@", result);
        
        // 问题: 这里是否形成了循环引用
        weakSelf.view.backgroundColor = [UIColor redColor];
    }];
}

- (void)dealloc {
    NSLog(@"ViewController --- dealloc");
}

@end











