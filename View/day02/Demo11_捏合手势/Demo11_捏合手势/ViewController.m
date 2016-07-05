//
//  ViewController.m
//  Demo11_捏合手势
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
    UIPinchGestureRecognizer *pinchGR=[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [self.view addGestureRecognizer:pinchGR];
    
}


-(void)pinch:(UIPinchGestureRecognizer *)gr
{
//捏合手势对象的核心属性
    //velocity代表动作的速率
    CGFloat velocity=gr.velocity;
    
    //scale代表扩大或缩小的距离的比率
    CGFloat scale=gr.scale;
    
    NSLog(@"velocity=%.2f scale=%.2f",velocity,scale);

}

@end
