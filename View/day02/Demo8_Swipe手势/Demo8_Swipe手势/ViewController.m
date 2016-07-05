//
//  ViewController.m
//  Demo8_Swipe手势
//
//  Created by tarena on 15/10/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer *swipeGR=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    //轻扫手势的常规设置
    //设置手势支持的方向，direction为可组合的枚举类型
    swipeGR.direction=UISwipeGestureRecognizerDirectionRight|UISwipeGestureRecognizerDirectionLeft;
    
    //添加手势到某视图上
    [self.view addGestureRecognizer:swipeGR];


}

-(void)swipe:(UISwipeGestureRecognizer *)gr
{
    NSLog(@"....");


}

@end
