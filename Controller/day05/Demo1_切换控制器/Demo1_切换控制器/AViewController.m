//
//  AViewController.m
//  Demo1_切换控制器
//
//  Created by tarena on 15/10/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//点击按钮后，跳到B界面
- (IBAction)gotoBVC:(id)sender {
    //1.创建B界面所属的控制器的实例
    BViewController *bvc=[[BViewController alloc] initWithNibName:@"BViewController" bundle:nil];
    //2.从当前控制器切换到B控制器
    [self presentViewController:bvc animated:YES completion:nil];
    
}


@end
