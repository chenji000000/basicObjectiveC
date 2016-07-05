//
//  TRButton.m
//  day04_2
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRButton.h"

@implementation TRButton
-(id)init
{
if(self=[super init])
{
    NSLog(@"按钮被创建了");
}
    return self;
}
-(void)dealloc
{
    NSLog(@"按钮被销毁了");
}
@end
