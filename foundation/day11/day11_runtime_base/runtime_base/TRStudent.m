//
//  TRStudent.m
//  runtime_base
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
+(void)load
{
    NSLog(@"TRStudent ------load");
}
+(void)test
{
    NSLog(@"类对象的消息...");
}
-(void)test
{
    NSLog(@"实例消息...");
}
@end
