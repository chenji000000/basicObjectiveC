//
//  MyViewController.m
//  Demo3_CustomViewController
//
//  Created by tarena on 15/10/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"



@implementation MyViewController
//当这个视图控制器对象加载完后，自动调用此方法，在视图显示之前此方法一定会调用一次
- (void)viewDidLoad {
    [super viewDidLoad];
    //将当前视图的背景色改为白色
    self.view.backgroundColor=[UIColor whiteColor];
    //写一些界面配置代码
    //1.向当前控制器中的视图添加标签
    //1.1.创建对象
    UILabel *label=[[UILabel alloc] init];
    //1.2设置属性
    label.text=@"显示这些文字";
    //1.3设置位置和大小
    label.frame=CGRectMake(20, 40, 200, 30);
    label.backgroundColor=[UIColor grayColor];
    //1.4添加到父视图中
    //[vc.view addSubview:label];
    [self.view addSubview:label];
    //2.向当前控制器中的视图添加按钮
    //2.1.创建对象
//    UIButton *button=[[UIButton alloc] init];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];//工厂生产
    //2.2设置属性
    [button setTitle:@"我是一个按钮" forState:UIControlStateNormal];
    //2.3设置位置和大小
    button.frame=CGRectMake(20, 70, 200, 30);
    button.backgroundColor=[UIColor lightGrayColor];
    //2.4添加到父视图中
    [self.view addSubview:button];
    //3.对比一下Demo2和Demo3的区别
}




@end
