//
//  TRWorker.m
//  day01_8
//
//  Created by student on 15-9-17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRWorker.h"

@implementation TRWorker

-(void)setName:(NSString *)name andAge:(int)age andSex:(BOOL)sex andSalary:(double)salary
{
    _name=name;
    _age=age;
    _sex=sex;
    _salary=salary;
}

-(void)setName:(NSString *)name
{
    _name=name;
}
-(NSString *)getName
{
    return _name;
}
-(void)setAge:(int)age
{
    _age=age;
}
-(int)getAge
{
    return _age;
}
-(void)setSex:(BOOL)sex
{
    _sex=sex;
}
-(BOOL)getSex
{
    return _sex;
}
-(void)setSalary:(double)salary
{
    _salary=salary;
}
-(double)getSalary
{
    return _salary;
}
-(void)show
{
    NSLog(@"姓名:%@,年龄:%d,性别:%@,薪资:%g",_name,_age,_sex?@"男":@"女",_salary);
}

@end
