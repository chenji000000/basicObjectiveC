//
//  TRSquare.m
//  day04_9图形程序
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRSquare.h"

@implementation TRSquare
-(id)initWithX:(int)x
{
if(self=[super init])
{
    self.x=x;
    self.y=x;
}
    return self;
}
+(id)squareWithX:(int)x
{
    return [[TRSquare alloc] initWithX:x];
}

@end
