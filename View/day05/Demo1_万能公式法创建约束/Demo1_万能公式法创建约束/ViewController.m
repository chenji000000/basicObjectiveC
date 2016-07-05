//
//  ViewController.m
//  Demo1_万能公式法创建约束
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
    
    
    UIImageView *imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon120.png"]];
    [self.view addSubview:imageView];
    
    UIButton *b1=[UIButton buttonWithType:UIButtonTypeSystem];
    [b1 setTitle:@"b1" forState:UIControlStateNormal];
    b1.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:b1];
    
    UIButton *b2=[UIButton buttonWithType:UIButtonTypeSystem];
    [b2 setTitle:@"b2" forState:UIControlStateNormal];
    b2.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:b2];
    
    UIButton *b3=[UIButton buttonWithType:UIButtonTypeSystem];
    [b3 setTitle:@"b3" forState:UIControlStateNormal];
    b3.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:b3];
    
    
    //预备步骤：关闭控件的自动翻译约束功能
    button1.translatesAutoresizingMaskIntoConstraints=NO;
    button2.translatesAutoresizingMaskIntoConstraints=NO;
    imageView.translatesAutoresizingMaskIntoConstraints=NO;
    b1.translatesAutoresizingMaskIntoConstraints=NO;
    b2.translatesAutoresizingMaskIntoConstraints=NO;
    b3.translatesAutoresizingMaskIntoConstraints=NO;
    
    
    
    //创建约束
    
    //1.button1距离视图左边缘20个点
    //button1.left=view.left*1+20
    NSLayoutConstraint *c1=[NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
    [self.view addConstraint:c1];
    
    //2.距离视图上边缘20个点
    NSLayoutConstraint *c2=[NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [self.view addConstraint:c2];
    
    //3.button1和button2的宽度相等
    NSLayoutConstraint *c3=[NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:button2 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    [self.view addConstraint:c3];
    
    //4.button1高度为40
    NSLayoutConstraint *c4= [NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:40];
    [self.view addConstraint:c4];
    
    //5.button1的右边缘距离button2的左边缘10个点
    NSLayoutConstraint *c5= [NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:button2 attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-10];
    [self.view addConstraint:c5];
    
    //6.button2的右边缘距离视图的右边缘20个点
    NSLayoutConstraint *c6= [NSLayoutConstraint constraintWithItem:button2 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    [self.view addConstraint:c6];
    
    //7.button2的顶部与button1的顶部对齐
    NSLayoutConstraint *c7= [NSLayoutConstraint constraintWithItem:button2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:button1 attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self.view addConstraint:c7];
    
    //8.button2的底部与button1的底部对齐
    NSLayoutConstraint *c8= [NSLayoutConstraint constraintWithItem:button2 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:button1 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.view addConstraint:c8];
    
    
    //图片
    NSLayoutConstraint *c9= [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:70];
    [self.view addConstraint:c9];
    
    NSLayoutConstraint *c10= [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
    [self.view addConstraint:c10];
    
    NSLayoutConstraint *c11= [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-50];
    [self.view addConstraint:c11];
    
    NSLayoutConstraint *c12= [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    [self.view addConstraint:c12];
    
    //三个小按钮
    NSLayoutConstraint *c13= [NSLayoutConstraint constraintWithItem:b1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:20];
    [self.view addConstraint:c13];
    
    
    NSLayoutConstraint *c14= [NSLayoutConstraint constraintWithItem:b2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:b1 attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self.view addConstraint:c14];
    
    
    NSLayoutConstraint *c15= [NSLayoutConstraint constraintWithItem:b2 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:b1 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.view addConstraint:c15];
    
    NSLayoutConstraint *c16= [NSLayoutConstraint constraintWithItem:b3 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:b1 attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self.view addConstraint:c16];
    
    
    NSLayoutConstraint *c17= [NSLayoutConstraint constraintWithItem:b3 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:b1 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.view addConstraint:c17];
    
    
    
    NSLayoutConstraint *c18= [NSLayoutConstraint constraintWithItem:b3 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    [self.view addConstraint:c18];
    
    
    NSLayoutConstraint *c19= [NSLayoutConstraint constraintWithItem:b3 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20];
    [self.view addConstraint:c19];
    
    NSLayoutConstraint *c20= [NSLayoutConstraint constraintWithItem:b1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:20];
    [self.view addConstraint:c20];
    
    NSLayoutConstraint *c21= [NSLayoutConstraint constraintWithItem:b2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:20];
    [self.view addConstraint:c21];
    
    NSLayoutConstraint *c22= [NSLayoutConstraint constraintWithItem:b3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:20];
    [self.view addConstraint:c22];
    
    NSLayoutConstraint *c23= [NSLayoutConstraint constraintWithItem:b2 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:b3 attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-10];
    [self.view addConstraint:c23];
    
    NSLayoutConstraint *c24= [NSLayoutConstraint constraintWithItem:b1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:b2 attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-10];
    [self.view addConstraint:c24];
    
    
}


@end
