//
//  TRStudent.m
//  day07_3
//
//  Created by student on 15-9-24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(id)initWithAge:(int)age andGender:(BOOL)gender andSalary:(double)salary
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
    NSLog(@"age:%d,gender:%@,salary:%g",self.age,self.gender?@"male":@"female",self.salary);
}

@end
