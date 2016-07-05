//
//  MyViewController.m
//  Demo4_UIAlertView
//
//  Created by tarena on 15/10/12.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"
//要想让当前控制器真能成为代理，需要遵守委托方
//UIALertView 定义的协议 UIALertViewDelegate
@interface MyViewController ()<UIAlertViewDelegate>

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//点击按钮，弹出警告框
- (IBAction)showAlertView:(id)sender {
    //1.创建警告框的实例
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
   //2.设置警告框的代理对象，当用户对alertView有任何操作时，都会交给代理对象来响应
   //此句的目的是为了让alert记住当前控制器的引用
    //有了引用就可以调用self的方法
    alert.delegate=self;
    
    //3.设置警告框的显示样式
    alert.alertViewStyle=UIAlertViewStyleLoginAndPasswordInput;
    
    //4.显示警告框
    [alert show];
}
//实现协议中的方法
//此方法会在委托方发生具体的事件时，自动调用
//因为选择实现的方法从名称上来看，点了那个按钮
//所以为了判断用户点击的按钮,所以实现该方法
//约束代理方的协议中的所有方法的第一个参数
//一定是委托方自己
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //获取alertView上的文本框
    UITextField *loginText=[alertView textFieldAtIndex:0];
    UITextField *pwdText=[alertView textFieldAtIndex:1];
    if(buttonIndex==0){
        NSLog(@"点击了cancel按钮");
    }else{
        NSLog(@"%@,%@",loginText.text,pwdText.text);
    }
    
}

@end
