//
//  BViewController.m
//  Demo2_导航控制器
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
    self.navigationItem.title=@"B界面";
    
}
- (IBAction)goBack:(id)sender {
    //通知当前管理器bvc的那个导航，回到上一个界面
    [self.navigationController popViewControllerAnimated:YES];
}


@end
