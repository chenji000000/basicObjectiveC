//
//  RectPainting.m
//  Demo05_触控
//
//  Created by xiaoz on 15/9/22.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import "RectPainting.h"
#import "MyRect.h"

@interface RectPainting ()

@property(nonatomic,strong)NSMutableArray *allPath;

@property(nonatomic,strong)MyRect *currentRect;

@property(nonatomic,assign)CGPoint startPoint;
@end

@implementation RectPainting


- (NSMutableArray *)allPath
{
    if (!_allPath) {
        _allPath= [NSMutableArray array];
    }
    return _allPath;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.startPoint = [touch locationInView:self];
    //为本次的按下动作准备一个MyRect的实例
    self.currentRect = [[MyRect alloc]init];
    self.currentRect.borderWidth = self.currentLineWidth;
    self.currentRect.borderColor = self.currentLineColor;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:self];
    self.currentRect.path = [UIBezierPath bezierPathWithRect:CGRectMake(self.startPoint.x, self.startPoint.y, endPoint.x-self.startPoint.x, endPoint.y-self.startPoint.y)];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.allPath addObject:self.currentRect];
}

- (void)drawRect:(CGRect)rect
{
    for (MyRect *rect in self.allPath) {
        [rect.borderColor setStroke];
        rect.path.lineWidth = rect.borderWidth;
        [rect.path stroke];
    }
    //当前正在绘制的还不确定的MyRect
    [self.currentRect.borderColor setStroke];
    self.currentRect.path.lineWidth = self.currentRect.borderWidth;
    [self.currentRect.path stroke];

}





@end
