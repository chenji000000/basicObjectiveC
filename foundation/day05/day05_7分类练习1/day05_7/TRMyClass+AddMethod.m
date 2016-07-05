//
//  TRMyClass+AddMethod.m
//  day05_7
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMyClass+AddMethod.h"

@implementation TRMyClass (AddMethod)
-(void)method2
{
    self.property=18;//可以访问主类的属性
    NSLog(@"method2被执行了");
}

@end
