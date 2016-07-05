//
//  main.m
//  day05_5
//
//  Created by student on 15-9-22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRInteger.h"
#import "TRInteger+TRStart.h"
#import "TRInteger+Math.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRInteger *i1=[[TRInteger alloc] initWithX:10];
        TRInteger *i2=[[TRInteger alloc] initWithX:20];
        TRInteger *i3;
        i3=[i2 add:i1];
        [i3 show];
        i3=[i2 sub:i1];
        [i3 show];
        i3=[i2 mul:i1];
        [i3 show];
        i3=[i2 div:i1];
        [i3 show];
    }
    return 0;
}
