//
//  BViewController.m
//  Demo1_切换控制器
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//点击按钮后，返回到A界面
- (IBAction)goBack:(id)sender {
    //使用dismiss回到上一个VC时，不需要通过参数
    //来指定回到哪里，系统会记录从哪个VC来到的B界面
    //从哪里来，回到那里去
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
