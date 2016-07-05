//
//  MyView.m
//  Demo05_触控
//
//  Created by xiaoz on 15/9/22.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import "MyView.h"

@interface MyView ()

@property(nonatomic,strong)UIBezierPath *path;

@end

@implementation MyView

- (UIBezierPath *)path
{
    if (!_path) {
        _path = [UIBezierPath bezierPath];
        _path.lineWidth = 5;
    }
    return _path;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    //self.path = [UIBezierPath bezierPath];
    [self.path moveToPoint:point];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [self.path addLineToPoint:point];
    //将修改后的path通知系统绘制
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect
{
    [[UIColor redColor] setStroke];
    [self.path stroke];
}


@end
