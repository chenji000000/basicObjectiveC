//
//  TRHead.m
//  day04_4组合练习
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRHead.h"

@implementation TRHead
-(id)init
{
if(self=[super init])
{
    NSLog(@"头诞生了");
}
    return self;
}
- (void)dealloc
{
    NSLog(@"头死亡了");
}

@end
