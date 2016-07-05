//
//  ViewController.m
//  Demo12_旋转手势
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
    UIRotationGestureRecognizer *rotationGR=[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [self.view addGestureRecognizer:rotationGR];
}

-(void)rotation:(UIRotationGestureRecognizer *)gr
{
//旋转手势的核心属性，就是获取旋转的弧度数
    CGFloat r=gr.rotation;
    NSLog(@"%.2f",r);
}

@end
