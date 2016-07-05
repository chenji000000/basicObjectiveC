//
//  MyView.m
//  Demo1_绘制曲线
//
//  Created by tarena on 15/10/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyView.h"

@implementation MyView

/*
 绘图的最重要的对象：绘图上下文对象CGContextRef
 使用UIBezierPath的时候，它的内部自动获取及使用上下文对象了
 drawRect:
    在创建View实例时，自动被系统调用一次
 如果一旦View内的数据变更了，需要根据新的数据重新绘制界面时也不能手动调用这个方法
 需要调用视图的setNeedsDisplay方法通知系统重新绘制界面
 
 */
- (void)drawRect:(CGRect)rect {
    UIBezierPath *path=[UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(250, 40)];
    
    [path addCurveToPoint:CGPointMake(40, 250) controlPoint1:CGPointMake(40, 40) controlPoint2:CGPointMake(250, 250)];
    
    [path addCurveToPoint:CGPointMake(250, 460) controlPoint1:CGPointMake(250, 250) controlPoint2:CGPointMake(40, 460)];
    
    
    
    [[UIColor redColor] setStroke];
    
    path.lineWidth=5;
    
    [path stroke];
    
    
    
    
}


@end
