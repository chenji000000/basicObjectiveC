//
//  TRStudent.m
//  day08_8创建五个学生对象，按年龄排序（升序，降序）
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(id)initWithAge:(int)age andName:(NSString *)name
{
if(self=[super init])
{
    self.age=age;
    self.name=name;
}
    return self;
}

-(NSComparisonResult)compareAscending:(TRStudent *)otherStu
{
    if(self.age<otherStu.age)
        return NSOrderedAscending;
    else if(self.age>otherStu.age)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}
-(NSComparisonResult)compareDescending:(TRStudent *)otherStu
{
    if(self.age>otherStu.age)
        return NSOrderedAscending;
    else if(self.age<otherStu.age)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"student age:%d,name:%@",self.age,self.name];
}

@end
