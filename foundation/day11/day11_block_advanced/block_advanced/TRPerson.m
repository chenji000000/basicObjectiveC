//
//  TRPerson.m
//  block_advanced
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRPerson.h"

@implementation TRPerson
-(TRBlock)getBlock
{
    return ^{
        NSLog(@"welcome to you");
    };
}

@end
