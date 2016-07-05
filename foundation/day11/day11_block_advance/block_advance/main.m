//
//  main.m
//  block_advance
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRMath.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a=3,b=5;
        int result;
        TRMath *t=[[TRMath alloc] init];
        mathBlock mta;
        mta=^int(int x, int y) {
            return x+y;
        };
        result=[t progress: mta withInt:b otherInt:a];
        NSLog(@"a+b=%d",result);
        
        result=[t progress:^int(int x, int y) {
            return x-y;
        } withInt:b otherInt:a];
        NSLog(@"b-a=%d",result);
    }
    return 0;
}
