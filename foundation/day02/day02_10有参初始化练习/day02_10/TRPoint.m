//
//  TRPoint.m
//  day02_10
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRPoint.h"

@implementation TRPoint
-(id)initWithX:(int)x andY:(int)y;
{
if(self=[super init])
{
    self.x=x;
    self.y=y;
}
    return self;
}

-(void)show
{
    NSLog(@"(%d,%d)",self.x,self.y);
}

@end
