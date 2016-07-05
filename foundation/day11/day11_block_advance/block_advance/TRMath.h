//
//  TRMath.h
//  block_advance
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
//mathBlock是block int(^)(int x,int y)类型的别名
typedef int(^mathBlock)(int x,int y);

@interface TRMath : NSObject
-(int)progress:(mathBlock)mtB withInt:(int) x otherInt:(int) y;
@end
