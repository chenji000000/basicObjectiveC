//
//  PopView.m
//  气泡视图升级
//
//  Created by tarena on 15/10/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "PopView.h"

@implementation PopView


- (void)drawRect:(CGRect)rect {
    NSMutableDictionary *attributes=[NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName]=[UIColor whiteColor];
    attributes[NSFontAttributeName]=[UIFont systemFontOfSize:15];
    
    CGSize textSize=[self.message boundingRectWithSize:CGSizeMake(200, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    CGRect popRect=CGRectZero;
    popRect.origin.x=self.bounds.size.width-70-textSize.width;
    popRect.origin.y=10;
    popRect.size.width=textSize.width+20;
    popRect.size.height=textSize.height+20;
    
    UIBezierPath *rectPath=[UIBezierPath bezierPathWithRoundedRect:popRect cornerRadius:10];
    
    [[UIColor lightGrayColor] setFill];
    [rectPath fill];
    
    CGPoint startP=CGPointMake(self.bounds.size.width-50, popRect.size.height);
    
    UIBezierPath *triPath=[UIBezierPath bezierPath];
    
    [triPath moveToPoint:startP];
    [triPath addLineToPoint:CGPointMake(startP.x+10, startP.y+10)];
    [triPath addLineToPoint:CGPointMake(startP.x-10, startP.y+10)];
    [triPath closePath];
    [triPath fill];
    
    [self.message drawInRect:CGRectMake(popRect.origin.x+10, popRect.origin.y+10,textSize.width, textSize.height) withAttributes:attributes];
    
    
    
    [self.headerImage drawInRect:CGRectMake(self.bounds.size.width-30, textSize.height+10, 20, 20)];
    
   
    
    
    
    
}


@end
