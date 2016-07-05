//
//  TRPoint.m
//  day06_7比较类信息
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

@end
