//
//  ViewController.m
//  Test
//
//  Created by 1 on 16/6/15.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlString = @"http://www.520it.com/小码哥";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    UIWebView *webView = [[UIWebView alloc] init];
    
    [webView loadRequest:request];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1234.plist" ofType:nil];
    
    [NSArray arrayWithContentsOfFile:path];
}

@end
