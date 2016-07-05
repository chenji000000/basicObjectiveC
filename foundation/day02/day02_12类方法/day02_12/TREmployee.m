//
//  TREmployee.m
//  day02_12
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TREmployee.h"

@implementation TREmployee
-(void)show
{
    NSLog(@"姓名：%@",self.name);
}
+(void)classMethod
{
    NSLog(@"这是一个类方法");
}

@end
