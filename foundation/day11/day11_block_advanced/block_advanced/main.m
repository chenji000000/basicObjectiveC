//
//  main.m
//  block_advanced
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRPerson *tp=[[TRPerson alloc] init];
        TRBlock bloc=[tp getBlock];
        bloc();
    }
    return 0;
}
