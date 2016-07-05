//
//  TRDog.m
//  day04_6
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDog.h"

@implementation TRDog
-(void)watchHome
{
    NSLog(@"狗狗%@正在看家",self.name);
}
-(void)eat
{
    NSLog(@"狗狗%@正在啃骨头",self.name);
}

@end
