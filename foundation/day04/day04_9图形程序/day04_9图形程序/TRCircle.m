//
//  TRCircle.m
//  day04_9图形程序
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRCircle.h"

@implementation TRCircle
-(id)initWithR:(int)r
{
if(self=[super init])
{
    self.r=r;
}
    return self;
}
+(id)circleWithR:(int)r
{
    return [[TRCircle alloc] initWithR:r];
}
-(double)perimeter
{
    return 2*self.r*3.14;
}
-(double)area
{
    return 3.14*self.r*self.r;
}


@end
