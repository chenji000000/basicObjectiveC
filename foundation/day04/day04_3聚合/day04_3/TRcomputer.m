//
//  TRcomputer.m
//  day04_3
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRcomputer.h"

@implementation TRcomputer
-(id)init
{
if(self=[super init])
{
    NSLog(@"计算机被创建了");
}
    return self;
}
-(void)dealloc
{
    NSLog(@"计算机被销毁了");
}
@end
