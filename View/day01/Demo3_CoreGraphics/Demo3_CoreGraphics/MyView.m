//
//  MyView.m
//  Demo3_CoreGraphics
//
//  Created by tarena on 15/10/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyView.h"

@implementation MyView


- (void)drawRect:(CGRect)rect {
    
    //获取已经存在的绘图上下文对象
    //系统最终会将绘图上下文中记录的数据编程图像，为了影响最终绘制出来的结果，所以，就需要修改唯一的绘图上下文对象中记录的数据
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 40, 40);
    CGContextAddLineToPoint(context, 40, 140);
    CGContextAddLineToPoint(context, 140, 40);
    CGContextAddLineToPoint(context, 40, 40);
    //设置描边的颜色
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetFillColorWithColor(context, [[UIColor greenColor] CGColor]);
    //按照context中记录的设置和路径真的来绘制了
//    CGContextStrokePath(context);
//    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
}


@end
