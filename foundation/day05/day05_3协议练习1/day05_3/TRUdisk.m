//
//  TRUdisk.m
//  day05_3
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRUdisk.h"

@implementation TRUdisk
-(void)read:(int)bytes
{
    NSLog(@"从U盘中读取%d个字节",bytes);
}
-(void)write:(int)bytes
{
    NSLog(@"向U盘写入%d个字节",bytes);
}

@end
