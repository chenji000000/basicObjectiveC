//
//  main.m
//  day03_9
//
//  Created by student on 15-9-19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRComputer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRCPU *cpu=[[TRCPU alloc] init];
        cpu.name=@"Intel i3";
        cpu.Hz=2.8;
        
        TRMem *mem=[[TRMem alloc] init];
        mem.name=@"KingMax";
        mem.size=2;
        
        TRComputer *com=[[TRComputer alloc] init];
        com.cpu=cpu;
        com.mem=mem;
        [com playgame];
    }
    return 0;
}
