//
//  MyView.m
//  Demo5_绘制圆弧
//
//  Created by tarena on 15/10/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyView.h"

@implementation MyView


- (void)drawRect:(CGRect)rect {
    //创建实例
    UIBezierPath *path=[UIBezierPath bezierPath];
    //勾勒路径
    [path addArcWithCenter:CGPointMake(160, 240) radius:100 startAngle:M_PI_2*3 endAngle:M_PI*2 clockwise:YES];
    //设置描边的颜色
    [[UIColor blueColor] setStroke];
    
    path.lineWidth=5;
    
    [path stroke];
   
    
    //创建圆角矩形
    UIBezierPath *path1=[UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(20, 10)];
    [path1 addLineToPoint:CGPointMake(200, 10)];
    [path1 addArcWithCenter:CGPointMake(200, 20) radius:10 startAngle:M_PI_2*3 endAngle:M_PI*2 clockwise:YES];
    [path1 addLineToPoint:CGPointMake(210, 100)];
    [path1 addArcWithCenter:CGPointMake(200, 100) radius:10 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path1 addLineToPoint:CGPointMake(20, 110)];
    [path1 addArcWithCenter:CGPointMake(20, 100) radius:10 startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    [path1 addLineToPoint:CGPointMake(10, 20)];
    [path1 addArcWithCenter:CGPointMake(20, 20) radius:10 startAngle:M_PI endAngle:M_PI_2*3 clockwise:YES];
    [[UIColor blueColor] setStroke];
    path1.lineWidth=5;
    [path1 stroke];
    
    
    //创建圆角矩形
    UIBezierPath *path2=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(40, 200, 200, 100) cornerRadius:10];
    [[UIColor greenColor] setStroke];
        path2.lineWidth=5;
        [path2 stroke];
    
    //绘制椭圆
    UIBezierPath *path3=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(40, 400, 200, 100)];
    [path3 stroke];
    
}


@end
