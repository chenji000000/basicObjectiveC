//
//  ViewController.m
//  Demo9_长按手势
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
    
    UILongPressGestureRecognizer *longGR=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    
    //长按手势特有的设置，就是最小时间间隔
    longGR.minimumPressDuration=2;
    
    
    [self.view addGestureRecognizer:longGR];
    
    
}

-(void)longPress:(UILongPressGestureRecognizer *)gr
{
    CGPoint point=[gr locationInView:self.view];
    NSLog(@"%@",NSStringFromCGPoint(point));
    
//    NSLog(@"...");

}

@end
