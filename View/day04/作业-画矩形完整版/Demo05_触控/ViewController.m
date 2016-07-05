//
//  ViewController.m
//  Demo05_触控
//
//  Created by xiaoz on 15/9/22.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


// 只有触摸控制器自带的视图时才会执行
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self.view];
    
    NSLog(@"touchesBegan:%@",NSStringFromCGPoint(point));
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self.view];
    
    NSLog(@"touchesMoved:%@",NSStringFromCGPoint(point));
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self.view];
    
    NSLog(@"touchesEnded:%@",NSStringFromCGPoint(point));
}




@end
