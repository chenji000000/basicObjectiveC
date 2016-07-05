//
//  TRStudent.m
//  day11_重构使用Block方式，对学生对象进行排序
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@,age:%d", self.name,self.age];
}

@end
