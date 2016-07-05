//
//  TRStudent.m
//  day08_7
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(id)initWithName:(NSString *)name andAge:(int)age
{
if(self=[super init])
{
    self.name=name;
    self.age=age;
}
    return self;
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"name:%@,age:%d",self.name,self.age];
}
-(NSComparisonResult)compareName:(TRStudent *)other
{
    return [self.name compare:other.name];
}
-(id)copyWithZone:(NSZone *)zone
{
    TRStudent *s=[[TRStudent allocWithZone:zone] initWithName:self.name andAge:self.age];
    return s;
}

@end
