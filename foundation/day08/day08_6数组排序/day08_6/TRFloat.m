//
//  TRFloat.m
//  day08_6
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRFloat.h"

@implementation TRFloat
-(id)initWithFloat:(float)f
{
if(self=[super init])
{
    self.f=f;
}
    return self;
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"%f", self.f];
}
-(NSComparisonResult)compareFloat:(TRFloat *)other
{
    if(self.f<other.f)
        return NSOrderedAscending;
    else if(self.f>other.f)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}

@end
