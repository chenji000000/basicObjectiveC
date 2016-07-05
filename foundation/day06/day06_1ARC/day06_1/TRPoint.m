//
//  TRPoint.m
//  day06_1
//
//  Created by student on 15-9-23.
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
    }
    return self;
}
+(id)pointWithX:(int)x andY:(int)y
{
 TRPoint *p=[[TRPoint alloc] initWithX:x andY:y];
 return p;
}
-(void)show
{
    NSLog(@"(%d,%d)",self.x,self.y);
}
-(void)dealloc
{
    NSLog(@"(%d,%d)被释放了",self.x,self.y);
    //[super dealloc];//ARC禁止调用dealloc方法，编译器会自动添加
}


@end
