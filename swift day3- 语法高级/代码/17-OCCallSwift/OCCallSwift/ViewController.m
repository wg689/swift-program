//
//  ViewController.m
//  OCCallSwift
//
//  Created by 1 on 16/6/17.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "ViewController.h"
#import "OCCallSwift-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *p = [[Person alloc] init];
    p.name = @"why";
    [p test];
}

@end
