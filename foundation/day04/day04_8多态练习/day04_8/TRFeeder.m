//
//  TRFeeder.m
//  day04_8
//
//  Created by student on 15-9-21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRFeeder.h"

@implementation TRFeeder
-(void)feedForAnimal:(TRAnimal *)animal WithFood:(TRFood *)food
{
    [animal eat:food];
}

@end
