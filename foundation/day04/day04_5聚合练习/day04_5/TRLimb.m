//
//  TRLimb.m
//  day04_4组合练习
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRLimb.h"

@implementation TRLimb
-(id)init
{
    if(self=[super init])
    {
        NSLog(@"四肢诞生了");
    }
    return self;
}
- (void)dealloc
{
    NSLog(@"四肢死亡了");
}
@end
