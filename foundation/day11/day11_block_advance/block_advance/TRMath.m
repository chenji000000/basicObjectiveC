//
//  TRMath.m
//  block_advance
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMath.h"

@implementation TRMath
//回调
-(int)progress:(mathBlock)mtB withInt:(int)x otherInt:(int)y
{
    return mtB(x,y);
}

@end
