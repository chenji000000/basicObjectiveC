//
//  TRStudent.m
//  day07_9独立实现重构Student和Book类
//
//  Created by student on 15-9-24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(id)initWithAge:(int)age andGender:(char)gender andSalary:(double)salary
{
if(self=[super init])
{
    self.age=age;
    self.gender=gender;
    self.salary=salary;
}
    return self;
}
-(id)copyWithZone:(NSZone *)zone
{
    TRStudent *stu=[[TRStudent allocWithZone:zone] initWithAge:self.age andGender:self.gender andSalary:self.salary];
    return stu;
}
-(void)printInfo
{
    NSLog(@"age:%d,gender:%c,salary:%g",self.age,self.gender,self.salary);
}

@end
