//
//  otherView.m
//  Demo5_触控
//
//  Created by tarena on 15/10/29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "otherView.h"

@interface otherView()
@property(nonatomic,strong)NSMutableArray *allPath;

@end

@implementation otherView

-(NSMutableArray *)allPath
{
    if (!_allPath) {
        _allPath=[NSMutableArray array];
    }
    return _allPath;

}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    CGPoint startPoint=[touch locationInView:self];
    
    UIBezierPath *path=[UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    //将本次新的触点的开始对应的path存到数组中
    [self.allPath addObject:path];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:self];
    //数组中的最后一个path对象，就是当前正在绘制的路径
    UIBezierPath *path=[self.allPath lastObject];
    [path addLineToPoint:point];
    //重绘
    [self setNeedsDisplay];

}

- (void)drawRect:(CGRect)rect {
    [[UIColor greenColor] setStroke];
    for (UIBezierPath *path in self.allPath) {
        [path stroke];
    }
}


@end
