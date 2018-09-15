//
//  QTOpinionViewController.m
//  ZhuRenWong
//
//  Created by wangfeng on 15-4-29.
//  Copyright (c) 2015年 qitian. All rights reserved.
//

    //#define FEED_BACK @"http://api.zrwjk.cytong.cn/api?method=feed-back"
#import "QTOpinionViewController.h"
#import "UITextField+WF.h"
@interface QTOpinionViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation QTOpinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scrollView.contentSize = CGSizeMake(0, 481);


    //self.textView.frame =  CGRectMake(10, 60, 300, 200);

    CGRect rect = self.textView.frame;
    CGFloat x = rect.origin.x;
    CGFloat  y = rect.origin.y;
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;

    self.textView.font = [UIFont systemFontOfSize:14];
    self.textView.delegate = self;
    self.textView.returnKeyType = UIReturnKeyDone;
    self.textView.textColor = [UIColor lightGrayColor];

    UIImageView *bgImg = [[UIImageView alloc] initWithFrame:CGRectMake(x-2, y-2, w+4, h+6)];
    bgImg.image = [[UIImage imageNamed:@"common_text_bg"]
                   stretchableImageWithLeftCapWidth:7 topCapHeight:7];
    [self.scrollView addSubview:bgImg];
    [self.scrollView sendSubviewToBack:bgImg];


     rect = self.phoneNum.frame;
     x = rect.origin.x;
      y = rect.origin.y;
     w = rect.size.width;
    h = rect.size.height;


    UIImageView *bgImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(x-2, y-2, w+4, h+6)];
    bgImg2.image = [[UIImage imageNamed:@"common_text_bg"]
                   stretchableImageWithLeftCapWidth:7 topCapHeight:7];
    [self.scrollView addSubview:bgImg2];
    [self.scrollView sendSubviewToBack:bgImg2];



    UIView*view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 30)];

        self.phoneNum.leftView = view;
      self.phoneNum.leftViewMode = UITextFieldViewModeAlways;







}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)conFirm:(id)sender {

    if ([ self.phoneNum.text isEqualToString:@""]) {
//        [[QTCommonTools sharedQTCommonTools] showAlert:@"请输入手机号码"];
        return;
    }
    if (![self.phoneNum isTelphoneNum]) {
//        [[QTCommonTools sharedQTCommonTools] showAlert:@"请输入正确的手机号码"];
        return;
    }
    if([self.textView.text isEqualToString:@""]){
//        [[QTCommonTools sharedQTCommonTools] showAlert:@"请输入内容"];
        return;

    }


    [self.view endEditing:YES];


}

#pragma mark textView delegate

-(void)textViewDidBeginEditing:(UITextView *)textView
{
//    ECLog(@"开始写");
    textView.textColor = [UIColor blackColor];
    textView.text = @"";
}

    //
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){

            //判断输入的字是否是回车，即按下return
                                       //在这里做你响应return键的代码

        [textView resignFirstResponder];
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    
    return YES;
}



@end
