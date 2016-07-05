//
//  TRComputer.m
//  day03_9
//
//  Created by student on 15-9-19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRComputer.h"

@implementation TRComputer
-(void)playgame
{
    NSLog(@"%@,%g GHz,%@,%d GB size",self.cpu.name,self.cpu.Hz,self.mem.name,self.mem.size);

}

@end
