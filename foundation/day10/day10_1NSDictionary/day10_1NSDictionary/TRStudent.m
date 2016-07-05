//
//  TRStudent.m
//  day10_1NSDictionary
//
//  Created by tarena on 15/9/30.
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
- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@,age:%d", self.name,self.age];
}
-(NSComparisonResult)compareName:(TRStudent *)other
{
    return [self.name compare:other.name];
}
-(NSComparisonResult)compareAge:(TRStudent *)other
{
    if(self.age>other.age)
        return NSOrderedAscending;
    else if(self.age<other.age)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}
@end
