//
//  TRTruck.m
//  day04_4组合练习
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRTruck.h"

@implementation TRTruck
-(id)init
{
    if(self=[super init])
    {
        NSLog(@"躯干诞生了");
    }
    return self;
}
- (void)dealloc
{
    NSLog(@"躯干死亡了");
}

@end
