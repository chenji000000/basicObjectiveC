//
//  TRPoint.m
//  day03_10
//
//  Created by student on 15-9-19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRPoint.h"

@implementation TRPoint
-(id)initWithX:(int)x andY:(int)y
{
if(self=[super init])
{
    self.x=x;
    self.y=y;
    NSLog(@"(%d,%d)被创建了",self.x,self.y);
}
    return self;
}
+(id)pointWithX:(int)x andY:(int)y
{
    TRPoint *p=[[[TRPoint alloc]initWithX:x andY:y]autorelease];//(自动释放池替你释放)autorelease能将对象p放入自动释放池（主要是为了节省内存）
    return p;
}
-(void)show
{
    NSLog(@"(%d,%d)",self.x,self.y);
}
-(void)dealloc
{
    NSLog(@"(%d,%d)被销毁了",self.x,self.y);
    [super dealloc];
}

@end
