//
//  TRStudent.m
//  day02_6
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(void)show
{
    NSLog(@"姓名:%@,年龄:%d,性别:%@,奖金:%g",self.name,self.age,self.gender?@"男":@"女",self.salary);
}

@end
