//
//  TRMem.m
//  day03_9
//
//  Created by student on 15-9-19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMem.h"

@implementation TRMem
-(id)initWithName:(NSString *)name andSize:(int)size
{
    if(self=[super init])
    {
        self.name=name;
        self.size=size;
    }
    return self;
}
+(id)MemWithName:(NSString *)name andSize:(int)size
{
    TRMem *mem=[[TRMem alloc] initWithName:name andSize:size];
    return mem;
}

@end
