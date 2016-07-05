//
//  RectView.m
//  Demo05_触控
//
//  Created by xiaoz on 15/9/22.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import "RectView.h"

@interface RectView ()

//记录所有已经确定了大小，固定了大小的所有矩形路径
@property(nonatomic,strong)NSMutableArray *allPath;

//记录当前正在绘制，还不确定的那个矩形路径
@property(nonatomic,strong)UIBezierPath *path;

//记录矩形的起点
@property(nonatomic,assign)CGPoint startPoint;

@end

@implementation RectView
- (NSMutableArray *)allPath
{
    if (!_allPath) {
        _allPath = [NSMutableArray array];
    }
    return _allPath;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    self.startPoint = point;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:self];
    self.path = [UIBezierPath bezierPathWithRect:CGRectMake(self.startPoint.x, self.startPoint.y, endPoint.x-self.startPoint.x, endPoint.y-self.startPoint.y)];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //将新建的矩形路径记录到数组中
    [self.allPath addObject:self.path];
}

- (void)drawRect:(CGRect)rect
{
    //将数组中记录的所有path都画一遍
    for (UIBezierPath *path in self.allPath) {
        [path stroke];
    }
    //将当前正在绘制，还没确定是否添加到数组中永久记录
    //的那个self.path也要随时随地画出来
    [self.path stroke];
}








@end
