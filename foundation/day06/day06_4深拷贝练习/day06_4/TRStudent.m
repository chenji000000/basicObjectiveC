//
//  TRStudent.m
//  day06_4
//
//  Created by student on 15-9-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(id)initWithName:(NSString *)name andID:(int)ID andAge:(int)age
{
if(self=[super init])
{
    self.name=name;
    self.ID=ID;
    self.age=age;
}
    return self;
}
-(void)show
{
    NSLog(@"name:%@,ID:%d,age:%d",self.name,self.ID,self.age);
}
-(id)copyWithZone:(NSZone*)zone//NSObject中的，声明在<NSCopying>协议中
{
    TRStudent *stu=[[TRStudent allocWithZone:zone]initWithName:self.name andID:self.ID andAge:self.age];
    return stu;
}


@end
