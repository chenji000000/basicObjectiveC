//
//  TRInteger+TRStart.m
//  day05_5
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRInteger+TRStart.h"

@implementation TRInteger (TRStart)
-(id)initWithX:(int)integer
{
if(self=[super init])
{
    self.integer=integer;
}
    return self;
}
+(id)integerWithX:(int)integer
{
    TRInteger *i=[[TRInteger alloc] initWithX:integer];
    return i;
}

@end
