//
//  ViewController.m
//  Demo2_键盘通知
//
//  Created by tarena on 15/11/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//View看的见时，增加注册监听键盘
-(void)viewWillAppear:(BOOL)animated
{
   [super viewWillAppear:animated];
//增加键盘的弹起通知监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    //增加键盘的收起通知监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeKeyboard:) name:UIKeyboardWillHideNotification object:nil];
}
//有键盘弹起，此方法就会被自动执行
-(void)openKeyboard:(NSNotification *)noti
{
    //获取键盘的frame数据
    CGRect keyboardFrame=[noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //获取键盘动画的种类
   int options=[noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    //获取键盘动画的时长
    NSTimeInterval duration=[noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    
    //修改文本框底部的约束的值
    self.bottomConstraint.constant=keyboardFrame.size.height;
    
    //在动画内调用LayoutIfneeded方法
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
    
    
    
    

//    NSLog(@"%@",noti.userInfo);
}

-(void)closeKeyboard:(NSNotification *)noti
{
    //获取键盘动画的种类
    int options=[noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    //获取键盘动画的时长
    NSTimeInterval duration=[noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    //修改文本框底部的约束的值
    self.bottomConstraint.constant=0;
    
    
    
    //在动画内调用LayoutIfneeded方法
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
    
    
   
    
    

}



//View看不见时，取消注册的键盘监听
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //取消注册过的通知
    //只按照通知的名字，取消掉具体的某个通知，而不是全部一次性取消掉所有注册过的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];

}

//点击空白处，收起键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    [self.view endEditing:YES];
}




@end
