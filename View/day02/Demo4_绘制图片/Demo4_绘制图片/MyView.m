//
//  MyView.m
//  Demo4_绘制图片
//
//  Created by tarena on 15/10/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyView.h"

@implementation MyView


- (void)drawRect:(CGRect)rect {
    //记录一个圆形的位置
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 120, 120)];
    //沿着此路径，设置圆之外的部分为绘图无效区
    [path addClip];
    
    
    UIImage *image=[UIImage imageNamed:@"icon120"];
    
    [image drawAtPoint:CGPointMake(100, 100)];
    
    //打水印
    NSString *s=@"X";
    
    NSMutableDictionary *attributes=[NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName]=[UIColor redColor];
    attributes[NSFontAttributeName]=[UIFont boldSystemFontOfSize:35];
    
    [s drawAtPoint:CGPointMake(147, 160) withAttributes:attributes];

    
    
    
    
    
    
    
//    UIImage *image2=[UIImage imageNamed:@"icon60"];
//     [image2 drawAtPoint:CGPointMake(100, 220)];
//    
//    [image2 drawInRect:CGRectMake(50, 50, 300, 100)];
}


@end
