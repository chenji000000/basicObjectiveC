//
//  PieChartView.m
//  Demo02_饼图
//
//  Created by xiaoz on 15/9/22.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import "PieChartView.h"
#import "PieChartItem.h"

@implementation PieChartView


- (void)drawRect:(CGRect)rect {
    CGFloat startA = M_PI_2*3;
    CGFloat endA = 0;
    // 遍历每一个数据，分别绘制圆弧
    for (PieChartItem *item in self.data) {
        endA = startA + item.value*2*M_PI;
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path addArcWithCenter:CGPointMake(160, 300) radius:self.radius startAngle:startA  endAngle:endA clockwise:YES];
        //添加到圆心的直线
        [path addLineToPoint:CGPointMake(160, 300)];
        [item.color setFill];
        [path fill];
        //为下一个部分做准备，则开始弧度是上一次的结束弧度
        startA = endA;
    }
    
    
}


@end
