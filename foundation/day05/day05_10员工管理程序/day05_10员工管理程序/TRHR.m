//
//  TRHR.m
//  day05_10员工管理程序
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRHR.h"
#import "TRStaff.h"

@implementation TRHR
+(TREmployee *)hrByNum:(int)num
{
switch(num)
{
    case 1:
        return [TRStaff staffWithName:@"张三" andJob:@"软件工程师" andSalary:6000];
        break;
    case 2:
        return [TRStaff staffWithName:@"李四" andJob:@"测试工程师" andSalary:4500];
        break;
    case 3:
        return [TRStaff staffWithName:@"王五" andJob:@"高级软件工程师" andSalary:8000];
        break;
    default:
        return nil;
}
}

@end
