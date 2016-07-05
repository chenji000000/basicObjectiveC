//
//  TRTeacher.m
//  day09_3
//
//  Created by student on 15-9-29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRTeacher.h"

@implementation TRTeacher
-(id)initWithName:(NSString *)name andCourse:(NSString *)course andID:(int)ID
{
if(self=[super init])
{
    self.name=name;
    self.course=course;
    self.ID=ID;
}
    return self;
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@,course:%@,ID:%d",self.name,self.course,self.ID];
}
-(NSUInteger)hash
{
    return self.ID;
}
-(BOOL)isEqual:(id)object//harsh方法返回值相同时，会调用isEqual方法进一步确定两个对象是否相同
{
    if(self==object)
        return YES;
    if([object isMemberOfClass:[TRTeacher class]]==YES)
    {
        TRTeacher *t=object;
        if((([self.name isEqualToString:t.name]==YES)&&([self.course isEqualToString:t.course]==YES)&&(self.ID==t.ID)))
        {
            return YES;
        }
        
    }
    return NO;
}

@end
