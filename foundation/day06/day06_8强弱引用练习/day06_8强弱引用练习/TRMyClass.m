//
//  TRMyClass.m
//  day06_8强弱引用练习
//
//  Created by student on 15-9-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMyClass.h"

@implementation TRMyClass
-(void)method
{
    NSLog(@"method方法执行了");
}
-(void)dealloc
{
    NSLog(@"对象销毁了");
}

@end
