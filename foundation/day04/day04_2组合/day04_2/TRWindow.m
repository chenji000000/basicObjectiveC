//
//  TRWindow.m
//  day04_2
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRWindow.h"

@implementation TRWindow
-(id)init
{
if(self=[super init])
{
    NSLog(@"窗口被创建了");
    button=[[TRButton alloc] init];
    edit=[[TREdit alloc] init];
}
    return self;
}
-(void)dealloc
{
    NSLog(@"窗口被销毁了");
}

@end
