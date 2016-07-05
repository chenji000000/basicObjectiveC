//
//  ViewController.m
//  Demo2_VFL法创建约束
//
//  Created by tarena on 15/11/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button1=[UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setTitle:@"button1" forState:UIControlStateNormal];
    button1.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:button1];
    
    UIButton *button2=[UIButton buttonWithType:UIButtonTypeSystem];
    [button2 setTitle:@"button2" forState:UIControlStateNormal];
    button2.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:button2];
    
    UIButton *button3=[UIButton buttonWithType:UIButtonTypeSystem];
    [button3 setTitle:@"button3" forState:UIControlStateNormal];
    button3.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:button3];
    
    //预备：关闭翻译约束功能
    button1.translatesAutoresizingMaskIntoConstraints=NO;
    button2.translatesAutoresizingMaskIntoConstraints=NO;
    button3.translatesAutoresizingMaskIntoConstraints=NO;
    //返回值{@"b1":b1,@"b2":b2,@"b3":b3}
    NSDictionary *viewDic=NSDictionaryOfVariableBindings(button1,button2,button3);
    
    //提前创建一个字符参考表
    NSDictionary *meDic=@{@"left":@20,@"right":@20,@"spacing":@10,@"top":@20};
    
    
    //1.三个按钮等宽，中间的间距为10，左边按钮距离视图20个点，右边按钮距离视图右边为20个点
  //|-20-[b1(==b2)]-10-[b2(==b3)]-10-[b3(==b1)]-20-|
    
    NSString *hVFL=@"|-left-[button1]-spacing-[button2(==button1)]-spacing-[button3(==button1)]-right-|";
    NSArray *cs1=[NSLayoutConstraint constraintsWithVisualFormat:hVFL options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:meDic views:viewDic];
    [self.view addConstraints:cs1];
    
    NSString *vVFL=@"V:|-top-[button1(==40)]";
    
    NSArray *cs2=[NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:meDic views:viewDic];
    [self.view addConstraints:cs2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
