//
//  ViewController.m
//  BaseProject
//
//  Created by tarena on 15/12/15.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *leftBtn = [UIButton buttonWithType:0];
    leftBtn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:leftBtn];
    leftBtn.frame = CGRectMake(20, 20, 100, 60);
    [leftBtn bk_addEventHandler:^(id sender) {
        //显示侧边栏
        [self.sideMenuViewController presentLeftMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end





