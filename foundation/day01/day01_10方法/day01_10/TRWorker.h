//
//  TRWorker.h
//  day01_8
//
//  Created by student on 15-9-17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRWorker : NSObject
{
    NSString* _name;
    int _age;
    BOOL _sex;
    double _salary;
}
-(void)setName:(NSString*)name andAge:(int)age andSex:(BOOL)sex andSalary:(double)salary;//带多个参数的方法
-(void)setName:(NSString*)name;//带一个参数的方法
-(NSString*)getName;//无参方法
-(void)setAge:(int)age;
-(int)getAge;
-(void)setSex:(BOOL)sex;
-(BOOL)getSex;
-(void)setSalary:(double)salary;
-(double)getSalary;
-(void)show;
@end
