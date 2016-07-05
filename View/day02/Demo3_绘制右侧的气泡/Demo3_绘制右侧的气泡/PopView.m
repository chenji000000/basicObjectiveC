//
//  PopView.m
//  Demo3_绘制右侧的气泡
//
//  Created by tarena on 15/10/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "PopView.h"

@implementation PopView


- (void)drawRect:(CGRect)rect {
    
    NSMutableDictionary *attributes=[NSMutableDictionary dictionary];
    attributes[NSFontAttributeName]=[UIFont systemFontOfSize:15];
    attributes[NSForegroundColorAttributeName]=[UIColor whiteColor];
    

    //1.计算文字的宽高
    CGSize textSize=[self.message boundingRectWithSize:CGSizeMake(200, 998) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    //2.画底色——灰色的气泡
    CGRect popRect=CGRectZero;
    popRect.origin.x=self.bounds.size.width-40-textSize.width;
    popRect.origin.y=10;
    popRect.size.width=textSize.width+20;
    popRect.size.height=textSize.height+20;
    
    UIBezierPath *rectPath=[UIBezierPath bezierPathWithRoundedRect:popRect cornerRadius:10];
    
    [[UIColor lightGrayColor] setFill];
    [rectPath fill];
    
    
    //3.绘制三角形
    CGPoint startP=CGPointMake(self.bounds.size.width-20, popRect.size.height);
    
    UIBezierPath *triPath=[UIBezierPath bezierPath];
    
    [triPath moveToPoint:startP];
    [triPath addLineToPoint:CGPointMake(startP.x+10, startP.y+10)];
    [triPath addLineToPoint:CGPointMake(startP.x-10, startP.y+10)];
    [triPath closePath];
    [triPath fill];
    
    //4.绘制字符串
    [self.message drawInRect:CGRectMake(popRect.origin.x+10, popRect.origin.y+10, textSize.width, textSize.height) withAttributes:attributes];
    
    
    
    
}


@end
