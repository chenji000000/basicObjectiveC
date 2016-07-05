//
//  TRFraction+initializer.m
//  day05_4
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRFraction+initializer.h"

@implementation TRFraction (initializer)
-(id)initWithN:(int)n andD:(int)d
{
if(self=[super init])
{
    self.n=n;
    self.d=d;
}
    return self;
}
+(id)fractionWithN:(int)n andD:(int)d
{
    TRFraction *f=[[TRFraction alloc] initWithN:n andD:d];
    return f;
}

@end
