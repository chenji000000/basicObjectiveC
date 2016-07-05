//
//  main.m
//  day03_10
//
//  Created by student on 15-9-19.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPoint.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRPoint *p=[TRPoint pointWithX:10 andY:20];
        NSLog(@"-------1--------");
        //[p release];
    }//当自动释放池的作用域结束时，将把其中的所有对象都释放
    NSLog(@"-------2-------");
    return 0;
}
