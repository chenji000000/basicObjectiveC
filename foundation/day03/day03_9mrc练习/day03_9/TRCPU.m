//
//  TRCPU.m
//  day03_9
//
//  Created by student on 15-9-19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRCPU.h"

@implementation TRCPU
-(id)initWithName:(NSString *)name andHz:(double)Hz
{
if(self=[super init])
{
    self.name=name;
    self.Hz=Hz;
}
    return self;
}
+(id)CPUWithName:(NSString *)name andHz:(double)Hz
{
    TRCPU *cpu=[[TRCPU alloc] initWithName:name andHz:Hz];
    return cpu;
}

@end
