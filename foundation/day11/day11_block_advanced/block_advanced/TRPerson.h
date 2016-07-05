//
//  TRPerson.h
//  block_advanced
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TRBlock)();

@interface TRPerson : NSObject
-(TRBlock)getBlock;

@end
