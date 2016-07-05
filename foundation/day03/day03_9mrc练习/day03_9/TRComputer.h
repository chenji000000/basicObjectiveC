//
//  TRComputer.h
//  day03_9
//
//  Created by student on 15-9-19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRCPU.h"
#import "TRMem.h"

@interface TRComputer : NSObject
@property(retain) TRCPU *cpu;
@property(retain) TRMem *mem;
-(void)playgame;

@end
