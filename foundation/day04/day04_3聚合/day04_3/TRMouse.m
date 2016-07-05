//
//  TRMouse.m
//  day04_3
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMouse.h"

@implementation TRMouse
-(id)init
{
if(self=[super init])
{
    NSLog(@"鼠标被创建了");
}
    return self;
}
-(void)dealloc
{
    NSLog(@"鼠标被销毁了");
}
@end
