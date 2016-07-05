//
//  TRMovedisk.m
//  day05_3
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMovedisk.h"

@implementation TRMovedisk
-(void)read:(int)bytes
{
    NSLog(@"从移动硬盘中读取%d个字节",bytes);
}
-(void)write:(int)bytes
{
    NSLog(@"向移动硬盘中写入%d个字节",bytes);
}

@end
