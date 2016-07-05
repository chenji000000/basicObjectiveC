//
//  TRMyClass.m
//  day05_9
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMyClass.h"

@interface TRMyClass()
{
    int age;
}
@property BOOL sex;
-(void)addMethod;
@end

@implementation TRMyClass
-(void)method
{
    NSLog(@"method");
}
-(void)addMethod
{
    NSLog(@"addmethod");
}

@end
