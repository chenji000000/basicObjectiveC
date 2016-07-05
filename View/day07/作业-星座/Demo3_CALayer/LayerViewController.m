//
//  LayerViewController.m
//  Demo3_CALayer
//
//  Created by tarena on 15/11/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "LayerViewController.h"

@interface LayerViewController ()

@end

@implementation LayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testImageLayer];
    [self testTextLayer];
    [self testShapeLayer];
}

//测试图片类型的图层
-(void)testImageLayer
{
    CALayer *layer = [CALayer layer];
    //设置图片内容
    layer.contents = (id)[UIImage imageNamed:@"icon152"].CGImage;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(50, 50);
    layer.anchorPoint = CGPointMake(0, 0);
    [self.view.layer addSublayer:layer];
}

//测试文字内容的图层
-(void)testTextLayer
{
    CATextLayer *layer = [CATextLayer layer];
    //设置层中的文字
    layer.string = @"Hello Kitty";
    layer.foregroundColor = [UIColor redColor].CGColor;
    layer.fontSize = 20;
    layer.bounds = CGRectMake(0, 0, 100, 40);
    layer.position = CGPointMake(50, 160);
    layer.anchorPoint = CGPointMake(0, 0);
    layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    [self.view.layer addSublayer:layer];
    
}

//测试图形内容的图层
-(void)testShapeLayer
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path =[UIBezierPath bezierPathWithRoundedRect:CGRectMake(3, 3, 100, 50) cornerRadius:8].CGPath;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.backgroundColor = [UIColor grayColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 120, 100);
    layer.position = CGPointMake(50, 200);
    layer.anchorPoint = CGPointMake(0, 0);
    [self.view.layer addSublayer:layer];
}










@end
