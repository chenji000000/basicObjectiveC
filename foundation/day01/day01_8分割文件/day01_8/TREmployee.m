//
//  TRWorker.m
//  day01_8
//
//  Created by student on 15-9-17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TREmployee.h"

@implementation TREmployee

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
-(void)setGender:(BOOL)gender
{
    _gender=gender;
}
-(BOOL)getGender
{
    return _gender;
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
    NSLog(@"姓名:%@,年龄:%d,性别:%@,薪资:%g",_name,_age,_gender?@"男":@"女",_salary);
}

@end
