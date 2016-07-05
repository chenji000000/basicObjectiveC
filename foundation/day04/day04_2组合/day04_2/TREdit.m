//
//  TREdit.m
//  day04_2
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TREdit.h"

@implementation TREdit
-(id)init
{
if(self=[super init])
{
    NSLog(@"编辑框被创建了");
}
    return self;
}
-(void)dealloc
{
    NSLog(@"编辑框被销毁了");
}

@end
