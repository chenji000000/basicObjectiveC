//
//  TRPoint.m
//  day02_11
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRPoint.h"

@implementation TRPoint
-(id)init
{
if(self=[super init])//
{
    self.x=10;
    self.y=20;
}
    return self;
}
-(void)print
{
    NSLog(@"这是一个私有函数");
}
-(void)show
{
    [self print];
    NSLog(@"(%d,%d)",self.x,self.y);
}

@end
