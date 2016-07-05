//
//  main.m
//  day02_5
//
//  Created by student on 15-9-18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRData.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRData *d=[TRData alloc];
        d.year=2015;
        d.month=9;
        d.day=18;
        [d show];
    }
    return 0;
}
