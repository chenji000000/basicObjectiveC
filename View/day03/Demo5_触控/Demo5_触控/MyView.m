//
//  MyView.m
//  Demo5_触控
//
//  Created by tarena on 15/10/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyView.h"

@interface MyView ()
//方式一：将所有线条都记录到了同一个path对象中
@property(nonatomic,strong)UIBezierPath *path;

@end


@implementation MyView

-(UIBezierPath *)path
{

    if (!_path) {
        _path=[UIBezierPath bezierPath];
    }
    return _path;
}

-(void)drawRect:(CGRect)rect
{
    
    
    [[UIColor blackColor] setStroke];
    self.path.lineWidth=5;
    [self.path stroke];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //将touches集合中唯一的那个触点对象取出
    UITouch *touch=[touches anyObject];
    
    //获取触点的坐标
   CGPoint point=[touch locationInView:self];
    
    //按下时，作为路径的起点
//    self.path=[UIBezierPath bezierPath];
    [self.path moveToPoint:point];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //将touches集合中唯一的那个触点对象取出
    UITouch *touch=[touches anyObject];
    
    //获取触点的坐标
    CGPoint point=[touch locationInView:self];
   
    //修改路径，在当前点的基础上添加一条直线
    [self.path addLineToPoint:point];
    //只要修改了路径，那么就要立刻画出来
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //将touches集合中唯一的那个触点对象取出
    UITouch *touch=[touches anyObject];
    
    //获取触点的坐标
    CGPoint point=[touch locationInView:self];
    
    NSLog(@"%@",NSStringFromCGPoint(point));

}



@end
