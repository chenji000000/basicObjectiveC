//
//  TRStaff.m
//  day05_10员工管理程序
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStaff.h"

@implementation TRStaff
-(id)initWithName:(NSString *)name andJob:(NSString *)job andSalary:(float)salary
{
if(self=[super init])
{
    self.name=name;
    self.job=job;
    self.salary=salary;
}
    return self;
}
+(id)staffWithName:(NSString *)name andJob:(NSString *)job andSalary:(float)salary
{
    TRStaff *staff=[[TRStaff alloc] initWithName:name andJob:job andSalary:salary];
    return staff;
}
-(void)print
{
    NSLog(@"name:%@,job:%@,salary:%g",self.name,self.job,self.salary);
}

@end
