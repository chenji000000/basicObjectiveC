//
//  OtherViewController.m
//  Demo1_导航控制器
//
//  Created by tarena on 15/10/15.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"另一个VC";
    //配置导航栏的左侧按钮
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickBack:)];
    
    //设置工具条隐藏
    //    self.navigationController.toolbarHidden=YES;
    //    self.navigationController.navigationBarHidden=YES;
}

-(void)clickBack:(UIBarButtonItem*)item
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

//触碰控制器自带的视图时，自动执行该方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //设置导航栏在显示与隐藏间切换
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBarHidden animated:YES];
}

@end
