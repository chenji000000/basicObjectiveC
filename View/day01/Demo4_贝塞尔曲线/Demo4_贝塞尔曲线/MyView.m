//
//  MyView.m
//  Demo4_贝塞尔曲线
//
//  Created by tarena on 15/10/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyView.h"

@implementation MyView

/*最终的绘图动作一定要写在drawRect方法中，因为，系统只允许在这个方法中获取到当前绘图上下文对象，绘图的本质，就是依赖系统的这个上下文对象CGContextRef，所以，只能把绘图动作放在这个方法中
 
 使用UIKit层面中的UIBezierPath类来实现绘制线条UIBezierPath只是对Core Graphics中一部分操作进行了封装，不是能完全替代Core Graphics
 基本图形的绘制使用UIBezierPath就可以实现
 
 
 */
- (void)drawRect:(CGRect)rect {
    //1.创建UIBezierPath实例
    UIBezierPath *path=[UIBezierPath bezierPath];
    
    //2.勾勒图形
    [path moveToPoint:CGPointMake(40, 40)];
    [path addLineToPoint:CGPointMake(40, 140)];
    [path addLineToPoint:CGPointMake(140, 40)];
//    [path closePath];
    
    //3.设置描边或填充的颜色
    [[UIColor redColor] setStroke];
    [[UIColor greenColor] setFill];
    
    //4.path的其他设置
    //设置线宽
    path.lineWidth=20;
    //设置线头的样式
    path.lineCapStyle=kCGLineCapButt;
    //设置线的连接处的样式
    path.lineJoinStyle=kCGLineJoinBevel;
    
    //5.真的绘图（可以描边 可以填充）
    [path stroke];
    [path fill];
    
}


@end
