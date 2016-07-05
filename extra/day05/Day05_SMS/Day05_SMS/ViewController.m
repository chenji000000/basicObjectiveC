//
//  ViewController.m
//  Day05_SMS
//
//  Created by tarena on 15/12/18.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <SMS_SDK/SMSSDK.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController
//发送验证码
- (IBAction)click:(id)sender {
    //验证码：语音+短信
    /**
     参数1：
     SMSGetCodeMethodSMS 短信
     SMSGetCodeMethodVoice 语音
     参数2：接收验证码的手机号
     参数3：区域号， 中国：86
     
     */
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:@"15172076501" zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (error) {
            NSLog(@"error %@", error);
        } else {
            NSLog(@"验证码发送成功");
        }
    }];
}
//验证
- (IBAction)valid:(id)sender {
    [self.view endEditing:YES];
    [SMSSDK commitVerificationCode:_textField.text phoneNumber:@"15172076501" zone:@"86" result:^(NSError *error) {
        if (error) {
            NSLog(@"error %@", error);
        } else {
            NSLog(@"验证成功!");
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
