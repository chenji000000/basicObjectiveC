//
//  TRStudent.m
//  day06_5
//
//  Created by student on 15-9-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(id)initWithAge:(int)age andBook:(TRBook *)book
{
if(self=[super init])
{
    self.age=age;
    self.book=book;
}
    return self;
}
-(void)study
{
    NSLog(@"年龄为%d的学生学习价格为%d的书",self.age,self.book.price);
}

@end
