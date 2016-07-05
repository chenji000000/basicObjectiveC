//
//  TRAnimal.m
//  day04_4组合练习
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRAnimal.h"


@implementation TRAnimal
-(id)init
{
if(self=[super init])
{
    NSLog(@"动物诞生了");
    head=[[TRHead alloc] init];
    limb=[[TRLimb alloc] init];
    truck=[[TRTruck alloc] init];
}
    return self;
}
- (void)dealloc
{
    NSLog(@"动物死亡了");
}

@end
