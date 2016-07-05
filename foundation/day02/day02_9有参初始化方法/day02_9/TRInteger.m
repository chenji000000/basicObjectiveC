//
//  TRInteger.m
//  day02_9
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRInteger.h"

@implementation TRInteger
-(id)initWithInteger:(int)integer
{
    if(self=[super init])
    {
        self.integer=integer;
    }
    return self;
}
-(void)show
{
    NSLog(@"%d",self.integer);
}

@end
