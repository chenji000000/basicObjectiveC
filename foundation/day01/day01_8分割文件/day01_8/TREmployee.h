//
//  TRWorker.h
//  day01_8
//
//  Created by student on 15-9-17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TREmployee : NSObject
{
    NSString* _name;
    int _age;
    BOOL _gender;
    double _salary;
}
-(void)setName:(NSString*)name;
-(NSString*)getName;
-(void)setAge:(int)age;
-(int)getAge;
-(void)setGender:(BOOL)gender;
-(BOOL)getGender;
-(void)setSalary:(double)salary;
-(double)getSalary;
-(void)show;
@end
