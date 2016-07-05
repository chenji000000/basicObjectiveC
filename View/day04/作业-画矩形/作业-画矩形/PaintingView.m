//
//  PaintingView.m
//  作业-画矩形
//
//  Created by tarena on 15/10/30.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "PaintingView.h"

@interface PaintingView ()

// 每次按下时的起点坐标,也就是要画得矩形的左顶点
@property(nonatomic)CGPoint startPoint;

// 记录正在绘制的矩形路径
@property(nonatomic,strong)UIBezierPath *currentPath;

// 记录所有矩形路径的数组
@property(nonatomic,strong)NSMutableArray *allPath;

@end

@implementation PaintingView

- (NSMutableArray *)allPath
{
    if (!_allPath) {
        _allPath = [NSMutableArray array];
    }
    return _allPath;
}


- (void)drawRect:(CGRect)rect
{
    [[UIColor redColor]setStroke];
    
    [self.currentPath stroke];
    
    for (UIBezierPath *path in self.allPath) {
       
        [path stroke];
    }
   
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.startPoint = [touch locationInView:self];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch =[touches anyObject];
    CGPoint endPoint =[touch locationInView:self];
    
    //基于起点和终点绘制矩形
    self.currentPath = [UIBezierPath bezierPathWithRect:CGRectMake(self.startPoint.x, self.startPoint.y, endPoint.x-self.startPoint.x, endPoint.y-self.startPoint.y)];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.allPath addObject:self.currentPath];
}





@end
