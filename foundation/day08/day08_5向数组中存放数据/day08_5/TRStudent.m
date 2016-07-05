//
//  TRStudent.m
//  day08_5
//
//  Created by student on 15-9-28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(NSString *)description//重写description方法的实现，该方法用于在NSLog中用%@输出TRStudent类的对象值
{
    NSString *result=[NSString stringWithFormat:@"name:%@,age:%d",self.name,self.age];
    return result;
}

@end
