//
//  TRHippo.m
//  day04_8
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRHippo.h"

@implementation TRHippo
-(void)eat:(TRFood *)food
{
    NSLog(@"%@在慢慢吃%@",self.name,food.name);
}

@end
