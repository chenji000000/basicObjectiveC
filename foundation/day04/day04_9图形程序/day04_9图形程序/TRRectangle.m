//
//  TRRectangle.m
//  day04_9图形程序
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRRectangle.h"

@implementation TRRectangle
-(id)initWithX:(int)x andY:(int)y
{
if(self=[super init])
{
    self.x=x;
    self.y=y;
}
    return self;
}
+(id)rectangleWithX:(int)x andY:(int)y
{
    return [[TRRectangle alloc] initWithX:x andY:y];
}
-(double)perimeter
{
    return 2*(self.x+self.y);
}
-(double)area
{
    return self.x*self.y;
}

@end
