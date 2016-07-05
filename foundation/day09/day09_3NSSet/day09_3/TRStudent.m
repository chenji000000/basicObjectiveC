//
//  TRStudent.m
//  day09_3
//
//  Created by student on 15-9-29.
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
-(NSUInteger)hash//大略滤除相同的元素
{
    return self.age;
}
-(BOOL)isEqual:(id)object//精细滤除
{

    if(self==object)
        return YES;
    if([object isMemberOfClass:[TRStudent class]]==YES)
    {
        TRStudent *stu=object;
        if(([self.name isEqualToString:stu.name]==YES)&&self.age==stu.age)
        {
            return YES;//返回YES表示两个对象重复了
        }
    }
    return NO;//返回NO表示两个对象不重复
}
@end
