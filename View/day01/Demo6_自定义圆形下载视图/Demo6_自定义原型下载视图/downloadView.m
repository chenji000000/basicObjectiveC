//
//  downloadView.m
//  Demo6_自定义原型下载视图
//
//  Created by tarena on 15/10/27.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "downloadView.h"

@implementation downloadView


- (void)drawRect:(CGRect)rect {
    UIBezierPath *path=[UIBezierPath bezierPath];
    
    CGPoint center=CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    
    CGFloat minWidth=MIN(self.bounds.size.width,self.bounds.size.height);
    
    //设计圆弧
    [path addArcWithCenter:center radius:minWidth/2-10 startAngle:M_PI_2*3 endAngle:M_PI_2*3+self.downloadValue*2*M_PI clockwise:YES];
    
    
    //设置颜色
    //if(self) if(self!=nil)
    if (self.downloadColor) {
        [self.downloadColor setStroke];
    }else{
        [[UIColor blueColor] setStroke];
    }
    path.lineWidth=8;
    
    [path stroke];
    
    
    
    
}


@end
