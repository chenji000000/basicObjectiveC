//
//  TRTeacher.m
//  day07_2
//
//  Created by student on 15-9-24.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRTeacher.h"

@implementation TRTeacher
-(id)initWithName:(NSString *)name andCourse:(NSString *)course
{
if(self=[super init])
{
    self.name=name;
    self.course=course;
}
    return self;
}
-(void)teaching
{
    NSLog(@"教师%@正在教%@课程",self.name,self.course);
}
-(id)copyWithZone:(NSZone *)zone
{
    TRTeacher *t=[[TRTeacher allocWithZone:zone] initWithName:self.name andCourse:self.course];
    return t;
}

@end
