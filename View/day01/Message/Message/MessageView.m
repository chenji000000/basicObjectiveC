//
//  MessageView.m
//  Message
//
//  Created by tarena on 15/10/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MessageView.h"

@implementation MessageView


- (void)drawRect:(CGRect)rect {
    UIBezierPath *path=[UIBezierPath bezierPath];
    
    
    [path moveToPoint:CGPointMake(self.bounds.size.width-230, 10)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width-30, 10)];
    [path addArcWithCenter:CGPointMake(self.bounds.size.width-30, 20) radius:10 startAngle:M_PI_2*3 endAngle:M_PI*2 clockwise:YES];
    [path addLineToPoint:CGPointMake(self.bounds.size.width-20, 120)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width-10, 130)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width-230, 130)];
    [path addArcWithCenter:CGPointMake(self.bounds.size.width-230, 120) radius:10 startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(self.bounds.size.width-240, 20)];
    [path addArcWithCenter:CGPointMake(self.bounds.size.width-230, 20) radius:10 startAngle:M_PI endAngle:M_PI_2*3 clockwise:YES];
    
    [[UIColor grayColor] setStroke];
    
    
    
    [path stroke];
    
}


@end
