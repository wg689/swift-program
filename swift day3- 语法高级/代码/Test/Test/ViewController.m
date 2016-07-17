//
//  ViewController.m
//  Test
//
//  Created by 1 on 16/6/17.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     __weak和__unsafe_unretained的相同点和区别
        相同点: 都不会对原有的对象进行一次retain操作
        不同点:
            1.__weak修饰的引用,当对象销毁时,会自动将指针指向nil
            2.__unsafe_unretained修饰的引用,当对象销毁时,会依然指向之前的内存地址. 注意:很容易访问僵尸对象
     */
    
    Student *stu = [[Student alloc] init];
    stu.name = @"why";
    
    __unsafe_unretained Student *stu1 = stu;
    
    stu = nil;
    
    NSLog(@"%@", stu1.name);
}

@end
